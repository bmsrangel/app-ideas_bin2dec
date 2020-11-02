import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/decimal_cubit.dart';
import '../utilities/utils.dart';
import 'widgets/app_bar/app_bar_widget.dart';
import 'widgets/bottom_card/bottom_card_widget.dart';
import 'widgets/calculate_button/calculate_button_widget.dart';
import 'widgets/custom_text_field/custom_text_field_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _bin$ = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    TextTheme textThemes = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBarWidget(
                        iconData: Icons.refresh,
                        iconSize: width > 500 ? 32.0 : 32.0 * .9,
                        textStyle: width > 500
                            ? textThemes.headline6
                            : textThemes.headline6.copyWith(fontSize: 43.0),
                        onPressed: () {
                          _bin$.clear();
                          _formKey.currentState.reset();
                          context.bloc<DecimalCubit>().clear();
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: BlocConsumer<DecimalCubit, DecimalState>(
                            listener: (context, state) {
                              if (state is DecimalCalculationError) {
                                Utils.showErrorMessage(
                                    scaffoldKey: _scaffoldKey,
                                    message:
                                        "Invalid input. Must contain only 0 and/or 1.");
                              }
                            },
                            builder: (context, state) => _buildResult(
                                state,
                                width > 500
                                    ? textThemes.bodyText1
                                    : textThemes.bodyText1.copyWith(
                                        fontSize: 72.0,
                                      )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BottomCardWidget(
                  child: CustomTextFieldWidget(
                    controller: _bin$,
                    hintText: "Binary number",
                    counterStyle: textThemes.caption,
                    cursorColor: primaryColor,
                    validator: (value) {
                      return Utils.validateInput(value);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CalculateButtonWidget(
        backgroundColor: primaryColor,
        onPressed: () {
          _formKey.currentState.validate();
          context.bloc<DecimalCubit>().bin2dec(_bin$.text);
        },
      ),
    );
  }

  _buildResult(DecimalState state, TextStyle textStyle) {
    if (state is DecimalInitial) {
      return Text(
        "0",
        style: textStyle,
      );
    } else if (state is DecimalCaltculating) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is DecimalResult) {
      return Text(
        state.result.toString(),
        style: textStyle,
      );
    } else {
      return Text(
        "0",
        style: textStyle,
      );
    }
  }
}

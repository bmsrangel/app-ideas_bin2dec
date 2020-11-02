import 'package:flutter/material.dart';

class CalculateButtonWidget extends StatelessWidget {
  const CalculateButtonWidget({
    Key key,
    this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  final Function onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      child: FloatingActionButton(
        backgroundColor: this.backgroundColor,
        onPressed: this.onPressed,
        child: Icon(Icons.calculate),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
    @required this.textStyle,
    this.onPressed,
    this.iconData,
    this.iconSize,
  }) : super(key: key);

  final TextStyle textStyle;
  final Function onPressed;
  final IconData iconData;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Decimal",
            style: textStyle,
          ),
          IconButton(
            icon: Icon(this.iconData),
            color: Colors.white,
            iconSize: this.iconSize,
            onPressed: this.onPressed,
          ),
        ],
      ),
    );
  }
}

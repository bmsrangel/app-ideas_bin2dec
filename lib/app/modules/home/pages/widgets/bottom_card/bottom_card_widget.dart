import 'package:flutter/material.dart';

class BottomCardWidget extends StatelessWidget {
  const BottomCardWidget({
    Key key,
    this.child,
    this.borderRadius = 30.0,
  }) : super(key: key);

  final Widget child;

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(this.borderRadius),
            topRight: Radius.circular(this.borderRadius),
          ),
        ),
        child: this.child,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends TextFormField {
  CustomTextFieldWidget({
    TextEditingController controller,
    FormFieldValidator<String> validator,
    List<TextInputFormatter> inputFormatters,
    String hintText,
    TextStyle counterStyle,
    Color cursorColor,
  }) : super(
          controller: controller,
          validator: validator,
          maxLength: 8,
          keyboardType: TextInputType.number,
          inputFormatters: inputFormatters,
          cursorColor: cursorColor,
          decoration: InputDecoration(
            hintText: hintText,
            hoverColor: Colors.red,
          ),
          buildCounter: (context, {currentLength, isFocused, maxLength}) =>
              Container(
            height: 30.0,
            alignment: Alignment.topLeft,
            child: Text(
              "${currentLength.toString()}/${maxLength.toString()}",
              style: counterStyle,
            ),
          ),
        );
}

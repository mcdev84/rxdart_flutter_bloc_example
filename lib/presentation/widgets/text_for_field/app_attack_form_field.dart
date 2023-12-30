import 'package:flutter/material.dart';
import 'package:rx_dart/constants/layout/styles.dart';
import 'package:rx_dart/constants/layout/text_style.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';

import '../../../shared/validators/text_form_field.dart';

class AppAttackFormField extends StatelessWidget {
  final TextEditingController _controller;
  final TextInputType keyboardType;
  final Widget? icon, label;
  final String? hintText;
  final int? maxLines;

  const AppAttackFormField(
      {required TextEditingController controller,
      required this.hintText,
      required this.label,
      required this.keyboardType,
      this.icon,
      this.maxLines,
      super.key})
      : _controller = controller;

  @override
  Widget build(BuildContext context) => TextFormField(cursorHeight: 16,
      //autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      style: textFormStyle,
      maxLines: maxLines ?? 1,
      onTapOutside: (event) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      validator: (value) => validateInput(value, keyboardType),
      cursorWidth: 2,
      cursorColor: darkGrey,
      controller: _controller,
      decoration: InputDecoration(
          label: label,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          hintText: hintText,
          suffixIcon: icon ?? emptyWidget));
}

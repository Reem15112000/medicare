import 'package:flutter/material.dart';

import '../constant.dart';

class EmailField02 extends StatelessWidget {
  final Text? title;
  final Icon? leading;
  final Icon? tailing;
  var validator;
  final TextInputType? keyboradType;
  final Color? backgroundColor;
  final TextStyle? titleStyle;
  final TextEditingController? controller;

  EmailField02(
      {super.key,
      this.title,
      this.leading,
      this.tailing,
      this.keyboradType,
      this.backgroundColor,
      this.titleStyle,
      this.controller,
      this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboradType ?? TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor ?? Colors.white,
        label: title ?? const Text("Email"),
        labelStyle: titleStyle ?? TextStyle(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: leading ?? Icon(Icons.email_outlined),
      ),
    );
  }
}

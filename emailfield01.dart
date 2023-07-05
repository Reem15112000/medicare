import 'package:flutter/material.dart';

import '../constant.dart';

class EmailField01 extends StatelessWidget {
  final Text? title;
  final Icon? leading;
  final Icon? tailing;
  final TextInputType? keyboradType;
  final Color? backgroundColor;
  final TextStyle? titleStyle;
  final TextEditingController? fieldController;
  const EmailField01(
      {super.key,
      this.title,
      this.leading,
      this.tailing,
      this.keyboradType,
      this.backgroundColor,
      this.titleStyle,
      this.fieldController});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldController,
      keyboardType: keyboradType ?? TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor ?? Colors.white,
        label: title ?? const Text("Email"),
        labelStyle: titleStyle ?? TextStyle(),
        border: OutlineInputBorder(),
        prefixIcon: leading ?? Icon(Icons.email_outlined),
      ),
    );
  }
}

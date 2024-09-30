import 'package:flutter/material.dart';

import 'package:to_do_app/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool? readOnly;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.controller,
    this.readOnly,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      style: Theme.of(context).textTheme.displaySmall,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.displaySmall,
          filled: true,
          fillColor: AppColor.fromColor,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.txtColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.txtColor),
          )),
    );
  }
}

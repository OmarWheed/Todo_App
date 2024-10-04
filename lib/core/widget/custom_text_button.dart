import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final TextStyle? style;

  const CustomTextButton({super.key, required this.text, this.onPressed, this.style});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,
          style: style ??
              Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColor.txtColor.withOpacity(0.44),
                  )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? backgroundColor;
  final String text;
  final void Function()? onPressed;
  const CustomElevatedButton(
      {super.key, this.backgroundColor, this.onPressed, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      //margin:const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.w),
            ),
            textStyle:Theme.of(context).textTheme.displaySmall ,
            backgroundColor: backgroundColor ?? AppColor.blue),
        child: Text(text),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/extension/navigator.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widget/custom_elevated_button.dart';

Future<dynamic> showCustomBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 240.h,
        width: double.infinity,
        color: AppColor.bottomSheetColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedButton(
                onPressed: () {},
                text: AppStrings.completeTask,
              ),
              CustomElevatedButton(
                onPressed: () {},
                backgroundColor: AppColor.pink,
                text: AppStrings.deleteTask,
              ),
              CustomElevatedButton(
                onPressed: () {
                  context.pop();
                },
                text: AppStrings.cancel,
              ),
            ],
          ),
        ),
      );
    },
  );
}

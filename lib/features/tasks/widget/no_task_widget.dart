
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

Column noTaskWidget(BuildContext context) {
  return Column(
    children: [
      Text(
        AppStrings.noTask,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20.sp),
      ),
      10.height,
      Text(
        AppStrings.noTaskDes,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20.sp),
      ),
    ],
  );
}

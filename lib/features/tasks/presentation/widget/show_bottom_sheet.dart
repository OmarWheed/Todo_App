import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/extension/navigator.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widget/custom_elevated_button.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_cubit.dart';

Future<dynamic> showCustomBottomSheet(cxt, {required int index}) {
  return showModalBottomSheet(
    context: cxt,
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
                onPressed: () {
                  BlocProvider.of<TaskCubit>(context).taskIsCompleted(index);
                },
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

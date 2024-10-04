import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widget/custom_elevated_button.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_cubit.dart';

import 'package:to_do_app/features/tasks/presentation/widget/form_add_task.dart';

class AddPageBody extends StatelessWidget {
  const AddPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.r),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: 48.height),
          const SliverToBoxAdapter(child: FormAddTask()),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.only(bottom: 55.w),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BlocListener<TaskCubit, TaskState>(
                  listener: (context, state) {
                    if (state is InsertTaskSuccess) {
                      Navigator.of(context).pop();
                    }
                    if (state is InsertTaskLoading) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("loading"),
                        duration: Duration(milliseconds: 250),
                      ));
                    }
                  },
                  child: CustomElevatedButton(
                    text: AppStrings.createTask,
                    backgroundColor: AppColor.primary,
                    onPressed: () {
                      BlocProvider.of<TaskCubit>(context).addTask();
                    },
                  ),
                ),
              ),
            ),
          ), // Gap
        ],
      ),
    );
  }
}

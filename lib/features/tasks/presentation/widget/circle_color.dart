import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/widget/list_of_color.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_cubit.dart';

class CirCleColor extends StatelessWidget {
  const CirCleColor({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: listOfColor.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var cubit = BlocProvider.of<TaskCubit>(context);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    cubit.setIndexColor(index);
                  },
                  child: CircleAvatar(
                    backgroundColor: listOfColor[index],
                    child: cubit.currentIndex == index
                        ? const Icon(
                            Icons.check,
                            color: AppColor.txtColor,
                          )
                        : null,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

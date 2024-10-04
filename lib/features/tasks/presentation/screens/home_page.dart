import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/extension/navigator.dart';
import 'package:to_do_app/core/routes/app_routes_name.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widget/custom_elevated_button.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/features/tasks/presentation/widget/no_task_widget.dart';
import 'package:to_do_app/features/tasks/presentation/widget/task_item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primary,
          onPressed: () {
            context.pushNamed(AppRoutesName.addPage);
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.r),
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 24.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        BlocProvider.of<TaskCubit>(context)
                            .selectedValue
                            .toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 24.sp),
                      ),
                    ),
                    12.height,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppStrings.today,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 24.sp),
                      ),
                    ),
                    8.height,
                    SizedBox(
                      height: 94.h,
                      child: const OpenDataPicker(),
                    ),
                    20.height,
                    BlocProvider.of<TaskCubit>(context).taskList.isEmpty
                        ? noTaskWidget(context)
                        : const Expanded(
                            child: ListOfTasks(),
                          )
                  ],
                );
              },
            ),
          ),
        ));
  }
}

class OpenDataPicker extends StatelessWidget {
  const OpenDataPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColor.pickerTimeColor,
          selectedTextColor: Colors.white,
          dayTextStyle: Theme.of(context).textTheme.displaySmall!,
          monthTextStyle: Theme.of(context).textTheme.displaySmall!,
          dateTextStyle: Theme.of(context).textTheme.displaySmall!,
          onDateChange: (date) {
            String newFormatDate = DateFormat.yMMMMd().format(date);
            BlocProvider.of<TaskCubit>(context).selectNewData(newFormatDate);
          },
        );
      },
    );
  }
}

class ListOfTasks extends StatelessWidget {
  const ListOfTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state is CompleteSuccess || state is DeleteTaskSuccess) {
          context.pop();
        }
        if (state is CompleteError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage.toString()),
            duration: const Duration(seconds: 3),
          ));
        }
        if (state is DeleteTaskError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage.toString()),
            duration: const Duration(seconds: 3),
          ));
        }
      },
      builder: (context, state) {
        return ListView.builder(
            itemCount: BlocProvider.of<TaskCubit>(context).taskList.length,
            itemBuilder: (context, index) => TaskCard(
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (cxt) {
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
                                    var idCard =
                                        BlocProvider.of<TaskCubit>(context)
                                            .taskList[index]
                                            .id;

                                    BlocProvider.of<TaskCubit>(context)
                                        .taskIsCompleted(idCard!);
                                  },
                                  text: AppStrings.completeTask,
                                ),
                                CustomElevatedButton(
                                  onPressed: () {
                                    var idCard =
                                        BlocProvider.of<TaskCubit>(context)
                                            .taskList[index]
                                            .id;

                                    BlocProvider.of<TaskCubit>(context)
                                        .deleteTask(idCard!);
                                  },
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
                  },
                  title:
                      BlocProvider.of<TaskCubit>(context).taskList[index].title,
                  note:
                      BlocProvider.of<TaskCubit>(context).taskList[index].note,
                  startTime: BlocProvider.of<TaskCubit>(context)
                      .taskList[index]
                      .startTime,
                  endTime: BlocProvider.of<TaskCubit>(context)
                      .taskList[index]
                      .endTime,
                  isCompleted: BlocProvider.of<TaskCubit>(context)
                      .taskList[index]
                      .complete,
                  color:
                      BlocProvider.of<TaskCubit>(context).taskList[index].color,
                ));
      },
    );
  }
}

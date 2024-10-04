import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widget/text_form_field.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_cubit.dart';

class StartAndEndTime extends StatelessWidget {
  const StartAndEndTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.startTime,
                    style: Theme.of(context).textTheme.displaySmall),
                8.height,
                CustomTextFormField(
                  readOnly: true,
                  hintText: BlocProvider.of<TaskCubit>(context).startTime,
                  suffixIcon: IconButton(
                      onPressed: () async {
                        BlocProvider.of<TaskCubit>(context)
                            .getTimeStart(context);
                      },
                      icon: const Icon(
                        Icons.watch_later_outlined,
                        color: Colors.white,
                      )),
                ),
              ],
            )),
            15.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.endTime,
                      style: Theme.of(context).textTheme.displaySmall),
                  8.height,
                  CustomTextFormField(
                    readOnly: true,
                    hintText: context.read<TaskCubit>().endTime,
                    suffixIcon: IconButton(
                        onPressed: () async {
                          BlocProvider.of<TaskCubit>(context)
                              .getTimeEnd(context);
                        },
                        icon: const Icon(
                          Icons.watch_later_outlined,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

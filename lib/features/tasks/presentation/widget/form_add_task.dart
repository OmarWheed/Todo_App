import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/utils/helper.dart';
import 'package:to_do_app/core/widget/text_form_field.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/features/tasks/presentation/widget/circle_color.dart';
import 'package:to_do_app/features/tasks/presentation/widget/start_end_row.dart';

class FormAddTask extends StatelessWidget {
  const FormAddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<TaskCubit>(context).globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.title,
                  style: Theme.of(context).textTheme.displaySmall),
              8.height,
              //text form field
              CustomTextFormField(
                controller: BlocProvider.of<TaskCubit>(context).controllerTitle,
                hintText: AppStrings.titleHint,
              ),
              24.height,
              Text(AppStrings.note,
                  style: Theme.of(context).textTheme.displaySmall),
              8.height,
              //text form field
              CustomTextFormField(
                controller: BlocProvider.of<TaskCubit>(context).controllerNote,
                hintText: AppStrings.noteHint,
              ),
              24.height,
              Text(AppStrings.date,
                  style: Theme.of(context).textTheme.displaySmall),
              8.height,
              CustomTextFormField(
                readOnly: true,
                hintText: currentDAta(
                    BlocProvider.of<TaskCubit>(context).currentData),
                suffixIcon: IconButton(
                    onPressed: () {
                      BlocProvider.of<TaskCubit>(context).getDate(context);
                    },
                    icon: const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    )),
              ),
              24.height,
              const StartAndEndTime(),
              24.height,
              Text('Color', style: Theme.of(context).textTheme.displaySmall),
              8.height,
              const CirCleColor(),
            ],
          ),
        );
      },
    );
  }
}

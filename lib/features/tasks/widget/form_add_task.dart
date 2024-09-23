import 'package:flutter/material.dart';
import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/utils/helper.dart';
import 'package:to_do_app/core/widget/custom_elevated_button.dart';
import 'package:to_do_app/core/widget/text_form_field.dart';
import 'package:to_do_app/features/tasks/widget/circle_color.dart';
import 'package:to_do_app/features/tasks/widget/start_end_row.dart';

class FormAddTask extends StatefulWidget {
  const FormAddTask({super.key});

  @override
  State<FormAddTask> createState() => _FormAddTaskState();
}

class _FormAddTaskState extends State<FormAddTask> {
  late TextEditingController _controllerTitle;
  late TextEditingController _controllerNote;
  @override
  void initState() {
    _controllerTitle = TextEditingController();
    _controllerNote = TextEditingController();
    super.initState();
  }

  DateTime currentData = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.title,
              style: Theme.of(context).textTheme.displaySmall),
          8.height,
          //text form field
          CustomTextFormField(
            controller: _controllerTitle,
            hintText: AppStrings.titleHint,
          ),
          24.height,
          Text(AppStrings.note,
              style: Theme.of(context).textTheme.displaySmall),
          8.height,
          //text form field
          CustomTextFormField(
            controller: _controllerNote,
            hintText: AppStrings.noteHint,
          ),
          24.height,
          Text(AppStrings.date,
              style: Theme.of(context).textTheme.displaySmall),
          8.height,
          CustomTextFormField(
            readOnly: true,
            hintText: currentDAta(currentData),
            suffixIcon: IconButton(
                onPressed: () async {
                  DateTime? pickerTimeColor = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2025),
                  );
                  setState(() {
                    currentData = pickerTimeColor!;
                  });
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
           70.height,
          CustomElevatedButton(
            text: AppStrings.createTask,
            onPressed: () {},
            backgroundColor: AppColor.primary,
          ),
         
        ],
      ),
    );
  }
}

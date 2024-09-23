
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widget/text_form_field.dart';

class StartAndEndTime extends StatefulWidget {
  const StartAndEndTime({super.key});

  @override
  State<StartAndEndTime> createState() => _StartAndEndTimeState();
}

class _StartAndEndTimeState extends State<StartAndEndTime> {
  TimeOfDay currentTime = TimeOfDay.fromDateTime(DateTime.now());
  TimeOfDay currentTimeEnd = TimeOfDay.fromDateTime(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.startTime,
                style: Theme.of(context).textTheme.displaySmall),
            8.height,
            SizedBox(
              width: 130.w,
              child: CustomTextFormField(
                readOnly: true,
                hintText: currentTime.format(context),
                suffixIcon: IconButton(
                    onPressed: () async {
                      TimeOfDay? pickerTimeColor = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                      );
                      setState(() {
                        currentTime = pickerTimeColor!;
                      });
                    },
                    icon: const Icon(
                      Icons.watch_later_outlined,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
        27.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.endTime,
                style: Theme.of(context).textTheme.displaySmall),
            8.height,
            SizedBox(
              width: 130.w,
              child: CustomTextFormField(
                readOnly: true,
                hintText: currentTimeEnd.format(context),
                suffixIcon: IconButton(
                    onPressed: () async {
                      TimeOfDay? pickerTimeColor = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                      );
                      setState(() {
                        currentTimeEnd = pickerTimeColor!;
                      });
                    },
                    icon: const Icon(
                      Icons.watch_later_outlined,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

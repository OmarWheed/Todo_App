import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

import 'package:to_do_app/core/widget/list_of_color.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final int isCompleted;
  final int? color;
  final void Function()? onTap;

  const TaskCard(
      {super.key,
      required this.title,
      required this.note,
      required this.startTime,
      required this.endTime,
      required this.isCompleted,
      this.color,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150.h,
        //       height: MediaQuery.of(context).size.height * 0.4,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 24.r),
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: listOfColor[color ?? 0],
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.displayLarge),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        color: Colors.white,
                      ),
                      8.width,
                      Text('$startTime - $endTime',
                          style: Theme.of(context).textTheme.displaySmall),
                    ],
                  ),
                  Text(note,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontSize: 24, fontWeight: FontWeight.normal)),
                ]),
            Row(
              children: [
                const VerticalDivider(
                  color: Colors.white,
                  thickness: 2,
                ),
                RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      isCompleted == 1 ? AppStrings.complete : AppStrings.todO,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

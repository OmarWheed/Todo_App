
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class TaskCard extends StatelessWidget {
  final void Function()? onTap;
  const TaskCard({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120.h,
        width: double.infinity,
        margin:  EdgeInsets.only(bottom: 24.r),
        padding:  EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppColor.pink,
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Task 1',
                      style: Theme.of(context).textTheme.displayLarge),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        color: Colors.white,
                      ),
                      8.width,
                      Text('09:33 PM - 09:48 PM',
                          style: Theme.of(context).textTheme.displaySmall),
                    ],
                  ),
                  Text('Learn Dart',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontSize: 24, fontWeight: FontWeight.normal)),
                ]),
            const Row(
              children: [
                VerticalDivider(
                  color: Colors.white,
                  thickness: 2,
                ),
                RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      'TODO',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

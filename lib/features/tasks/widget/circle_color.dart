
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/widget/list_of_color.dart';

class CirCleColor extends StatefulWidget {
  const CirCleColor({super.key});
  @override
  State<CirCleColor> createState() => _CirCleColorState();
}

class _CirCleColorState extends State<CirCleColor> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ListView.builder(
        itemCount: listOfColor.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: CircleAvatar(
                backgroundColor: listOfColor[index],
                child: currentIndex == index
                    ? const Icon(
                        Icons.check,
                        color: AppColor.txtColor,
                      )
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}

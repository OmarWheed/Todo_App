import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/extension/gap.dart';

import 'package:to_do_app/features/tasks/widget/form_add_task.dart';

class AddPageBody extends StatelessWidget {
  const AddPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.r),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            48.height,
            const FormAddTask(),
          ],
        ),
      ),
    );
  }
}

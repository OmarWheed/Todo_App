import 'package:flutter/material.dart';
import 'package:to_do_app/core/extension/navigator.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/features/tasks/screens/add_page_body.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          AppStrings.addTask,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: const AddPageBody(),

    );
  }
}

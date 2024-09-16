import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedValue = DateFormat.yMMMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primary,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      _selectedValue.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 24),
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
                          .copyWith(fontSize: 24),
                    ),
                  ),
                  8.height,
                  SizedBox(
                    height: 100,
                    child: DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: AppColor.pickerTimeColor,
                      selectedTextColor: Colors.white,
                      dayTextStyle: Theme.of(context).textTheme.displaySmall!,
                      monthTextStyle: Theme.of(context).textTheme.displaySmall!,
                      dateTextStyle: Theme.of(context).textTheme.displaySmall!,
                      onDateChange: (date) {
                        String newFormatDate = DateFormat.yMMMMd().format(date);
                        setState(() {
                          _selectedValue = newFormatDate;
                        });
                      },
                    ),
                  ),
                  50.height,
                  Image.asset(AppAssets.noTask),
                  // noTaskWidget(context),
                  const TaskCard(),
                  10.height,
                  const TaskCard(),
                  10.height,
                  const TaskCard(),
                  10.height,
                  const TaskCard(),
                ],
              ),
            ),
          ),
        ));
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.pink,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Task 1',
                    style:
                        Theme.of(context).textTheme.displayLarge),
                Row(
                  children: [
                    const Icon(
                      Icons.timer_outlined,
                      color: Colors.white,
                    ),
                    8.width,
                    Text('09:33 PM - 09:48 PM',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall),
                  ],
                ),
                Text('Learn Dart',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.normal)),
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
    );
  }
}

Column noTaskWidget(BuildContext context) {
  return Column(
    children: [
      Text(
        AppStrings.noTask,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20),
      ),
      10.height,
      Text(
        AppStrings.noTaskDes,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20),
      ),
    ],
  );
}

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
                noTaskWidget(context),
              ],
            ),
          ),
        ));
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

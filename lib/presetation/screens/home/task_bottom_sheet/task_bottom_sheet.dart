import 'package:flutter/material.dart';
import 'package:todo_app_c12_online_sun/core/utils/app_styles.dart';
import 'package:todo_app_c12_online_sun/core/utils/date_utils.dart';

class TaskBottomSheet extends StatefulWidget {
  TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();

  // static Widget show() => TaskBottomSheet();
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: TaskBottomSheet(),
      ),
    );
  }
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add new task',
            textAlign: TextAlign.center,
            style: AppLightStyles.bottomSheetTitle,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your task title',
              hintStyle: AppLightStyles.hintStyle,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Enter your task description',
                hintStyle: AppLightStyles.hintStyle),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            'Select date',
            style: AppLightStyles.dateLabel,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          InkWell(
              onTap: () {
                showTaskDatePicker();
              },
              child: Text(
                selectedDate.myDateformat(), //  selectedDate.toFormattedDate,
                textAlign: TextAlign.center,
                style: AppLightStyles.dateStyle,
              )),
          const Spacer(),
          ElevatedButton(onPressed: () {}, child: const Text('Add task'))
        ],
      ),
    );
  }

  void showTaskDatePicker() async {
    selectedDate = await showDatePicker(
          //selectableDayPredicate: (date) => date. != 20 && date.day != 21,
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        ) ??
        selectedDate;

    setState(() {});
  }
}

// Provider
// widget life cycle
// const final
// key

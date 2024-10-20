import 'package:flutter/material.dart';
import 'package:todo_app_c12_online_sun/core/utils/app_styles.dart';
import 'package:todo_app_c12_online_sun/core/utils/date_utils.dart';

class TaskBottomSheet extends StatefulWidget {
  TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();

  static Widget show() => TaskBottomSheet();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add new task',
            textAlign: TextAlign.center,
            style: AppLightStyles.bottomSheetTitle,
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your task title',
              hintStyle: AppLightStyles.hintStyle,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Enter your task description',
                hintStyle: AppLightStyles.hintStyle),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Select date',
            style: AppLightStyles.dateLabel,
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
              onTap: () {
                showTaskDatePicker();
              },
              child: Text(
                selectedDate.toFormattedDate,
                textAlign: TextAlign.center,
                style: AppLightStyles.dateStyle,
              )),
          const Spacer(),
          ElevatedButton(onPressed: () {}, child: Text('Add task'))
        ],
      ),
    );
  }

  void showTaskDatePicker() async {
    selectedDate = await showDatePicker(
          //selectableDayPredicate: (date) => date. != 20 && date.day != 21,
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ) ??
        selectedDate;

    setState(() {});
  }
}

// Provider
// widget life cycle
// const final
// key

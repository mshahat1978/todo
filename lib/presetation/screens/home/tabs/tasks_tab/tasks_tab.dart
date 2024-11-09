import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_c12_online_sun/core/utils/colors_manager.dart';
import 'package:todo_app_c12_online_sun/presetation/screens/home/tabs/tasks_tab/widgets/task_item.dart';

import '../../../../../database/todo_dm.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime calenderSelectedDate = DateTime.now();

  List<TodoDM> todosList = []; // empty
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              color: ColorsManager.blue,
            ),
            buildCalenderTimeLine(),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskItem();
            },
            itemCount: todosList.length,
          ),
        )
      ],
    );
  }

  Widget buildCalenderTimeLine() => EasyDateTimeLine(
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {},
        headerProps: const EasyHeaderProps(
          monthStyle: TextStyle(
              color: ColorsManager.white,
              fontSize: 18,
              fontWeight: FontWeight.w500),
          showHeader: true,
          monthPickerType: MonthPickerType.switcher,
          selectedDateStyle: TextStyle(
              color: ColorsManager.white,
              fontSize: 18,
              fontWeight: FontWeight.w500),
          dateFormatter: DateFormatter.custom('E  dd-MM-yyyy'),
        ),
        dayProps: const EasyDayProps(
          height: 80,
          width: 60,
          dayStructure: DayStructure.dayStrDayNumMonth,
          activeDayStyle: DayStyle(
            dayStrStyle: TextStyle(
                color: ColorsManager.blue,
                fontSize: 15,
                fontWeight: FontWeight.w700),
            dayNumStyle: TextStyle(
                color: ColorsManager.blue,
                fontSize: 15,
                fontWeight: FontWeight.w700),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     Color(0xff3371FF),
              //     Color(0xff8426D6),
              //   ],
              // ),
              color: Colors.white,
            ),
          ),
          inactiveDayStyle: DayStyle(
            dayStrStyle: TextStyle(
                color: ColorsManager.black,
                fontSize: 15,
                fontWeight: FontWeight.w700),
            dayNumStyle: TextStyle(
                color: ColorsManager.black,
                fontSize: 15,
                fontWeight: FontWeight.w700),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     Color(0xff3371FF),
              //     Color(0xff8426D6),
              //   ],
              // ),
              color: Colors.white,
            ),
          ),
        ),
      );
}

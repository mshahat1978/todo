import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_c12_online_sun/core/utils/colors_manager.dart';
import 'package:todo_app_c12_online_sun/core/utils/date_utils.dart';
import 'package:todo_app_c12_online_sun/presetation/screens/home/tabs/tasks_tab/widgets/task_item.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCalenderTimeLine(),
        TaskItem(),
      ],
    );
  }

  Widget buildCalenderTimeLine() => EasyDateTimeLine(
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {},
        headerProps: const EasyHeaderProps(
          monthStyle: TextStyle(color: Colors.red),
          showHeader: false,
          monthPickerType: MonthPickerType.switcher,
          dateFormatter: DateFormatter.fullDateDMY(),
        ),
        dayProps: EasyDayProps(
          height: 80,
          width: 60,
          dayStructure: DayStructure.dayStrDayNum,
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

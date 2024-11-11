import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_c12_online_sun/core/utils/colors_manager.dart';
import 'package:todo_app_c12_online_sun/presetation/screens/home/tabs/tasks_tab/widgets/task_item.dart';

import '../../../../../database/todo_dm.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => TasksTabState();
}

class TasksTabState extends State<TasksTab> {
  DateTime calenderSelectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToDoFromFirestore();
  }

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
              return TaskItem(
                todo: todosList[index],
                onDeletedTask: getToDoFromFirestore,
                onEditTask: getToDoFromFirestore,
              );
            },
            itemCount: todosList.length,
          ),
        )
      ],
    );
  }

  Widget buildCalenderTimeLine() => EasyDateTimeLine(
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {
          calenderSelectedDate = selectedDate;
          getToDoFromFirestore();
        },
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

  getToDoFromFirestore() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(TodoDM.collectionName);
    QuerySnapshot collectionSnap = await collectionRef.get();
    List<QueryDocumentSnapshot> documentsSnapList = collectionSnap.docs;
    // Doc =>  List of Doc in As Json
    // use map to convert item item to my Map
    todosList = documentsSnapList.map(
      (docSnap) {
        Map<String, dynamic> json = docSnap.data() as Map<String, dynamic>;
        TodoDM todoDM = TodoDM.fromFireStore(json);
        return todoDM;
      },
    ).toList();
    // make filter by calenderSelectedDate
    todosList = todosList
        .where(
          (todo) =>
              todo.dateTime.year == calenderSelectedDate.year &&
              todo.dateTime.month == calenderSelectedDate.month &&
              todo.dateTime.day == calenderSelectedDate.day,
        )
        .toList();
    setState(() {});
  }
}

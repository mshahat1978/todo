import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app_c12_online_sun/core/utils/app_styles.dart';
import 'package:todo_app_c12_online_sun/core/utils/colors_manager.dart';
import 'package:todo_app_c12_online_sun/core/utils/date_utils.dart';
import 'package:todo_app_c12_online_sun/database/todo_dm.dart';

class TaskItem extends StatelessWidget {
  TaskItem({
    super.key,
    required this.todo,
    required this.onDeletedTask,
    required this.onEditTask,
  });

  TodoDM todo;
  Function onDeletedTask;
  Function onEditTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.onPrimary),
      child: Slidable(
        startActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (context) {
              deleteTodoFromFireStore();
              onDeletedTask();
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            autoClose: true,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15), topLeft: Radius.circular(15)),
          ),
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (context) {
              onEditTask();
            },
            backgroundColor: ColorsManager.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
            autoClose: true,
          ),
        ]),
        child: Container(
          // margin: EdgeInsets.all(8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                height: 62,
                width: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                width: 7,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(todo.title, style: AppLightStyles.tasksTitle),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(todo.description, style: AppLightStyles.taskDesc),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    DateTime.now().toFormattedDate,
                    style: AppLightStyles.taskDate,
                  )
                ],
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void deleteTodoFromFireStore() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(TodoDM.collectionName);
    DocumentReference docRef = collectionRef.doc(todo.id);
    await docRef.delete();
  }
}

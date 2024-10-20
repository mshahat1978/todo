import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:todo_app_c12_online_sun/presetation/screens/home/tabs/settings_tab/tasks_tab.dart';
import 'package:todo_app_c12_online_sun/presetation/screens/home/tabs/tasks_tab/tasks_tab.dart';
import 'package:todo_app_c12_online_sun/presetation/screens/home/task_bottom_sheet/task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    TasksTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      floatingActionButton: buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavBar(),
      body: tabs[currentIndex],
    );
  }

  buildBottomNavBar() => BottomAppBar(
        notchMargin: 8,
        child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTapped,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ]),
      );

  void onTapped(int index) {
    currentIndex = index;
    setState(() {});
  }

  Widget buildFab() => FloatingActionButton(
        onPressed: () {
          showTaskBottomSheet();
        },
        child: const Icon(
          Icons.add,
        ),
      );

  void showTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => TaskBottomSheet.show(),
    );
  }
}

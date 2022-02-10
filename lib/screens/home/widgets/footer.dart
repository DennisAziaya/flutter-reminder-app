import 'package:dev_todo/models/todo_list/todo_lists.dart';
import 'package:dev_todo/screens/lists/add_list.dart';
import 'package:dev_todo/screens/reminder/add_reminder_screen.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final addNewListCallBack;

  const Footer({required this.addNewListCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
                onPressed: () {
                  //Navigator.pushNamed(context, '/addList');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReminderScreen(),
                          fullscreenDialog: true));
                },
                icon: const Icon(Icons.add_circle),
                label: const Text('Add Reminder')),
            TextButton.icon(
                onPressed: () async {
                  TodoList newList = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddList(),
                          fullscreenDialog: true));
                  addNewListCallBack(newList);
                },
                icon: const Icon(Icons.add_task),
                label: const Text('Add List')),
          ],
        ));
  }
}

import 'package:dev_todo/screens/lists/add_list.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/addList');
                },
                icon: const Icon(Icons.add_circle),
                label: const Text('Add Reminder')),
            TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddList(),
                          fullscreenDialog: true));
                },
                icon: const Icon(Icons.add_task),
                label: const Text('Add List')),
          ],
        ));
  }
}

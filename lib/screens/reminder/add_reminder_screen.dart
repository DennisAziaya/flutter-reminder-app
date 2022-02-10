import 'package:dev_todo/common/widgets/category_icon.dart';
import 'package:flutter/material.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _notesTextController = TextEditingController();

  String _title = "";
  //String _notes = '';

  @override
  void initState() {
    super.initState();
    _titleTextController.addListener(() {
      setState(() {
        _title = _titleTextController.text;
      });
      // _notesTextController.addListener(() {
      //   setState() {
      //     _notes = _notesTextController.text;
      //   }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _titleTextController.dispose();
    _notesTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminder'),
        actions: [
          TextButton(
              onPressed: _title.isEmpty
                  ? null
                  : () {
                      print("add to database");
                    },
              child: const Text('Add'))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor,
              ),
              child: Column(
                children: [
                  TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: _titleTextController,
                    decoration: InputDecoration(
                        hintText: 'Title', border: InputBorder.none),
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                      height: 100,
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: _notesTextController,
                        decoration: InputDecoration(
                            hintText: 'Notes', border: InputBorder.none),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: ListTile(
                  onTap: () {},
                  leading: Text(
                    'List',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryIcon(
                          bgColor: Colors.blueAccent,
                          iconData: Icons.calendar_today),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('New List'),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: ListTile(
                  onTap: () {},
                  leading: Text(
                    'Category',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryIcon(
                          bgColor: Colors.blueAccent,
                          iconData: Icons.calendar_today),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Scheduled'),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

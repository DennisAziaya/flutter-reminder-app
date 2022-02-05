import 'package:flutter/material.dart';

class AddList extends StatefulWidget {
  const AddList({Key? key}) : super(key: key);

  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New List'),
        actions: [TextButton(onPressed: () {}, child: const Text('Add List'))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.green),
            child: const Icon(
              Icons.home,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

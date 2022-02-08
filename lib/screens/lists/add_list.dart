import 'package:dev_todo/common/custom_color_collection.dart';
import 'package:dev_todo/common/custom_icon_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/custom_colors.dart';
import '../../common/custom_icon.dart';

class AddList extends StatefulWidget {
  const AddList({Key? key}) : super(key: key);

  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  CustomColors _selectedColor = CustomColorCollection().colors.first;
  CustomIcon _selectedIcon = CustomIconCollection().icons.first;

  TextEditingController _textController = TextEditingController();

  String _listName = '';

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState() {
        _listName = _textController.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New List'),
        actions: [
          TextButton(
              onPressed: _listName.isNotEmpty
                  ? null
                  : () {
                      if (_textController.text.isNotEmpty) {
                        print('added');
                      } else {
                        print('nothing');
                      }
                      _textController.clear();
                    },
              child: const Text(
                'Add',
                style: TextStyle(
                    // color: _listName.isNotEmpty ? Colors.blueAccent : Colors.grey
                    ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: _selectedColor.color),
              child: Icon(
                _selectedIcon.icon,
                size: 40,
              ),
            ),
            const SizedBox(height: 20),
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _textController,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: () => _textController.clear(),
                        icon: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor),
                            child: const Icon(
                              Icons.clear,
                            )),
                      )),
                )),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final customColor in CustomColorCollection().colors)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = customColor;
                      });
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          border: _selectedColor.id == customColor.id
                              ? Border.all(color: Colors.grey[50]!, width: 5)
                              : null,
                          color: customColor.color,
                          shape: BoxShape.circle),
                    ),
                  )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final customIcon in CustomIconCollection().icons)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIcon = customIcon;
                      });
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          border: _selectedIcon.id == customIcon.id
                              ? Border.all(color: Colors.grey[300]!, width: 5)
                              : null,
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle),
                      child: Icon(customIcon.icon),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}

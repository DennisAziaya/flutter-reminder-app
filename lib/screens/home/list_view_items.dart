import 'package:dev_todo/models/category_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewItems extends StatefulWidget {
  final CategoryCollection categoryCollection;

  const ListViewItems({required this.categoryCollection});

  @override
  _ListViewItemsState createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final item = widget.categoryCollection.removeItem(oldIndex);
        setState(() {
          widget.categoryCollection.insert(newIndex, item);
        });
      },
      children: widget.categoryCollection.categories
          .map((category) => ListTile(
                onTap: () {
                  setState(() {
                    category.toggleCheckBox();
                  });
                },
                key: UniqueKey(),
                tileColor: Colors.grey[800],
                leading: Container(
                    decoration: BoxDecoration(
                        color: category.isChecked
                            ? Colors.blueAccent
                            : Colors.transparent,
                        shape: BoxShape.circle),
                    child: const Icon(Icons.check)),
                title: Row(
                  children: [
                    category.icon,
                    const SizedBox(
                      width: 10,
                    ),
                    Text(category.name),
                  ],
                ),
                trailing: const Icon(Icons.reorder),
              ))
          .toList(),
    );
  }
}

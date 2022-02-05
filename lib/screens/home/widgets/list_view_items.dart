import 'package:dev_todo/models/category/category_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const LIST_VIEW_HEIGHT = 70.0;

class ListViewItems extends StatefulWidget {
  final CategoryCollection categoryCollection;

  const ListViewItems({required this.categoryCollection});

  @override
  _ListViewItemsState createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.categoryCollection.categories.length *
          LIST_VIEW_HEIGHT *
          LIST_VIEW_HEIGHT,
      child: ReorderableListView(
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
            .map((category) => SizedBox(
                  key: UniqueKey(),
                  height: LIST_VIEW_HEIGHT,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        category.toggleIsChecked();
                      });
                    },
                    tileColor: Colors.grey[800],
                    leading: Container(
                        decoration: BoxDecoration(
                            color: category.isChecked
                                ? Colors.blueAccent
                                : Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: category.isChecked
                                    ? Colors.blueAccent
                                    : Colors.grey)),
                        child: Icon(Icons.check,
                            color: category.isChecked
                                ? Colors.white
                                : Colors.transparent)),
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
                  ),
                ))
            .toList(),
      ),
    );
  }
}

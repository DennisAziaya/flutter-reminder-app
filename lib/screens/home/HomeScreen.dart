import 'package:dev_todo/models/category/category_collection.dart';
import 'package:dev_todo/models/todo_list/todo_lists.dart';
import 'package:dev_todo/screens/home/widgets/grid_view_items.dart';
import 'package:dev_todo/screens/home/widgets/list_view_items.dart';
import 'package:flutter/material.dart';

import 'widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryCollection categoryCollection = CategoryCollection();

  String layoutType = 'grid';

  List<TodoList> todoLists = [];

  addNewList(TodoList list) {
    setState(() {
      todoLists.add(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  if (layoutType == 'grid') {
                    setState(() {
                      layoutType = 'list';
                    });
                  } else {
                    setState(() {
                      layoutType = 'grid';
                    });
                  }
                },
                child: Text(
                  layoutType == 'grid' ? 'Edit' : 'Done',
                  //style: const TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: Column(
          children: [
            AnimatedCrossFade(
              duration: Duration(milliseconds: 300),
              crossFadeState: layoutType == 'grid'
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: GridViewItems(
                  categories: categoryCollection.selectedCategory),
              secondChild:
                  ListViewItems(categoryCollection: categoryCollection),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: todoLists.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(todoLists[index].title),
                    );
                  }),
            ),
            Footer(addNewListCallBack: addNewList)
          ],
        ));
  }
}

import 'package:dev_todo/models/category_collection.dart';
import 'package:flutter/material.dart';

import 'footer.dart';
import 'grid_view_items.dart';
import 'list_view_items.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryCollection categoryCollection = CategoryCollection();

  String layoutType = 'grid';

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
                  style: const TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: layoutType == 'grid'
                      ? GridViewItems(categoryCollection: categoryCollection)
                      : ListViewItems(categoryCollection: categoryCollection)),
              //child: GridViewItems(categoryCollection: categoryCollection)),
              const Footer(),
            ],
          ),
        ));
  }
}

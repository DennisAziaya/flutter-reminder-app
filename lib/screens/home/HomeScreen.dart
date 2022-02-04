import 'package:dev_todo/models/category_collection.dart';
import 'package:flutter/material.dart';

import 'footer.dart';
import 'grid_view_items.dart';

class HomeScreen extends StatelessWidget {
  CategoryCollection categoryCollection = CategoryCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: GridViewItems(categoryCollection: categoryCollection)),
              Footer(),
            ],
          ),
        ));
  }
}

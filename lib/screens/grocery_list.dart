import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/grocery.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<GroceryItem> groceries = groceryItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (ctx, i) => Dismissible(
          key: ValueKey(groceries[i]),
          child: Grocery(grocery: groceries[i]),
        ),
      ),
    );
  }
}

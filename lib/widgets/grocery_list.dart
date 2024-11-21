import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: _groceryItems.isEmpty
          ? const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 20,
                  ),
                  child: Text(
                    'Your shopping list is empty!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (ctx, i) => Dismissible(
                key: ValueKey(_groceryItems[i].id),
                onDismissed: (direction) {
                  _removeItem(_groceryItems[i]);
                },
                child: ListTile(
                  key: ValueKey(_groceryItems[i]),
                  title: Text(_groceryItems[i].name),
                  leading: Container(
                    height: 25,
                    width: 25,
                    color: _groceryItems[i].category.color,
                  ),
                  trailing: Text(_groceryItems[i].quantity.toString()),
                ),
              ),
            ),
    );
  }
}

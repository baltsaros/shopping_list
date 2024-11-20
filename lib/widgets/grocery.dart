import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class Grocery extends StatelessWidget {
  const Grocery({
    super.key,
    required this.grocery,
  });

  final GroceryItem grocery;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: grocery.category.color,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(grocery.name),
            const SizedBox(
              width: 40,
            ),
            Text((grocery.quantity).toString()),
          ],
        ),
      ),
    );
  }
}

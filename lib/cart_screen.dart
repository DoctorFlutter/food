import 'package:flutter/material.dart';
import 'package:food/user_details_screen.dart';
import 'package:get/get.dart';

import 'dish.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    // Group cart items by dish
    Map<Dish, List<CartItem>> groupedItems = {};
    cartItems.forEach((item) {
      if (!groupedItems.containsKey(item.dish)) {
        groupedItems[item.dish] = [];
      }
      groupedItems[item.dish]!.add(item);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView(
        children: groupedItems.entries.map<Widget>((entry) {
          return _buildCartItemCard(entry.key, entry.value.length);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          double totalBill = calculateTotalBill(cartItems);
          Get.to(() => UserDetailsScreen(
            totalBillPrice: totalBill,
            cartItems: cartItems,
          ));
        },
        label: const Text('Place Order'),
        icon: const Icon(Icons.shopping_bag),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildCartItemCard(Dish dish, int quantity) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  dish.image,
                  width: 300,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 16.0),

              ],
            ),
            Text(
              dish.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Quantity: $quantity',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Price per item: \$${dish.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Total price: \$${(dish.price * quantity).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateTotalBill(List<CartItem> cartItems) {
    double total = 0;
    for (var item in cartItems) {
      total += item.dish.price * item.quantity;
    }
    return total;
  }
}

class CartItem {
  final Dish dish;
  final int quantity;

  CartItem({required this.dish, required this.quantity});
}

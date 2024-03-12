import 'package:flutter/material.dart';
import 'package:food/cart_screen.dart';
import 'package:get/get.dart';
import 'dish.dart'; // Import the Dish class from the correct file

class DessertScreen extends StatefulWidget {
  @override
  State<DessertScreen> createState() => _DessertScreenState();
}

class _DessertScreenState extends State<DessertScreen> {
  List<CartItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dessert'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Here you need to define 'index' and '_quantity'
              // For demonstration purpose, let's assume index is 0 and quantity is 1
              // int index = 0;
              // int _quantity = 1;
              //
              // List<CartItem> cartItems = [CartItem(dish: desserts[index], quantity: _quantity)];
              Get.to(() => CartScreen(cartItems: cartItems));
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: desserts.length,
        itemBuilder: (context, index) {
          return _buildDishCard( desserts[index]);
        },
      ),
    );
  }

  Widget _buildDishCard(Dish dish) {
    return Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              dish.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '\$${dish.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4.0),
                QuantityControl(
                  onChanged: (int quantity) {
                    setState(() {
                      if (quantity > 0) {
                        cartItems.add(CartItem(dish: dish, quantity: quantity));
                      } else {
                        cartItems.removeWhere((item) => item.dish == dish);
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuantityControl extends StatefulWidget {
  final ValueChanged<int> onChanged;

  QuantityControl({required this.onChanged});

  @override
  _QuantityControlState createState() => _QuantityControlState();
}

class _QuantityControlState extends State<QuantityControl> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (_quantity > 0) {
                _quantity--;
                widget.onChanged(_quantity);
              }
            });
          },
        ),
        Text(
          _quantity.toString(),
          style: const TextStyle(fontSize: 16.0),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              _quantity++;
              widget.onChanged(_quantity);
            });
          },
        ),
      ],
    );
  }
}
List<Dish> desserts = [
  Dish(name: 'Cake', price: 7.99, image: 'assets/cake.jpg'),
  Dish(name: 'Ice Cream', price: 4.99, image: 'assets/ice_cream.jpg'),
  Dish(name: 'Pudding', price: 5.99, image: 'assets/pudding.jpg'),
];
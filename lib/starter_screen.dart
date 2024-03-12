import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/cart_screen.dart';
import 'package:get/get.dart';

import 'dish.dart';

class StarterScreen extends StatefulWidget {
  @override
  _StarterScreenState createState() => _StarterScreenState();
}

class _StarterScreenState extends State<StarterScreen> {
  List<CartItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starter',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actionsIconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => CartScreen(cartItems: cartItems));
            },
          ),
        ],
      ),
      backgroundColor: Colors.red.shade100,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: starters.length,
        itemBuilder: (context, index) {
          return _buildDishCard(starters[index]);
        },
      ),
    );
  }

  Widget _buildDishCard(Dish dish) {
    return Card(
      elevation: 3.0,
      child: Container(
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 68,
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

                  Text(
                    '\$${dish.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
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

// Dummy data for dishes
List<Dish> starters = [
  Dish(name: 'Salad', price: 5.99, image: 'https://www.culinaryhill.com/wp-content/uploads/2021/01/Baby-Bok-Choy-Salad-Culinary-Hill-1200x800-1.jpg'),
  Dish(name: 'Soup', price: 4.99, image: 'https://i.ytimg.com/vi/LrKhcvZYFdQ/maxresdefault.jpg'),
  Dish(name: 'Bruschetta', price: 6.99, image: 'https://theneffkitchen.com.au/wp-content/uploads/2018/01/NEFF_featured_bruschetta.jpg'),
  Dish(name: 'Garlic Bread', price: 3.99, image: 'https://vaya.in/recipes/wp-content/uploads/2018/05/Great-Garlic-Bread.jpg'),
  Dish(name: 'Caprese Salad', price: 7.99, image: 'https://recipes.net/wp-content/uploads/2024/02/what-is-caprese-salad-1707316050.jpeg'),
  Dish(name: 'Cheese Sticks', price: 8.99, image: 'https://www.allrecipes.com/thmb/BeV2hKihyqT4sQBI6h2fYp2KzuU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/23596-fried-mozzarella-cheese-sticks-DDMFS-4x3-842a0eaebf6b435a8d3a8b04325e13eb.jpg'),
  Dish(name: 'Chicken Wings', price: 9.99, image: 'https://t3.ftcdn.net/jpg/02/91/35/16/360_F_291351654_FFAS60r2iHUkOY69RPRwEOVS76EU4SdA.jpg'),
  Dish(name: 'Mozzarella Sticks', price: 6.49, image: 'https://www.allrecipes.com/thmb/BeV2hKihyqT4sQBI6h2fYp2KzuU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/23596-fried-mozzarella-cheese-sticks-DDMFS-4x3-842a0eaebf6b435a8d3a8b04325e13eb.jpg'),
  Dish(name: 'Potato Skins', price: 7.49, image: 'https://bakingamoment.com/wp-content/uploads/2021/02/IMG_9953-potato-skins.jpg'),
  Dish(name: 'Artichoke', price: 8.49, image: 'https://www.thespruceeats.com/thmb/IzI21XI-Gg07LQnFEu57xYVnA7w=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/spinach-and-artichoke-dip-4157518-07-8685813570f34ac89c090084c042266d.jpg'),
];


import 'package:flutter/material.dart';
import 'package:food/cart_screen.dart';

class BillScreen extends StatelessWidget {
  final String userName;
  final String mobileNumber;
  final String address;
  final List<CartItem> cartItems;
  final double totalBillPrice;

  BillScreen({
    required this.userName,
    required this.mobileNumber,
    required this.address,
    required this.cartItems,
    required this.totalBillPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'User Details:',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text('Name: $userName',style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Mobile Number: $mobileNumber',style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Address: $address',style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 20.0),
            const Text(
              'Order Details:',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartItems[index].dish.name,style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text('Quantity: ${cartItems[index].quantity}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                  trailing: Text('\$${(cartItems[index].dish.price * cartItems[index].quantity).toStringAsFixed(2)}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                );
              },
            ),
            const SizedBox(height: 20.0),
            Text(
              'Total Bill: \$${totalBillPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food/bill_screen.dart';
import 'package:food/cart_screen.dart';
import 'package:get/get.dart';

class UserDetailsScreen extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final double totalBillPrice;
  final List<CartItem> cartItems;

  UserDetailsScreen({required this.totalBillPrice,required this.cartItems, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/userImage.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: userNameController,
                style: const TextStyle(color: Colors.red),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.red[50],
                  hintText: "Enter Name",
                  hintStyle: const TextStyle(color: Colors.red),
                  labelStyle: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: mobileNumberController,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.red),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.red[50],
                  hintText: "Enter Mobile Number",
                  hintStyle: const TextStyle(color: Colors.red),
                  labelStyle: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: addressController,
                style: const TextStyle(color: Colors.red),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(5.5),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.red[50],
                  hintText: "Enter Address",
                  hintStyle: const TextStyle(color: Colors.red),
                  labelStyle: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Total Bill Price: \$${totalBillPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => BillScreen(
                    userName: userNameController.text,
                    mobileNumber: mobileNumberController.text,
                    address: addressController.text,
                    totalBillPrice: totalBillPrice,
                    cartItems: cartItems,
                  ));
                },
                child: const Text('Proceed to Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

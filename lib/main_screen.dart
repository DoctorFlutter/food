import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCard('Starter','assets/images/starter.jpg', () {
              Get.toNamed('/starter');
            }),
            _buildCard('Main Course','assets/images/main.jpg', () {
              Get.toNamed('/main_course');
            }),
            _buildCard('Dessert','assets/images/dessert.jpg', () {
              Get.toNamed('/dessert');
            }),
            SizedBox(height: 80,),
          ],
        ),
      ),
    ));
  }

  Widget _buildCard(String title,String image, VoidCallback onPressed) {
    return SizedBox(
      width: 300,
      height: 150,
      child: Card(
        elevation: 5,
        child: InkWell(
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
              Image.asset(image,height: 100,),
              SizedBox(width: 30,),
              Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

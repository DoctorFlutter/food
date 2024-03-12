import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),)),
                const SizedBox(height: 25,),
                TextFormField(
                  controller: usernameController,
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
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                    filled: true,
                    fillColor: Colors.red[50],
                    hintText: "Enter Username",
                    hintStyle: const TextStyle(color: Colors.red),
                    labelStyle: const TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.red),
                  obscuringCharacter: "*",
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
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.red,
                    ),
                    filled: true,
                    fillColor: Colors.red[50],
                    hintText: "Enter Username",
                    hintStyle: const TextStyle(color: Colors.red),
                    labelStyle: const TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: InkWell(
                    onTap: (){
                      if (usernameController.text == 'admin' && passwordController.text == 'admin') {
                        // Navigate to the main screen
                        Get.offAllNamed('/'); // Navigate without going back to login screen
                      } else {
                        // Show error message or handle invalid login
                        Get.snackbar(
                            'Error',
                            'Invalid username or password',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM
                        );
                      }
                    },
                    child: Container(
                      height: 55,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 200,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}


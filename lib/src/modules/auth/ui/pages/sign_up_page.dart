import 'package:flutter/material.dart';
import 'package:food_delivery/src/modules/auth/controller/auth_controller.dart';

class SignUpPage extends StatefulWidget {
    SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final userNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  AuthController _controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
      child: Column(
        children: [
            TextField(
            controller: userNameController,
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          const SizedBox(height: 10),
            TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email adress'),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: confirmPasswordController,
            decoration: const InputDecoration(labelText: 'Confirm Password'),
            obscureText: true,
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.only(left: 25, right: 25),
            width: MediaQuery.sizeOf(context).width,
            height: 65,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(250, 74, 12, 100)),
              onPressed: () {
                _controller.createUser(
                userNameController.text, emailController.text, passwordController.text);
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

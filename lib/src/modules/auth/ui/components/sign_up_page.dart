import 'package:flutter/material.dart';
import 'package:food_delivery/src/modules/auth/controller/auth_controller.dart';

class SignUpComponent extends StatefulWidget {
    const SignUpComponent({super.key});

  @override
  State<SignUpComponent> createState() => _SignUpComponentState();
}

class _SignUpComponentState extends State<SignUpComponent> {
  final userNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final _controller = AuthController();

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
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Senha'),
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: confirmPasswordController,
            decoration: const InputDecoration(labelText: 'Confirmar senha'),
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
                _controller.registerUser(
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

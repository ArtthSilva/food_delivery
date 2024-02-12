import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Email address',
                style: TextStyle(color: Colors.grey[600]),
              )
            ],
          ),
          const TextField(),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Text(
                'Password',
                style: TextStyle(color: Colors.grey[600]),
              )
            ],
          ),
          const TextField(),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Text(
                'Forgot Passcode?',
                style: TextStyle(color: Color.fromRGBO(250, 74, 12, 100)),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.only(left: 25, right: 25),
            width: MediaQuery.sizeOf(context).width,
            height: 65,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(250, 74, 12, 100)),
              onPressed: () {},
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

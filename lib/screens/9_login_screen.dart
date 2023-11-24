import 'package:flutter/material.dart';
import 'package:flutter_go_router/common/custom_button.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:flutter_go_router/route/router.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('Login State : $authState'),
          CustomButton(
            text: 'Go to Private Route',
            onPressed: () {
              if (GoRouterState.of(context).uri.path == '/login') {
                context.go('/login/private');
              } else {
                context.go('/login2/private');
              }
            },
          ),
          CustomButton(
            text: authState ? 'Logout' : 'Login',
            onPressed: () {
              setState(() {
                authState = !authState;
              });
            },
          ),
        ],
      ),
    );
  }
}

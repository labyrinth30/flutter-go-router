import 'package:flutter/material.dart';
import 'package:flutter_go_router/common/custom_button.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PushScreen extends StatelessWidget {
  const PushScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          CustomButton(
            text: 'Push Basic',
            onPressed: () => context.push('/basic'),
          ),
          CustomButton(
            text: 'Go Basic',
            onPressed: () => context.go('/basic'),
          ),
        ],
      ),
    );
  }
}

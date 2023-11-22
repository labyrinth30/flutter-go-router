import 'package:flutter/material.dart';
import 'package:flutter_go_router/common/custom_button.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class TransitionScreenOne extends StatelessWidget {
  const TransitionScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Container(
        color: Colors.red,
        child: ListView(
          children: [
            CustomButton(
              text: 'go to Detail',
              onPressed: () {
                context.go('/transition/detail');
              },
            ),
          ],
        ),
      ),
    );
  }
}

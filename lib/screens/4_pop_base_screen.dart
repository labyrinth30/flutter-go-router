import 'package:flutter/material.dart';
import 'package:flutter_go_router/common/custom_button.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PopBaseScreen extends StatelessWidget {
  const PopBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          CustomButton(
            text: 'Push Pop Return Screen',
            onPressed: () async {
              final result = await context.push(
                '/pop/return',
              );
              print(result);
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_go_router/common/custom_button.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('에러'),
      ),
      body: ListView(
        children: [
          Text('에러는? $error'),
          CustomButton(
            text: '홈으로 이동하기',
            onPressed: () => context.go('/'),
          ),
        ],
      ),
    );
  }
}

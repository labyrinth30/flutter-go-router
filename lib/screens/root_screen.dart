import 'package:flutter/material.dart';
import 'package:flutter_go_router/common/custom_button.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

// 홈페이지처럼 라우트를 테스트해볼 수 있는 스크린
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          // go 메서드
          CustomButton(
            text: 'go basic',
            onPressed: () => context.go('/basic'),
          ),
          // goNamed 메서드
          CustomButton(
            text: 'go Named',
            // goNamed는 GoRoute의 name을 기준으로 라우팅함
            onPressed: () => context.goNamed('named_screen'),
          ),
          // push 메서드
          CustomButton(
            text: 'go push',
            // goNamed는 GoRoute의 name을 기준으로 라우팅함
            onPressed: () => context.go('/push'),
          ),
          // pop 메서드
          CustomButton(
            text: 'Go Pop',
            // goNamed는 GoRoute의 name을 기준으로 라우팅함
            onPressed: () => context.go('/pop'),
          ),
          CustomButton(
            text: 'Go Path Param',
            // goNamed는 GoRoute의 name을 기준으로 라우팅함
            onPressed: () => context.go('/path_param/456'),
          ),
          CustomButton(
            text: 'Go Query Param',
            // goNamed는 GoRoute의 name을 기준으로 라우팅함
            onPressed: () => context.go('/query_param'),
          ),
          CustomButton(
            text: 'Go Nested',
            onPressed: () => context.go('/nested/a'),
          ),
          CustomButton(
            text: 'Login Screen',
            onPressed: () => context.go('/login'),
          ),
          CustomButton(
            text: 'Login2 Screen',
            onPressed: () => context.go('/login2'),
          ),
          CustomButton(
            text: 'Transition Screen',
            onPressed: () => context.go('/transition'),
          ),
          CustomButton(
            text: 'Error Screen',
            onPressed: () => context.go('/error'),
          ),
        ],
      ),
    );
  }
}

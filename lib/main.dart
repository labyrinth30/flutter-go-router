import 'package:flutter/material.dart';
import 'package:flutter_go_router/route/router.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    // go_router를 쓰기 위해 .router를 추가
    return MaterialApp.router(
      // 기존에 선언한 router를 넣어준다.
      routerConfig: router,
    );
  }
}

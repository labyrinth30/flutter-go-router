import 'package:flutter_go_router/screens/1_basic_screen.dart';
import 'package:flutter_go_router/screens/root_screen.dart';
import 'package:go_router/go_router.dart';

// 실제 인터넷 라우팅처럼 라우팅함
// https://naver.com/ 에서 / 뒤에 오는 것을 path라고 부름.
// 이 path를 기준으로 라우팅함
// https://naver.com/flutter -> path는 /flutter임

// / -> home
// /basic -> basic
// 비효율적인 url 중복 문제를 피하기 위해 Go 함수 사용
final router = GoRouter(
  // routes에는 GoRoute를 넣어줌
  routes: [
    GoRoute(
      path: '/',
      // path에 해당되는 화면을 지정
      builder: (context, state) => const RootScreen(),
      routes: [
        // 중첩된 라우트이기 때문에 path가 /basic이 아닌 basic임
        GoRoute(
          path: 'basic',
          builder: (context, state) => const BasicScreen(),
        ),
      ],
    ),
  ],
);

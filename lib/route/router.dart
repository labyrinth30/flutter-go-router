import 'package:flutter_go_router/screens/1_basic_screen.dart';
import 'package:flutter_go_router/screens/2_named_screen.dart';
import 'package:flutter_go_router/screens/3_push_screen.dart';
import 'package:flutter_go_router/screens/4_pop_base_screen.dart';
import 'package:flutter_go_router/screens/5_pop_return_screen.dart';
import 'package:flutter_go_router/screens/6_path_param_screen.dart';
import 'package:flutter_go_router/screens/root_screen.dart';
import 'package:go_router/go_router.dart';

// 실제 인터넷 라우팅처럼 라우팅함
// https://naver.com/ 에서 / 뒤에 오는 것을 path라고 부름.
// 이 path를 기준으로 라우팅함
// https://naver.com/flutter -> path는 /flutter임

// / -> home
// /basic -> basic
// /named ->
final router = GoRouter(
  // routes에는 GoRoute를 넣어줌
  routes: [
    GoRoute(
      path: '/',
      // path에 해당되는 화면을 지정
      builder: (context, state) => const RootScreen(),
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) => const BasicScreen(),
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) => const NamedScreen(),
        ),
        GoRoute(
          path: 'push',
          builder: (context, state) => const PushScreen(),
        ),
        GoRoute(
          path: 'pop',
          // /pop
          builder: (context, state) => const PopBaseScreen(),
          routes: [
            GoRoute(
              path: 'return',
              // /pop/return
              builder: (context, state) => const PopReturnScreen(),
            ),
          ],
        ),
        GoRoute(
          // path에 :를 붙이면 :뒤에 들어오는 값을 변수의 이름으로 칭할 수 있음
          path: 'path_param/:id', // '/path_param/123'
          builder: (context, state) => const PathParamScreen(),
          routes: [
            // /path_param/:id/:name
            GoRoute(
              path: ':name',
              builder: (context, state) => const PathParamScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

import 'package:flutter/material.dart';
import 'package:flutter_go_router/screens/10_transition_screen_1.dart';
import 'package:flutter_go_router/screens/10_transition_screen_2.dart';
import 'package:flutter_go_router/screens/1_basic_screen.dart';
import 'package:flutter_go_router/screens/2_named_screen.dart';
import 'package:flutter_go_router/screens/3_push_screen.dart';
import 'package:flutter_go_router/screens/4_pop_base_screen.dart';
import 'package:flutter_go_router/screens/5_pop_return_screen.dart';
import 'package:flutter_go_router/screens/6_path_param_screen.dart';
import 'package:flutter_go_router/screens/7_query_param_screen.dart';
import 'package:flutter_go_router/screens/8_nested_child_screen.dart';
import 'package:flutter_go_router/screens/8_nested_screen.dart';
import 'package:flutter_go_router/screens/9_login_screen.dart';
import 'package:flutter_go_router/screens/9_private_screen.dart';
import 'package:flutter_go_router/screens/root_screen.dart';
import 'package:go_router/go_router.dart';

// 로그인이 되었는지 안됐는지
// true - login ok / false - login no
bool authState = false;

// 실제 인터넷 라우팅처럼 라우팅함
// https://naver.com/ 에서 / 뒤에 오는 것을 path라고 부름.
// 이 path를 기준으로 라우팅함
// https://naver.com/flutter -> path는 /flutter임

// / -> home
// /basic -> basic
// /named ->
final router = GoRouter(
  redirect: (context, state) {
    // return String -> 라우팅할 path (path)
    // return null -> 원래 이동하려던 라우트로 이동
    if (state.uri.path == '/login/private' && !authState) {
      return '/login';
    }
    return null;
  },
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
        GoRoute(
          path: 'query_param',
          builder: (context, state) => const QueryParameterScreen(),
        ),
        // builder는 routes를 감싸게 되는 위젯
        // routes에도 GoRoute를 넣어줄 수 있음
        // GoRoute의 builder에서 반환해주는 값을 child에서 입력받음
        ShellRoute(
          routes: [
            // ShellRoute는 path가 없기 때문에 /nested/a가 path임
            GoRoute(
              path: 'nested/a',
              builder: (_, state) => const NestedChildScreen(
                routeName: '/nested/a',
              ),
            ),
            GoRoute(
              path: 'nested/b',
              builder: (_, state) => const NestedChildScreen(
                routeName: '/nested/b',
              ),
            ),
            GoRoute(
              path: 'nested/c',
              builder: (_, state) => const NestedChildScreen(
                routeName: '/nested/c',
              ),
            ),
          ],
          builder: (context, state, child) => NestedScreen(
            child: child,
          ),
        ),
        GoRoute(
          path: 'login',
          builder: (_, state) => const LoginScreen(),
          routes: [
            GoRoute(
              path: 'private', // /login/private
              builder: (_, state) => const PrivateScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'login2',
          builder: (_, state) => const LoginScreen(),
          routes: [
            GoRoute(
              path: 'private', // /login2/private
              builder: (_, state) => const PrivateScreen(),
              // path 지정 필요없음
              redirect: (context, state) {
                if (!authState) {
                  return '/login2';
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
        GoRoute(
          path: 'transition',
          builder: (_, state) => const TransitionScreenOne(),
          routes: [
            GoRoute(
              path: 'detail',
              pageBuilder: (_, state) => CustomTransitionPage(
                transitionDuration: const Duration(seconds: 1),
                child: const TransitionScreenTwo(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NestedScreen extends StatelessWidget {
  final Widget child;
  const NestedScreen({
    super.key,
    required this.child,
  });

  int getIndex(BuildContext context) {
    if (GoRouterState.of(context).uri.toString() == '/nested/a') {
      return 0;
    } else if (GoRouterState.of(context).uri.toString() == '/nested/b') {
      return 1;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GoRouterState.of(context).uri.toString(),
        ),
      ),
      body: child,
      // 라우트 전체를 감싸고 있는 위젯
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: getIndex(context),
        onTap: (index) {
          if (index == 0) {
            context.go('/nested/a');
          } else if (index == 1) {
            context.go('/nested/b');
          } else {
            context.go('/nested/c');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personal',
          ),
        ],
      ),
    );
  }
}

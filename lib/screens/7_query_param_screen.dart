import 'package:flutter/material.dart';
import 'package:flutter_go_router/common/custom_button.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class QueryParameterScreen extends StatelessWidget {
  const QueryParameterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text(
            'Query Parameter: ${GoRouterState.of(context).uri.queryParameters}',
          ),
          CustomButton(
            text: 'QueryParamScreen',
            onPressed: () {
              // go 메서드도 가능함
              // context.push('/query_param?name=GDSC&age=24'); 이런식으로 해도 되지만
              // Uri를 이용하면 알아서 위와 같이 변환해줌
              context.push(
                Uri(
                  path: '/query_param',
                  queryParameters: {
                    // 둘다 String으로 넣어줘야함
                    'name': 'GDSC',
                    'age': '24',
                  },
                ).toString(),
              );
            },
          ),
        ],
      ),
    );
  }
}

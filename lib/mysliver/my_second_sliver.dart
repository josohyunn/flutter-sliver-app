import 'package:flutter/material.dart';

// 1번째꺼보다 훨씬 좋다.
class MySecondSliver extends StatelessWidget {
  const MySecondSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // slivers : 찢어진 조각(Container같은 일반 위젯 못들어옴)
      slivers: [
        // 일반 위젯을 sliver위젯으로 치환시켜줌. 일반 위젯을 slivers에 넣을 때 사용
        SliverToBoxAdapter(
          child: Container(
            height: 500,
            color: Colors.red,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                    height: 100, color: Colors.blue, child: Text("$index")),
              );
            },
          ),
        ),
      ],
    );
  }
}

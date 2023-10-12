import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 쪼개는 이유 : stateful때문에
    return Scaffold(
      body: CustomScrollView(
        // slivers : 찢어진 조각(Container같은 일반 위젯 못들어옴)
        slivers: [
          SliverAppBar(
            title: Text("SliverAppbar"),
            expandedHeight: 200, // flexibleSpace가 사용할 높이
            // FlexibleSpaveBar : Container로 하면 밑으로 스르륵 올렸을 때 앱바가 없어지지 않을껄?
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "http://picsum.photos/200/300",
                fit: BoxFit.cover,
              ),
            ),
          ),
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
          SliverFillViewport(
            // viewport : 화면 가득 채움
            delegate: SliverChildBuilderDelegate(
              childCount: 5,
              (context, index) {
                return Card(
                  child: Container(
                    child: Text("Fill ViewPort Item $index"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

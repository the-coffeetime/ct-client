import 'package:coffeetime/screens/home_page/index.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key, required this.scrollController});
  final ScrollController scrollController;

  Future<void> _onRefresh() async {

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xf6f5f5f5),
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          child: Column(
            children: <Widget>[
              HomeBoardBox(onClick: () {}, title: "즐겨찾는 게시판"),
              HomeBoardBox(onClick: () {}, title: "최근 질문"),
              HomeBoardBox(onClick: () {}, title: "HOT 게시판"),
            ],
          ),
        ),
      ),
    );
  }
}
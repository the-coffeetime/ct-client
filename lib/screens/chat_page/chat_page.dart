import 'index.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // The number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text("메신저"),
          backgroundColor: Colors.white,
          bottom: TabBar(
            tabs: const [Tab(text: "채팅"), Tab(text: "메세지")],
            indicatorWeight: 3.0,
            indicatorColor: AppColors.accentColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: AppColors.accentColor),
              insets: EdgeInsets.symmetric(horizontal: 16.0),
            ),
            labelColor: Color(0xFF555555),
            unselectedLabelColor: Color(0xDD666666).withOpacity(0.7),
            labelStyle: const TextStyle(
                fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('채팅 페이지')),
            Center(child: Text('메세지 페이지')),
          ],
        ),
      ),
    );
  }
}

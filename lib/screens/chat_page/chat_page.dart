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
        ),
        body: const Center(child: Text('메세지 페이지')),
      ),
    );
  }
}

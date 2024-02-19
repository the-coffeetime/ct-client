import 'index.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const BoardPage(),
    const ChatPage(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400), // Duration of the fade
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list_rounded),
              label: '게시판',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline_outlined),
              label: '메신저',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              label: '알림',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: '프로필',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
        ),
    );
  }
}

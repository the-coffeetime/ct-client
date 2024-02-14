import 'index.dart';

class AccessPage extends StatelessWidget {
  const AccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login/Signup'),
      ),
      body: const Center(
        child: Text('Please login or sign up.'),
      ),
    );
  }
}
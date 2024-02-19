import 'index.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService _authService = AuthService();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.brown, // Creates a swatch based on the coffee brown color
          accentColor: AppColors.accentColor, // Fresh Orange for the accent color
          backgroundColor: Colors.white, // Explicitly set the background color to white
        ).copyWith(
          secondary: AppColors.accentColor, // Fresh Orange used explicitly as the secondary color
        ),
      ),
      home: FutureBuilder<bool>(
        future: _authService.isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show loading indicator
          // } else if (snapshot.hasData && snapshot.data!) {
          //   return const HomePage(); // Navigate to home screen if logged in
          } else {
            return const MainScreen(); // Navigate to home screen if logged in
            // return const AccessPage(); // Show access page if not logged in
          }
        },
      ),
    );
  }
}

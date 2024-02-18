import 'index.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({super.key});

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _logoAnimation;
  Animation<double>? _buttonsAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2100), // Total animation duration
      vsync: this,
    );

    // Animation for the app logo
    _logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(
          0.33, // Delayed start for the logo to ensure the background is visible first
          0.66, // Logo fully appears by the halfway mark
          curve: Curves.easeIn,
        ),
      ),
    );

    // Animation for the buttons, starting 1 second after the logo appears
    _buttonsAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(
          0.66, // Start after the logo animation
          1.0, // End at the final mark
          curve: Curves.easeIn,
        ),
      ),
    );

    _animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image with animated opacity
          AnimatedOpacity(
            opacity: 0.4,
            duration: const Duration(milliseconds: 700),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/cafe-wallpaper.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            // App logo
            children: [
              FadeTransition(
                opacity: _logoAnimation!,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Container(
                      height: 320,
                      width: 320,
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                          'assets/images/coffeetime_access.png'), // Ensure you have this asset
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              // Buttons with fade transition
              FadeTransition(
                opacity: _buttonsAnimation!,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Handle Google login
                      _buildSocialButton(
                          "assets/images/google_logo_rect.png",
                          "Sign in with Google",
                          BorderRadius.zero,
                          const Color(0xFF4285F4),
                          Colors.white,
                          const Color(0xFF4285F4),
                          () {}),
                      const SizedBox(height: 10),
                      // Handle Facebook login
                      _buildSocialButton(
                          "assets/images/facebook_logo_reverse.png",
                          "Sign in with Facebook",
                          BorderRadius.zero,
                          const Color(0xFF1877F2),
                          Colors.white,
                          const Color(0xFF1877F2),
                          () {}),
                      const SizedBox(height: 10),
                      // Handle Naver login
                      _buildSocialButton(
                          "assets/images/naver_logo.png",
                          "Sign in with Naver",
                          BorderRadius.zero,
                          const Color(0xFF1EC800),
                          const Color(0xFF1EC800),
                          Colors.white,
                          () {}),
                      const SizedBox(height: 10),
                      // Handle Kakao login
                      _buildSocialButton(
                          "assets/images/kakao_logo.png",
                          "Sign in with Kakao",
                          const BorderRadius.all(Radius.circular(12)),
                          const Color(0x00FEE500),
                          const Color(0xFF3B1E1E),
                          const Color(0xFFFEE500),
                          () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  Widget _buildSocialButton(
      String logoPath,
      String text,
      BorderRadius radius,
      Color borderColor,
      Color fontColor,
      Color backgroundColor,
      VoidCallback onPressed) {
    return ElevatedButton.icon(
      icon: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Image.asset(logoPath, height: 40), // Adjust size as needed
      ),
      label: SizedBox(
        width: 160,
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: fontColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        shape: RoundedRectangleBorder(
            borderRadius: radius,
            side: BorderSide(color: borderColor, width: 1)),
      ),
    );
  }
}

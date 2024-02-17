import 'index.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({super.key});

  @override
  State<AccessPage> createState() => _AccessPageState();
}


class _AccessPageState extends State<AccessPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _buttonOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1400), // Total animation duration
      vsync: this,
    )..addListener(() {
      setState(() {});
    });

    _buttonOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.5, // Start the button animation at 50% of the wallpaper animation
          1.0, // End at 100% of the animation duration
          curve: Curves.easeIn,
        ),
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedOpacity(
            opacity: _controller.value < 0.5 ? _controller.value * 2 : 0.5,
            duration: Duration(milliseconds: 700),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/cafe-wallpaper.webp'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Opacity(
              opacity: _buttonOpacity.value,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildSocialButton("assets/google_logo.png", "Log in with Google", () {
                        // Handle Google login
                      }),
                      const SizedBox(height: 20),
                      _buildSocialButton("assets/naver_logo.png", "Log in with Naver", () {
                        // Handle Naver login
                      }),
                      const SizedBox(height: 20),
                      _buildSocialButton("assets/kakao_logo.png", "Log in with KakaoTalk", () {
                        // Handle KakaoTalk login
                      }),
                      const SizedBox(height: 20),
                      _buildSocialButton("assets/facebook_logo.png", "Log in with Facebook", () {
                        // Handle Facebook login
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildSocialButton(String logoPath, String text, VoidCallback onPressed) {
    return ElevatedButton.icon(
      icon: Image.asset(logoPath, height: 24), // Adjust size as needed
      label: Text(text),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}

  // Social login buttons
  // Center(
  //   child: Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: <Widget>[
  //       _buildSocialButton("assets/google_logo.png", "Log in with Google", () {
  //         // Handle Google login
  //       }),
  //       const SizedBox(height: 20),
  //       _buildSocialButton("assets/naver_logo.png", "Log in with Naver", () {
  //         // Handle Naver login
  //       }),
  //       const SizedBox(height: 20),
  //       _buildSocialButton("assets/kakao_logo.png", "Log in with KakaoTalk", () {
  //         // Handle KakaoTalk login
  //       }),
  //       const SizedBox(height: 20),
  //       _buildSocialButton("assets/facebook_logo.png", "Log in with Facebook", () {
  //         // Handle Facebook login
  //       }),
  //     ],
  //   ),
  // ),


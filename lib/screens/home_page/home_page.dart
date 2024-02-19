import 'package:coffeetime/index.dart';
import 'package:coffeetime/screens/access_page/index.dart';

import 'index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, // The number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _scrollController.animateTo(0, duration: Duration(milliseconds: 400), curve: Curves.easeOut);
                  },
                  child: Container(
                    // Use MediaQuery to adjust the image size dynamically
                    height: MediaQuery.of(context).size.height *
                        0.04, // Adjust the size as a percentage of the screen height
                    width: MediaQuery.of(context).size.width *
                        0.09, // Ensure the image aspect ratio is maintained
                    alignment: Alignment
                        .topCenter, // Adjust the width as a percentage of the screen width
                    child: Image.asset('assets/images/CT-letter-logo3.png',
                        fit: BoxFit.contain),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: kToolbarHeight - 14,
                    decoration: BoxDecoration(
                      color: Color(0x55B2B2B2),
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners.
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: '글 및 게시판 검색',
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Color(0xDD666666),
                        ),
                        border: InputBorder.none,
                        prefixIcon:
                            Icon(Icons.search, color: Color(0xDD666666)),
                        contentPadding: EdgeInsets.only(
                            top: kToolbarHeight *
                                0.1), // Adjust padding to vertically center the text.
                      ),
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(
              tabs: const [Tab(text: "홈"), Tab(text: "인기")],
              indicatorWeight: 3.0, // Thickness of the bottom border
              indicatorColor:
                  AppColors.accentColor, // Color of the bottom border
              indicatorSize: TabBarIndicatorSize.tab, // Ensures the indicator fills the entire tab
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: AppColors.accentColor),
                insets: EdgeInsets.symmetric(horizontal: 16.0), // Adjust the padding if needed
              ),
              labelColor: Color(0xFF555555),
              unselectedLabelColor: Color(0xDD666666).withOpacity(0.7),
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold), // Style for selected tab
              unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.normal), // Style for unselected tabs
            ),
          ),
          body: TabBarView(
            children: [
              // Replace these with your actual widgets/pages
              HomeTab(scrollController: _scrollController),
              Center(child: Text('Favorites Content')),
            ],
          ),
        ),
    );
  }
}

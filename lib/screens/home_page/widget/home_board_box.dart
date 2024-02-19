import 'package:coffeetime/screens/home_page/index.dart';

class HomeBoardBox extends StatelessWidget {
  final VoidCallback onClick;
  final String title;

  const HomeBoardBox({Key? key, required this.onClick, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontFamily: 'BMJUA', fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                onTap: onClick,
                child: Text(
                  '더 보기 >',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(14.0, 10.0, 14.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Line 1'),
                Text('Line 2'),
                Text('Line 3'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

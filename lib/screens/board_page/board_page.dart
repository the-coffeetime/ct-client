import 'index.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({super.key});

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
                children: <Widget>[
                  Container(
                    child: Text("above"),
                  ),
                  Container(
                    child: Text("below"),
                  )
                ],
      ),
    );
  }
}

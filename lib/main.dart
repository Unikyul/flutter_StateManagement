import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("HomePage 그러짐");
    return Container(
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Header(),
            Expanded(
              child: Father(),
            ),
          ],
        ),
      ),
    );
  }
}

class Father extends StatefulWidget {
  @override
  State<Father> createState() => _FatherState();
}

class _FatherState extends State<Father> {
  int num = 1;

  void add() {
    setState(() {
      num++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Father 그려짐");
    return Column(
      children: [
        Expanded(
          child: Top(num: num),
        ),
        Expanded(
          child: Bottom(
            add: add,
          ),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("header");
    return Container(
      color: Colors.green,
      height: 200,
    );
  }
}

class Top extends StatelessWidget {
  final int num;

  const Top({Key? key, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Top 그려짐");
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          '$num',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 100,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}

// Bottom 위젯: 버튼을 눌러 add 함수를 호출해 상태를 변경하는 역할
class Bottom extends StatelessWidget {
  final VoidCallback add;

  const Bottom({Key? key, required this.add}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Bottom 그려짐");
    return Container(
      color: Colors.blue,
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: add,
          child: Text(
            "증가",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 100,
            ),
          ),
        ),
      ),
    );
  }
}

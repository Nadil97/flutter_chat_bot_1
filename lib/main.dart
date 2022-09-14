import 'package:chatbot/Messages.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AMBot',
      theme: ThemeData(brightness: Brightness.dark),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AMbot'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Messages(messages: messages)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                color: Colors.deepPurple,
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.black),
                    ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

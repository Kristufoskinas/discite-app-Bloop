import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final url = "https://jsonplaceholder.typicode.com/posts";

  void postData() async {
    final response = await post(
      Uri.parse(url),
      body: {
        "title": "Anything",
        "body": "Post body",
        "userId": "1",
      },
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: postData,
            child: Text("Send Post"),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HttpSampleScreen(),
    );
  }
}

//Screen(UI)
class HttpSampleScreen extends StatefulWidget {
  const HttpSampleScreen({super.key});

  @override
  State<HttpSampleScreen> createState() => _HttpSampleScreenState();
}

class _HttpSampleScreenState extends State<HttpSampleScreen> {
  final model = HttpSampleModel();

  @override
  void initState() {
    super.initState();
    model.getUiData().whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HttpSampleScreen')),
      body: Center(child: Text('${model.title} : ${model.body}')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.getUiData();
        },
      ),
    );
  }
}

//Model(상태 & 로직)
class HttpSampleModel {
  String _title = '';
  String _body = 'Loading';

  String get title => _title;
  String get body => _body;

  //로직
  Future<String> getData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    return response.body;
  }

  Future<void> getUiData() async {
    final jsonString = await getData();
    final jsonMap =
        jsonDecode(jsonString) as Map; // Map<dynamic, dynmamc> 타입으로 변경
    _title = jsonMap['title'];
    _body = jsonMap['body'];
  }
}

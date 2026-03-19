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

class HttpSampleScreen extends StatefulWidget {
  const HttpSampleScreen({super.key});

  @override
  State<HttpSampleScreen> createState() => _HttpSampleScreenState();
}

class _HttpSampleScreenState extends State<HttpSampleScreen> {
  String body = 'Loading';

  Future<String> getData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final response = await http.get(url); //데이터 가져오기
    print(response.body);
    print(response.statusCode);

    // setState(() {
    //   body = response.body;
    // });
    return response.body;
  }

  @override
  void initState() {
    super.initState();
    // getData().then(
    //   (data) => setState(() {
    //     body = data;
    //   }),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HttpSampleScreen')),
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //데이터가 있을때.
              body = snapshot.data!;
            }
            return Text(body);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData();
        },
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
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
      home: ChangeNotifierProvider<HttpSampleModel>(
        create: (_) => HttpSampleModel(),
        child: HttpSampleScreen(),
        // builder: (context, child) {
        //   return HttpSampleScreen();
        // },
      ),
    );
  }
}

//Screen(UI)
class HttpSampleScreen extends StatelessWidget {
  const HttpSampleScreen({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    // final model = context.watch<HttpSampleModel>();
    return Scaffold(
      appBar: AppBar(title: Text('HttpSampleScreen')),
      body: Center(
        child: Consumer<HttpSampleModel>(
          builder: (context, model, child) {
            return Text('${model.value.title} : ${model.value.body}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          context.read<HttpSampleModel>().fetchData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//Model(상태 & 로직)
class HttpSampleModel extends ValueNotifier<HttpSampleState> {
  HttpSampleModel() : super(HttpSampleState()) {
    fetchData();
  }

  //로직
  Future<String> getData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final response = await http.get(
      url,
      //크롬 부라우저 명시
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
        'Accept': 'application/json',
      },
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  void fetchData() async {
    final jsonString = await getData();
    final jsonMap = jsonDecode(jsonString) as Map;

    //상태변경
    value = value.copyWith(title: jsonMap['title'], body: jsonMap['body']);
  }
}

//State
class HttpSampleState {
  final String title;
  final String body;

  HttpSampleState({this.title = '', this.body = 'Loading'});

  HttpSampleState copyWith({String? title, String? body}) {
    return HttpSampleState(title: title ?? this.title, body: body ?? this.body);
  }
}

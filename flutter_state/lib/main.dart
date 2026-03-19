import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
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
class HttpSampleScreen extends ConsumerWidget {
  const HttpSampleScreen({super.key});

  // @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(modelProvider);
    return Scaffold(
      appBar: AppBar(title: Text('HttpSampleScreen')),
      body: Center(child: Text('${state.title}: ${state.body}')),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          ref.read(modelProvider.notifier).fetchData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//Model(상태 & 로직)
class HttpSampleModel extends Notifier<HttpSampleState> {
  HttpSampleModel() : super();

  @override
  HttpSampleState build() {
    return HttpSampleState();
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
    state = state.copyWith(title: jsonMap['title'], body: jsonMap['body']);
  }
}

final modelProvider = NotifierProvider<HttpSampleModel, HttpSampleState>(
  HttpSampleModel.new,
);

//State
class HttpSampleState {
  final String title;
  final String body;

  HttpSampleState({this.title = '', this.body = 'Loading'});

  HttpSampleState copyWith({String? title, String? body}) {
    return HttpSampleState(title: title ?? this.title, body: body ?? this.body);
  }
}

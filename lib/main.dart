import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = DateTime.now().minute;

  Future<void> _saveColorSelected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("numberValue", number);
    print(number);
  }

  Future<void> _getColorSelected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    number = prefs.getInt("numberValue") as int;

    print(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _saveColorSelected(),
              child: const Text('Save number'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _getColorSelected(),
              child: const Text('Get number'),
            ),
          ],
        ),
      ),
    );
  }
}

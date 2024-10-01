import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var isChecked = false;
  int result = 0;
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();

  void setNewValue() {}

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void myFunction() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
          child: Column(
        children: [Text("About Algonquin"), Text("Contact Us")],
      )),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          OutlinedButton(onPressed: () {}, child: const Text("Login")),
          OutlinedButton(onPressed: () {}, child: const Text("About"))
        ],
        title: const Text("Algonquin College Home"),
      ),
      body: Center(
          child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset("images/algonquin.jpg"),
          const Text(
            "Algonquin College",
            style: TextStyle(color: Colors.red, fontSize: 30.0),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (buttonIndex){
          print("Button $buttonIndex pressed");
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Camera"),
          BottomNavigationBarItem(icon: Icon(Icons.add_call), label: 'Phone')
        ],
      ),
    );
  }
}

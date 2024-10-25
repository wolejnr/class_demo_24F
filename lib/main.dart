import 'package:class_demos/data_repository.dart';
import 'package:class_demos/other_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/info": (context) => const InfoPage()
      },
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
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/algonquin.jpg",
              width: 200.0,
            ),

            TextField(controller: _firstController, decoration: const InputDecoration(hintText: "Username"),),

            TextField(controller: _secondController, decoration: const InputDecoration(hintText: "password"),obscureText: true,),
          

            ElevatedButton(child: const Text("Login"), onPressed: (){
              if(_firstController.value.text.isNotEmpty && _secondController.value.text.isNotEmpty) {
                DataRepository.userName = _firstController.value.text;
                Navigator.pushNamed(context, "/info");
              } else {
                var snackBar = const SnackBar(content: Text("All fields are required!"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              
            },),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

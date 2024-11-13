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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var buttons = ['Button 1', 'Button 2', 'Button 3'];
  final TextEditingController _input = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: reactiveLayout(),
      
    );
  }

  Widget reactiveLayout() {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    if((width > height) && (width > 720)) {
      // Tablet Layout
      return Row(children: [
        Expanded(
          flex: 1,
          child: detailsPage()),
        Expanded(
          flex: 2,
          child: buttonList()),
      ],);
    } else {
      // Mobile Layout
      return Column(children: [
        detailsPage(),
        buttonList()
      ],);
    }
  }

  Widget detailsPage() {
    return Column(children: [
      Image.asset(
              "images/tasklist.png",
              width: 200.0,
            ),

            TextField(controller: _input, decoration: const InputDecoration(hintText: "Display an event..."),),
    ],);
  }

  Widget buttonList() {
    return Expanded(
            child: ListView.builder(
              itemCount: buttons.length,
              itemBuilder: (BuildContext context, int index){
              return Container(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  _input.text = "You pressed ${buttons[index]}";
                }, child: Text(buttons[index])),
              );
            }),
          );
  }

}

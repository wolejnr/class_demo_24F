import 'package:class_demos/database.dart';
import 'package:class_demos/todo_dao.dart';
import 'package:class_demos/todo_item.dart';
import 'package:flutter/material.dart';

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
  
  var items = <TodoItem>[];
  final TextEditingController _input = TextEditingController();

  late ToDoDAO myDAO;

  @override
  void initState() {
    super.initState();

    $FloorAppDatabase.databaseBuilder('app_database.db').build().then((database) {
      myDAO = database.todoDao;
      myDAO.getAllItems().then((listOfItems){
        setState(() {
          items.clear();
          items.addAll(listOfItems);
        });
      });
    });
  }


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
            
            Row(children: [
              ElevatedButton(onPressed: (){
                if(_input.value.text.isNotEmpty) {
                  setState(() {
                    var newItem = TodoItem(TodoItem.ID++, _input.value.text);
                    myDAO.insertItem(newItem);
                  items.add(newItem);
                  _input.text = "";
                });
                } else {
                  var snackBar = SnackBar(content: Text("Input field is required!"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                
              }, child: const Text("Add"),),

              Flexible(child: TextField(
                controller: _input,
                decoration: const InputDecoration(hintText: "Enter a todo item"),)),
            ],),

            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, rowNum){
                  return GestureDetector(
                    onLongPress: (){
                      setState(() {
                        myDAO.deleteItem(items[rowNum]);
                        items.removeAt(rowNum);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Row $rowNum:"),
                        Text(items[rowNum].todoItem)
                      ],
                    ),
                  );
                }),
            )
            
          ],
        ),
      ),
      
    );
  }
}

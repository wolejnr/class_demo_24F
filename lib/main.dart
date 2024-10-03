import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  int _counter = 0;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwdController = TextEditingController();
  String uname = "";
  String passwd = "";

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  /// Load the initial counter value from persistent storage on start,
  /// or fallback to 0 if it doesn't exist.
  Future<void> _loadCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uname = prefs.getString('username') ?? "";
      passwd = prefs.getString('password') ?? "";

      if(uname.isNotEmpty && passwd.isNotEmpty) {
        _usernameController.text = uname;
        _passwdController.text = passwd;
        Future.delayed(Duration(seconds: 1), () {
          var snackBar = SnackBar(
                      content: Text("Credentials loaded successfully"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      }
    });
    
  }

  Future<void> _saveCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('username', _usernameController.value.text);
      prefs.setString("password", _passwdController.value.text);
    });
  }

  Future<void> _clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('username');
      prefs.remove('password');
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextField(
              decoration: InputDecoration(label: Text("Username")),
              controller: _usernameController,
            ),
            TextField(
                decoration: InputDecoration(label: Text("Password")),
                obscureText: true,
                controller: _passwdController),
            ElevatedButton(
                onPressed: () {
                  if (_usernameController.value.text.isEmpty &&
                      _passwdController.value.text.isEmpty) {
                    // show snackbar
                    var snackBar = SnackBar(
                      content: Text("The text fields cannot be blank"),
                      action: SnackBarAction(
                          label: "Undo",
                          onPressed: () {
                            print("Undo was clicked");
                          }),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("Alert Message"),
                            content:
                                Text("Do you want to save this information?"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    _saveCredentials();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Yes')),
                              ElevatedButton(
                                  onPressed: () {
                                    _clearCredentials();
                                    Navigator.pop(context);
                                  },
                                  child: Text('No'))
                            ],
                          ));
                  }
                },
                child: Text("Login")),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

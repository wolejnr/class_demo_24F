import 'package:class_demos/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Information Page")),
        body: Column(
          children: [
            Text("Welcome ${DataRepository.userName}"),
            ElevatedButton(onPressed: (){
              launchUrl(Uri.parse('https://www.algonquincollege.com'));

            }, child: const Icon(Icons.login))
          ],
        ),
      ),
    );
  }
}
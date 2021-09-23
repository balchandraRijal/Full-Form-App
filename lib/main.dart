import 'package:flutter/material.dart';

import 'fullForms.dart';
import 'package:http/http.dart' as http;

void main() => runApp(FullForm());

class FullForm extends StatelessWidget {
  const FullForm({Key? key, List<FullForms>? FullForms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Full Forms App",
      theme: ThemeData(primaryColor: Colors.brown),
      home: MyHomePage(title: "My Home Page"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Full Forms",
          ),
        ),
        body: FutureBuilder<List<FullForms>>(
            future: fetchFullForms(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('An error has occured'),
                );
              } else if (snapshot.hasData) {
                return FullForm(FullForms: snapshot.data!);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}

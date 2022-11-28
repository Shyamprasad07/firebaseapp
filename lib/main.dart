import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/services/api_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'models/posts_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ApiApp(),
    );
  }
}

class ApiApp extends StatefulWidget {
  const ApiApp({super.key});

  @override
  State<ApiApp> createState() => _ApiAppState();
}

class _ApiAppState extends State<ApiApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter fetch data from API "),
      ),
      body: FutureBuilder(
        future: getPosts(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> product = snapshot.data;
            return ListView.builder(
              itemCount: product.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListTile(
                      leading: Image.network(
                       product[ index].thumbnail,
                       width: 100,
                      ),
                      title: Text(product[index].title),
                      subtitle: Row(
                        children: [
                          Expanded(child: Text(product[index].description,)),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(product[index].price.toString(),style:TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      home: const FirebaseTutorial(),
    );
  }
}

class FirebaseTutorial extends StatefulWidget {
  const FirebaseTutorial({super.key});

  @override
  State<FirebaseTutorial> createState() => _FirebaseTutorialState();
}

class _FirebaseTutorialState extends State<FirebaseTutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Tutorials"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //crude operation
            //create button
            ElevatedButton(
                onPressed: () {
                  // lest creat database in firestore
                  // name that data base users
                  var firestore =
                      FirebaseFirestore.instance.collection("users");
                  // it will create a collection is firestore named users
                  // ;ets add a document in firestore named "my doc"
                  var store = firestore.doc('my_doc');
                  // it will add a document in firestore's users collection
                  // lets add users detail in this doc.
                  store.set({
                    //  add map values in this
                    'name': "shyama Dev",
                    'channel': "Youtube",
                    'contact': "1234567"
                  });
                  //  it will add rcored of user
                  // Lets save it
                  
                },
                child: const Text("Create")),
            //Read button
            ElevatedButton(onPressed: () {}, child: const Text("Read")),
            //Update button
            ElevatedButton(onPressed: () {}, child: const Text("Update")),
            //delete button
            ElevatedButton(onPressed: () {}, child: const Text("Delete")),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}

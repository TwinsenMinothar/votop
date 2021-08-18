import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firedart/firedart.dart';

import './UI/ui.dart';
import './models/user_model.dart';

const apiKey = 'AIzaSyA9xaSzba_OskjeVEXb0aQ5YWptteGNfrQ';
const projectId = 'votop-tp';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAuth.initialize(apiKey, VolatileStore());
  Firestore.initialize(projectId);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp(
          title: 'Vo<T>op',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: AdminPanel(),
          debugShowCheckedModeBanner: false,
        ));
  }
}

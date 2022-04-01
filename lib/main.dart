import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:software_engineering/environment.dart';
import 'package:software_engineering/models/app_state.dart';
import 'package:software_engineering/screens/login_screen/login_screen.dart';
import 'package:software_engineering/widgets/curved_background.dart';

void main() async {


  await dotenv.load(fileName: Environment.filename);

  runApp(
    ChangeNotifierProvider<AppState>(
      create: (context)=> AppState(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(
            options:
            FirebaseOptions(apiKey: Environment.apiKey, appId: Environment.appId, messagingSenderId: Environment.messagingSenderId, projectId: Environment.productId)
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            return const LoginScreen();
          }
          return CircularProgressIndicator();
        }),
    );
  }
}


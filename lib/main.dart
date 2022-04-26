import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:software_engineering/environment.dart';
import 'package:software_engineering/models/app_state.dart';
import 'package:software_engineering/screens/homepage/homepage.dart';
import 'package:software_engineering/screens/login_screen/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:software_engineering/screens/page_control/page_control.dart';
import 'package:software_engineering/utils/constants.dart';

void main() async {


  await dotenv.load(fileName: Environment.filename);

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp( name: "software_engineering",
        options:
        FirebaseOptions(
            apiKey: Environment.apiKey,
            appId: Environment.appId,
            messagingSenderId: Environment.messagingSenderId,
            projectId: Environment.productId
        )
    );
  }
  runApp(
    ChangeNotifierProvider<AppState>(
      create: (context)=> AppState(),
      child:  MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {

   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    final FirebaseAuth auth = FirebaseAuth.instance;
    context.read<AppState>().auth = FirebaseAuth.instance;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vroom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: MaterialColor(ashesiRed.value, {}),
        listTileTheme: const ListTileThemeData(
          iconColor: ashesiRed
        )
      ),
      home: StreamBuilder<User?>(
        stream: context.read<AppState>().auth!.userChanges(),
        builder: (context,snapshot){

          if (snapshot.hasData) {
            Navigator.of(context).popUntil((route) => route.isFirst);
            return const PageControl();
          }
          Navigator.of(context).popUntil((route) => route.isFirst);
          return const LoginScreen();
        },
      ),
    );
  }
}


import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Modules/Settings/Tabs/Currency Provider.dart';
import 'Modules/Settings/Tabs/TimePeriod.dart';
import 'Users/Authentication/loginwithmobilenumber.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDKK6kO3aR8cLb90qASqcmOP3YhrPBYQm0",
      appId: "1:866409671969:android:ff79734a13ea31dec96260",
      messagingSenderId: "",
      projectId: "moneymate666",
      storageBucket: "moneymate666.appspot.com",
    ),
  );  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrencyProvider()),
        ChangeNotifierProvider(create: (_) => TimePeriodChanger()),
      ],
      child: MoneyMatesplash(),
    ),
  );
}

class MoneyMatesplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashNew(),
    );
  }
}

class SplashNew extends StatefulWidget {
  const SplashNew({super.key});

  @override
  State<SplashNew> createState() => _SplashNewState();
}

class _SplashNewState extends State<SplashNew> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MobileOtp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Image.asset("assets/images/moneymatewhite.png"),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/AfterOrder.dart';
import 'pages/Aboutus.dart';
import 'pages/cart.dart';
import 'pages/food-menu.dart';
import 'pages/home.dart';
import 'pages/introducation.dart';
import 'pages/login.dart';
import 'pages/signup.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/", 
      routes: {  
        '/': (context) => IntroPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => Signup(),
        '/home': (context) => HomePage(),
        '/cart':(context)=>CartPage(),
        '/about':(context)=>Aboutus(),
        '/after':(context)=>Afterorder()
      },
      onGenerateRoute: (settings) { 
        if (settings.name == '/menu') {
          return MaterialPageRoute( 
            builder: (context) => FoodMenuScreen( 
              items: [], 
            backgroundImage: '',
            ),
          );
        }
        return null; 
      },
    );
  }
}

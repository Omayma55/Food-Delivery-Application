import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>(); 
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFFFFA726), Color(0xFFFF7043)],begin: Alignment.topCenter,end: Alignment.bottomCenter,),
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
                  child: Form(key: _formKey, 
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        
                        Text('Login',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2,fontFamily: "myfont",
                            shadows: const [
                              Shadow(blurRadius: 8, color: Colors.black87, offset: Offset(2, 2)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),
                        
                        Container( 
                          decoration: BoxDecoration( 
                            color: Colors.deepOrange[100],borderRadius: BorderRadius.circular(66),),
                          width: 300,padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: emailController, 
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              return null;
                            },
                            decoration: InputDecoration( 
                              icon: Icon(Icons.person, color: Colors.deepOrange[800]),hintText: "Your Email :",border: InputBorder.none,),
                          ),
                        ),
                        const SizedBox(height: 20),
                     
                        Container(
                          decoration: BoxDecoration(color: Colors.deepOrange[100],borderRadius: BorderRadius.circular(66),),
                          width: 300,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffix: Icon(Icons.visibility, color: Colors.deepOrange[900]),
                              icon: Icon(Icons.lock, color: Colors.deepOrange[800], size: 19),
                              hintText: "Password :",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) { 
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,padding: const EdgeInsets.symmetric(horizontal: 106, vertical: 12),shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(27),
                            ),),
                          child: const Text( "login", style: TextStyle(fontSize: 24, color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

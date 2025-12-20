import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});//constructor

  final _formKey = GlobalKey<FormState>(); //علشان نتحقق من صحة الفورم
  final TextEditingController emailController = TextEditingController();//بيعمل كنترولر الإيميل
  final TextEditingController passwordController = TextEditingController();//بيعمل كنترول للكلمه السر

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // الخلفية
            Container(//ده ال فيها الخلفيه 
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFFFFA726), Color(0xFFFF7043)],begin: Alignment.topCenter,end: Alignment.bottomCenter,),//علشان نعمل خلفيه متدرجه
              ),
            ),
            SingleChildScrollView(//بيخلينى اقدر اسحب الشاشه من فوق لتحت
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
                  child: Form(key: _formKey, // علشان نقدر نتحقق من صحه البيانات
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // كلمة Login
                        Text('Login',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2,fontFamily: "myfont",
                            shadows: const [
                              Shadow(blurRadius: 8, color: Colors.black87, offset: Offset(2, 2)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),
                        // Email
                        Container( //ده الإطار
                          decoration: BoxDecoration( //مسئول عن شكل الحقل
                            color: Colors.deepOrange[100],borderRadius: BorderRadius.circular(66),),
                          width: 300,padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(//المستخدم هيكتب فيه الايميل
                            controller: emailController, //علشان نقدر نقرأ ونتابع اللي المستخدم كتبه ونتاكد انه مش فاضى
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              return null;
                            },
                            decoration: InputDecoration( //علشان نعمل ستايل للحقل من جوا
                              icon: Icon(Icons.person, color: Colors.deepOrange[800]),hintText: "Your Email :",border: InputBorder.none,),
                          ),
                        ),
                        const SizedBox(height: 20),
                        //نفس الكلام
                        // Password
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
                        // زرار تسجيل الدخول
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) { // بيشغّل الـ validator بتاع كل TextFormField في الفورم. علشان يتاكد انه مش فاضى
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          style: ElevatedButton.styleFrom(//دى طريقه تانيه علشان نعمل ستيل للزرار
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

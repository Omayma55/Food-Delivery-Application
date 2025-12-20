import 'package:flutter/material.dart';
class Afterorder extends StatelessWidget {
  const Afterorder({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/712bc4ac83d15175aefcd862a1794a54.jpg',
            fit: BoxFit.cover,
          ),
          // طبقة شفافة خفيفة فوق الصورة عشان الكلام يظهر واضح
          Container(color: Colors.black.withOpacity(0.3),),
          Column(
              children: [
                const Spacer(flex: 4), // يزق الكلام لتحت
                const Text(
                  "Your order is on the way!",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "myfont",
                  ),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                          onPressed: () {
                            { // بيشغّل الـ validator بتاع كل TextFormField في الفورم. علشان يتاكد انه مش فاضى
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          style: ElevatedButton.styleFrom(//دى طريقه تانيه علشان نعمل ستيل للزرار
                            backgroundColor: Colors.deepOrange,padding: const EdgeInsets.symmetric(horizontal: 106, vertical: 12),shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(27),
                            ),),
                          child: const Text( "Back to menu", style: TextStyle(fontSize: 24, color: Colors.white),),
                        ),
                const Spacer(flex: 1), // مسافة تحت النص
              ],
            ),
          ],
        ),
      ),
    );
  }
}
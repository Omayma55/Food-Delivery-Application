import 'package:flutter/material.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea( //علشان نضمن ان الصفحه ماتتداخلش مع الnotch و ال status bar
      child: Scaffold( //علشان نضمن ان الصفحه ماتتداخلش مع الnotch و ال status bar
        body: Stack( // بتحط العناصر فوق بعض 
          fit: StackFit.expand,
          children: [
            // الخلفية
            Image.asset(
              'assets/images/flat-lay-arrangement-with-salad-box-sauce.jpg',
              fit: BoxFit.cover,
            ),
            Container(color: Colors.black.withOpacity(0.3)),// طبقه شفافه سوادا فوق الصوره علشان الكلام يبان 
            // Skip button
            Positioned(top: 16,right: 16,   // مكانه
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/home"); // لو دوسنا عليه يروح للصفحه ال home
                                  },
                child: Text("Skip",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 6, //مدى التمويه للظل
                        color: Colors.black,
                        offset: Offset(1, 1), //الظل هيتحرك 1 بيكسل يمين و 1 بيكسل تحت
                      )
                    ],),),),),
                    Positioned( top: 16,left: 16,
                      child: TextButton(onPressed: (){
                        Navigator.pushNamed(context, '/about');
                      }, child: Text("About Us",style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold,
                      shadows:[
                        Shadow(
                          blurRadius: 6, color: Colors.black,offset: Offset(1, 1),
                        )
                      ] ),))
                    ),
            Column(// برتب الكلام او الزاراير من فوق لتحت ك عمود
              mainAxisSize: MainAxisSize.min,  // يعنى العمود هياخد اقل مساحه ممكنه
              children: [ 
                Text("Welcome",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,letterSpacing: 1.5,
                    shadows: const [
                      Shadow(blurRadius: 10,color: Colors.black,offset: Offset(2, 2),),
                    ],),),
              ],
            ),
            const SizedBox//ده Widget فاضي، يعني ما بيعرضش حاجة، بس وظيفته إنه يسيب مساحة فاضية بين العناصر
            (height: 10),//ده معناه إنه هيحجز فراغ رأسي ارتفاعه 10 بيكسل.
            Center( // احط الكلام فى النص الصفحه
              child: Column( // ارتبهم ك عمود فوق بعض
                mainAxisSize: MainAxisSize.min,// عشان ميفرضش نفسه 
                children: [
                  Text('Hungry?',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2,fontFamily: "myfont",//الخط ده انا المحملها ومسميه كده , فى yaml
                      shadows: const [
                        Shadow(blurRadius: 8,color: Colors.black87,offset: Offset(2, 2),),
                      ],),),
                  Text('Order now!',style: TextStyle(  fontSize: 50,fontFamily: "myfont",color: Colors.orangeAccent,fontWeight: FontWeight.bold,letterSpacing: 2,
                      shadows: const [
                        Shadow(blurRadius: 8,color: Colors.black87,offset: Offset(2, 2),),
                      ],),),
                  const SizedBox(height: 150),
                  SizedBox(// زى م قولنا ان السيزبوكس ده ويدجيت فاضيه بس بترتب شكل الصفحه 
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center, // يعنى هنرتبهم في النص بالطول
                      //crossAxisAlignment: CrossAxisAlignment.center, //يعنى هنرتبهم في النص بالعرض
                      children: [
                        ElevatedButton(
                          onPressed: () {Navigator.pushNamed(context, "/login");},//لما ندوس على الزرار يروح لصفحه ال تسجيل الدخول
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange),//  ال عليه خط فى النص ده وسيط علشان ال الاستيل بتاع الزراير مش بياخد الالوان والشكل بشكل مباشر بس في طريقه تانيه عملتها في الباقى الصفح
                            padding: MaterialStateProperty.all( // المسافه بين حدود الزرار و الكلمه الجوه
                                EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder( //شكل ال زرار
                                borderRadius: BorderRadius.circular(27))),
                          ),
                          child: Text("login",style: TextStyle(fontSize: 24, color: Colors.white),),
                        ),
                        SizedBox(height: 22,),
                        ElevatedButton( // نفس الكلام لل signup
                          onPressed: () { Navigator.pushNamed(context, "/signup");},
                          style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.orange[100]),
                          padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(horizontal: 77, vertical: 13)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(27))),
                          ),
                          child: Text("SIGNUP",style: TextStyle(fontSize: 17, color: Colors.grey[850]),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

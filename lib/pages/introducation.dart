import 'package:flutter/material.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold( 
        body: Stack( 
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/flat-lay-arrangement-with-salad-box-sauce.jpg',
              fit: BoxFit.cover,
            ),
            Container(color: Colors.black.withOpacity(0.3)),
           
            Positioned(top: 16,right: 16,   
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/home"); 
                                  },
                child: Text("Skip",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 6, 
                        color: Colors.black,
                        offset: Offset(1, 1), 
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
            Column(
              mainAxisSize: MainAxisSize.min,  
              children: [ 
                Text("Welcome",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,letterSpacing: 1.5,
                    shadows: const [
                      Shadow(blurRadius: 10,color: Colors.black,offset: Offset(2, 2),),
                    ],),),
              ],
            ),
            const SizedBox
            (height: 10),
            Center( 
              child: Column( 
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Hungry?',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2,fontFamily: "myfont",
                      shadows: const [
                        Shadow(blurRadius: 8,color: Colors.black87,offset: Offset(2, 2),),
                      ],),),
                  Text('Order now!',style: TextStyle(  fontSize: 50,fontFamily: "myfont",color: Colors.orangeAccent,fontWeight: FontWeight.bold,letterSpacing: 2,
                      shadows: const [
                        Shadow(blurRadius: 8,color: Colors.black87,offset: Offset(2, 2),),
                      ],),),
                  const SizedBox(height: 150),
                  SizedBox(
                    child: Column(
                     
                      children: [
                        ElevatedButton(
                          onPressed: () {Navigator.pushNamed(context, "/login");},
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange),
                            padding: MaterialStateProperty.all( 
                                EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder( 
                                borderRadius: BorderRadius.circular(27))),
                          ),
                          child: Text("login",style: TextStyle(fontSize: 24, color: Colors.white),),
                        ),
                        SizedBox(height: 22,),
                        ElevatedButton( 
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

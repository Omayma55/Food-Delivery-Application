import 'package:flutter/material.dart';
class Aboutus extends StatelessWidget {
const Aboutus({super.key}) ;
  
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
            Column(
              children: [
              const Text("Team Members",style: TextStyle(fontSize: 28,fontFamily: "myfont", fontWeight: FontWeight.bold,color: Colors.white),),
                
                
              ],
            ),
            Center(
          child:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("• Omayma Hassan (ID:12400690)" ,style: TextStyle(fontSize: 20,color: Colors.white),),
                const SizedBox(height: 10),
                const Text("• Rabab Ahmed (ID:12400218)",style: TextStyle(fontSize: 20,color: Colors.white),),
                const SizedBox(height: 10),
                const Text("• Esraa Rade (ID:12400222)",style: TextStyle(fontSize: 20,color: Colors.white),),
                const SizedBox(height: 10),
          ],),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                const Spacer(),
                Padding(padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){},
                    icon: const Icon(Icons.facebook,color: Colors.white,)),
                    IconButton(onPressed: (){},
                    icon: const Icon(Icons.camera_alt,color: Colors.white,)),
                    IconButton(onPressed: (){},
                    icon: const Icon(Icons.alternate_email,color: Colors.white,)),
                ],
                ),)

              ],
            ),
    ],),),);
  }
}

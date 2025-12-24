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
          Container(color: Colors.black.withOpacity(0.3),),
          Column(
              children: [
                const Spacer(flex: 4), 
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
                            { 
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,padding: const EdgeInsets.symmetric(horizontal: 106, vertical: 12),shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(27),
                            ),),
                          child: const Text( "Back to menu", style: TextStyle(fontSize: 24, color: Colors.white),),
                        ),
                const Spacer(flex: 1), 
              ],
            ),
          ],
        ),
      ),
    );
  }
}

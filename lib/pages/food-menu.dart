import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/food-list.dart';
import 'FoodDetail.dart';
import 'cart_model.dart';
class FoodMenuScreen extends StatelessWidget {
  final List<FoodList> items; 
  final String backgroundImage;
  const FoodMenuScreen({
    super.key,
    required this.items,
    required this.backgroundImage,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
      
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepOrange.withOpacity(0.7),
                Colors.deepOrangeAccent.withOpacity(0.9),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: GridView.count( 
            crossAxisCount: 2, 
            mainAxisSpacing: 12, 
            crossAxisSpacing: 12,
            childAspectRatio: 2, 
            children: items.map((item) { 
              return GestureDetector(
                onTap: () { 
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context) => FoodDetailScreen(item: item), 
                    ),
                  );
                },
                child: Card( 
                  shape: RoundedRectangleBorder(  
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4, 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, 
                    children: [
                      Expanded( 
                        child: ClipRRect( 
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)), 
                          child: AspectRatio(  
                            aspectRatio: 1, 
                            child: Image.asset( 
                              item.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8), 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, 
                          children: [
                            Text(item.name,
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),
                              overflow: TextOverflow.ellipsis, 
                            ),
                            const SizedBox(height: 4),
                            Text(item.price,
                              style: const TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 14,),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () {
                         
                            CartModel.addItem({
                              'name': item.name,
                              'price': double.parse(item.price.replaceAll('EGP', '').trim()), 
                              'quantity': 1, 
                              'image': item.image,
                              'size': 'Medium', 
                            });
                            ScaffoldMessenger.of(context).showSnackBar( 
                              const SnackBar(
                                content: Text('The item has been added to cart'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom( 
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: const Text('Add to cart'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(), 
          ),
        ),
      ],
    );
  }
}

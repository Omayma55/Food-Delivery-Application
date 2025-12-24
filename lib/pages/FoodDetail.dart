import 'package:flutter/material.dart';
import 'food-list.dart';
import 'cart_model.dart';  
class FoodDetailScreen extends StatefulWidget { 
  final FoodList item; 
  const FoodDetailScreen({super.key, required this.item}); 
  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState(); 
}
class _FoodDetailScreenState extends State<FoodDetailScreen> {
  String selectedSize = 'Medium'; 
  int quantity = 1; 
  List<String> sizes = ['Small', 'Medium', 'Large'];
  Map<String, double> sizePrices = { 
    'Small': 0.8,
    'Medium': 1.0,
    'Large': 1.3,
  };
  @override
  Widget build(BuildContext context) {
    double basePrice = double.parse(widget.item.price.split(' ')[0]); 
    double currentPrice = basePrice * sizePrices[selectedSize]!;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.item.image,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.name,
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "EGP ${currentPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text("Choose Size:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: sizes.map((size) {
                            return ChoiceChip(
                              label: Text(size),
                              selected: selectedSize == size,
                              onSelected: (selected) {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              selectedColor: Colors.deepOrange,
                              labelStyle: TextStyle(
                                color: selectedSize == size ? Colors.white : Colors.black,
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Ingredients: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            Text( widget.item.description,style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("How Many?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Spacer(), 
                            IconButton(
                              icon: Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                            ),
                            Text(quantity.toString(), style: TextStyle(fontSize: 18)),
                            IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5)),
              ],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("The total ", style: TextStyle(fontSize: 16)),
                    Text(
                      "EGP ${(currentPrice * quantity).toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                    ),
                  ],
                ),
                Spacer(),
                Expanded( 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      
                      double finalPrice = currentPrice * quantity;
                      CartModel.addItem({
                        "name": widget.item.name,
                        "price": finalPrice,
                        "image": widget.item.image,
                        "size": selectedSize,
                        "description":widget.item.description,
                        "quantity": quantity,
                      });
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added ${widget.item.name} To cart'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart),
                        SizedBox(width: 8),
                        Text("Add to cart "),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

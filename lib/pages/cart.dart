import 'package:flutter/material.dart';
import 'cart_model.dart';
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = CartModel.items;
    double total = 0;
    for (var item in cartItems) { 
      total += item['price'] * item['quantity'];
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),

      body: cartItems.isEmpty
          ? const Center(child: Text('The cart is empty!!'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder( 
                    itemCount: cartItems.length, 
                    itemBuilder: (context, index) {
                      final item = cartItems[index]; 
                      return ListTile(
                        leading: Image.asset(item['image'], width: 50, height: 50), 
                        title: Text(item['name']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, 
                          children: [
                            Text('Size : ${item['size']}'),
                            Text('Quantity : ${item['quantity']}'),
                          ],
                        ),
                        trailing: Text('EGP ${(item['price'] * item['quantity']).toStringAsFixed(2)}'), 
                      );
                    },
                  ),
                ),
                Container( 
                  padding: const EdgeInsets.all(16), 
                  decoration: const BoxDecoration( 
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, -2)),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Total :",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            "EGP ${total.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton( 
                        onPressed: () {
                          
                          _showConfirmationDialog(context); 
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle),
                            SizedBox(width: 8),
                            Text("Confirm order"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

 
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog( 
          title: Text("Confirm order"),
          content: Text("Are you sure you want to confirm this request ?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                CartModel.clearCart(); 
                Navigator.pushNamed(context, '/after'); 
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('The Request has been successfully confirmed !'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: Text("Confirmation ?"),
            ),
          ],
        );
      },
    );
  }
}


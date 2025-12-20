import 'package:flutter/material.dart';
import 'cart_model.dart';
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = CartModel.items; //بينادى ال عملنه فى ال Model 
    double total = 0; //للتعامل ب الكسور
    for (var item in cartItems) { //علشان نحسب السعر النهائي
      total += item['price'] * item['quantity'];
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),

      body: cartItems.isEmpty //لو العربيه فاضيه
          ? const Center(child: Text('The cart is empty!!'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder( // بيبني لستة ديناميكية حسب عدد العناصر
                    itemCount: cartItems.length, // عدد العناصر في السلة
                    itemBuilder: (context, index) {
                      final item = cartItems[index]; // جاب العنصر الحالي حسب رقمه في الليست
                      return ListTile(
                        leading: Image.asset(item['image'], width: 50, height: 50), // الصورة اللي على الشمال
                        title: Text(item['name']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // يخلي الكلام يبدأ من الشمال
                          children: [
                            Text('Size : ${item['size']}'),
                            Text('Quantity : ${item['quantity']}'),
                          ],
                        ),
                        trailing: Text('EGP ${(item['price'] * item['quantity']).toStringAsFixed(2)}'), // السعر الإجمالي للطلب ده
                      );
                    },
                  ),
                ),
                Container( //// حاوية للفوتر اللي فيه الإجمالي وزر التأكيد
                  padding: const EdgeInsets.all(16), // مسافة داخلية من كل الاتجاهات
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
                      ElevatedButton( // زر تأكيد الطلب
                        onPressed: () {
                          // تأكيد الطلب
                          _showConfirmationDialog(context); // ينفذ دالة بتفتح نافذة تأكيد
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

  // الة نافذة التأكيد (_showConfirmationDialog):
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog( // محتوى النافذة
          title: Text("Confirm order"),
          content: Text("Are you sure you want to confirm this request ?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // إغلاق النافذة المنبثقة
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                CartModel.clearCart(); // مسح العربة بعد التأكيد
                Navigator.pushNamed(context, '/after'); // إغلاق النافذة المنبثقة
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


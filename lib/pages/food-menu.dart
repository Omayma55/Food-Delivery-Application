import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/food-list.dart';
import 'FoodDetail.dart';
import 'cart_model.dart';
class FoodMenuScreen extends StatelessWidget {
  final List<FoodList> items; // بستدعى العناصر الموجوده في foodlist
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
        // الخلفية 
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
          child: GridView.count( //لعرض العناصر في شبكة
            crossAxisCount: 2, // عمودين جنب بعض
            mainAxisSpacing: 12, //لمسافة بين العناصر في الاتجاه العمودى
            crossAxisSpacing: 12,//المسافة بين العناصر في الاتجاه العرضي.
            childAspectRatio: 2, // النسبة بين الطول والعرض
            children: items.map((item) { // تحويل قائمة الـ items إلى عناصر مرئية داخل الـ Grid.
              return GestureDetector(
                onTap: () { //لما ادوس على الصور بتاعت الاكله يروح على الوصف
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context) => FoodDetailScreen(item: item), // عرض تفاصيل الطعام في الشاشة الجديدة
                    ),
                  );
                },
                child: Card( // استخدام الـ Card لإضفاء تأثير مادي مع حواف دائرية وارتفاع.
                  shape: RoundedRectangleBorder( //شكل ال كارد 
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4, //تحديد الظل
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // تمدد العناصر لتملأ المساحة عرضياً داخل الـكارد
                    children: [
                      Expanded( // لتوسيع الصورة لتأخذ المساحة المتاحة داخل الـ Column
                        child: ClipRRect( //قص الصورة إلى شكل مستدير من الأعلى
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)), // إضافة تقوس في الزوايا العلوية للصورة.
                          child: AspectRatio(  //لضبط نسبة الأبعاد (العرض إلى الارتفاع) للصورة
                            aspectRatio: 1, //لضبط نسبة الأبعاد (العرض إلى الارتفاع) للصورة
                            child: Image.asset( //تحميل الصوره من yaml 
                              item.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8), //حديد المسافة حول العنصر
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, 
                          children: [
                            Text(item.name,
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),
                              overflow: TextOverflow.ellipsis, // إذا كان النص أطول من المساحة المتاحة، يتم إضافة ثلاث نقاط "..." في النهاية
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
                            // إضافة العنصر إلى العربة
                            CartModel.addItem({
                              'name': item.name,
                              'price': double.parse(item.price.replaceAll('EGP', '').trim()), // تحويل السعر إلى رقم
                              'quantity': 1, // افترض أن الكمية هي 1 عند إضافة العنصر
                              'image': item.image,
                              'size': 'Medium', // افترض حجمًا معينًا 
                            });
                            ScaffoldMessenger.of(context).showSnackBar( //الرساله البتظهر لما اطلب من صفحه ال هوم
                              const SnackBar(
                                content: Text('The item has been added to cart'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom( // لزرار ال لما ادوسه يضيف على العربه ويظهر الكلام الفوق
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: const Text('Add to cart'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(), //تحويل النتائج إلى قائمة قابلة للاستخدام: للداله(map)
          ),
        ),
      ],
    );
  }
}

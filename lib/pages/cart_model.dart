
//ده كلاس معمول مخصوص عشان يمثّل السلة (Cart) في التطبيق بتاع الأكل
class CartModel {
  static List<Map<String, dynamic>> items = []; //دي ليستة (List) فاضية في الأول، هنحط فيها كل العناصر اللي المستخدم بيضيفها للسلة.

  static void addItem(Map<String, dynamic> newItem) { //بتضيف عنصر جديد للسلة. لكن قبل ما تضيفه، بتشوف:هل في عنصر بنفس الاسم وبنفس الحجم موجود أصلاً؟لو موجود: بتزوّد الكمية بس.لو مش موجود: بتضيف العنصر الجديد على طول.
    bool found = false;
    for (var item in items) {
      if (item['name'] == newItem['name'] && item['size'] == newItem['size']) {
        item['quantity'] += newItem['quantity'];
        found = true;
        break;
      }
    }
    if (!found) {
      items.add(newItem);
    }
  }
  static void clearCart() { //هنستخدمها  بعد ما المستخدم يعمل أوردر.
    items.clear();
  }
  static double getTotalPrice() { //بتحسب السعر الإجمالي لكل الحاجات في السلة.
    return items.fold(0.0, (total, item) => total + item['price'] * item['quantity']);
  }
}
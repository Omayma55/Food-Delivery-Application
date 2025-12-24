
class CartModel {
  static List<Map<String, dynamic>> items = []; 

  static void addItem(Map<String, dynamic> newItem) { .
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
  static void clearCart() { 
    items.clear();
  }
  static double getTotalPrice() { 
    return items.fold(0.0, (total, item) => total + item['price'] * item['quantity']);
  }
}

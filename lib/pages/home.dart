import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/food-list.dart';
import 'cart_model.dart';
import 'FoodDetail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            elevation: 6,
            shadowColor: Colors.black,
            centerTitle: true,
            title: const Text("Food Menu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: "myfont",
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              tabs: [
                Tab(icon: Icon(Icons.local_pizza), text: 'Pizza'),
                Tab(icon: Icon(Icons.fastfood), text: 'Burger'),
                Tab(icon: Icon(Icons.ramen_dining), text: 'Chinese'),
                Tab(icon: Icon(Icons.cake), text: 'Desserts'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildCategoryTab(context, pizzaItems),
              buildCategoryTab(context, burgerItems),
              buildCategoryTab(context, chineseItems),
              buildCategoryTab(context, dessertItems),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.deepOrange,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            currentIndex: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_customize_outlined),
                label: "Home Page",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                Navigator.pushReplacementNamed(context, "/");
              } else if (index == 1) {
                Navigator.pushReplacementNamed(context, '/cart');
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildCategoryTab(BuildContext context, List<FoodList> items) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepOrange.withOpacity(0.7),
                Colors.deepOrangeAccent.withOpacity(0.9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
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
            children: items.map((item) => buildFoodCard(context, item)).toList(),
          ),
        ),
      ],
    );
  }

  Widget buildFoodCard(BuildContext context, FoodList item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailScreen(item: item),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(item.price,
                    style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 14),
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
                child: const Text('Add to cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


final pizzaItems = [
  FoodList(name: "Margherita Pizza", price: "200 EGP", image: "assets/images/foodiesfeed.com_pizza-fresh-out-of-oven-close-up.jpg", description: 'Pizza Dough , Tomato Sauce , Mozzarella Cheese , Fresh Basil , Olive Oil'),
  FoodList(name: "Pepperoni Pizza", price: "199 EGP", image: "assets/images/foodiesfeed.com_pizza-salami.jpg", description: 'Pizza Dough , Tomato Sauce , Mozzarella Cheese , Pepperoni Slices , Olive Oil'),
  FoodList(name: "Cheese Pizza", price: "250 EGP", image: "assets/images/foodiesfeed.com_pizza-detail.jpg", description: 'Pizza Dough , Tomato Sauce , Mozzarella Cheese , Parmesan Cheese , Olive Oil'),
  FoodList(name: "Chicken Ranch Pizza", price: "300 EGP", image: "assets/images/images chichen ranch.jpeg", description: 'Pizza Dough , Ranch Dressing , Cooked Chicken , Mozzarella Cheese , Cheddar Cheese , Bacon , Onions , Olive Oil'),
];

final burgerItems = [
  FoodList(name: "Cheese burger", price: "170 EGP", image: "assets/images/foodiesfeed.com_cheeseburger.jpg", description: 'Bun , Ground Beef Patty , Cheese , Lettuce , Tomato , Onions , Pickles , Ketchup , Mustard , Mayonnaise'),
  FoodList(name: "beef Burger", price: "180 EGP", image: "assets/images/foodiesfeed.com_beef-burger-with-homemade-baked-potatoes.jpg", description: 'Bun , Ground Beef Patty ,  Lettuce , Tomato , Onions , Pickles , Ketchup , Mustard , Mayonnaise'),
  FoodList(name: "chicken Burger", price: "180 EGP", image: "assets/images/fried-chicken-burger-main-header.webp", description: 'Bun , Chicken Patty , Cheese , Lettuce , Tomato , Onions , Pickles , Ketchup , Mustard , Mayonnaise'),
  FoodList(name: "Zinger Chicken Burger", price: "180 EGP", image: "assets/images/download Zinger.jpeg", description: 'Bun , Crispy Fried Chicken Patty , Cheese , Lettuce , Tomato , Onions , Pickles , Ketchup , Mustard , Mayonnaise'),
];

final chineseItems = [
  FoodList(name: "Noodles", price: "200 EGP", image: "assets/images/220224_Soy-Sauce-Pan-Fried-Noodles_2.jpg", description: 'Noodles , Beef < Peppers , Carrots , Onions , Soy Sauce , Oyster Sauce , Sesame Oil , Garlic , Ginger'),
  FoodList(name: "Chicken Sweet & Sour", price: "300 EGP", image: "assets/images/220728_Air-Fryer-Sweet-And-Sour-Chicken_550.jpg", description: 'Chicken , Batter , Sweet and sour sauce , Onions , Pineapple , Carrots'),
  FoodList(name: "Dumpling", price: "200 EGP", image: "assets/images/1605802271825.webp", description: 'Dumpling dough,Minced meat or shrimp,Chopped ginger,Minced garlic,Spring onions,Soy sauce,Sesame oil'),
  FoodList(name: "Hot Pot", price: "200 EGP", image: "assets/images/hqdefault.jpg", description: "Rich broth with sliced beef or chicken, mushrooms, noodles, cabbage, tofu, and hot sauces."),
];

final dessertItems = [
  FoodList(name: "Chocolate Cake", price: "100 EGP", image: "assets/images/53096885Chocolate Cake.webp", description: "Moist cake made with flour, cocoa powder, sugar, eggs, milk, and topped with melted chocolate."),
  FoodList(name: "Ice Cream", price: "20 EGP", image: "assets/images/50050-five-minute-ice-cream-DDMFS-4x3-076-fbf49ca6248e4dceb3f43a4f02823dd9.jpg", description: "Creamy dessert made from heavy cream, condensed milk, and flavored with vanilla or chocolate."),
  FoodList(name: "eclier", price: "120 EGP", image: "assets/images/eclair.jpg", description: "French pastry filled with vanilla custard and topped with rich chocolate glaze."),
  FoodList(name: "Cheese Cake", price: "120 EGP", image: "assets/images/cheesecake.jpg", description: "Rich dessert made with cream cheese, sugar, eggs, and a biscuit or graham cracker crust, often topped with fruit or sauce."),
];

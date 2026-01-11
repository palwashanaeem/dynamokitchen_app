
import 'package:flutter/material.dart';
import 'pages/favorites_page.dart';
import 'pages/cart_page.dart';
import 'pages/profile_page.dart';
import 'widgets/dish_card.dart';
import 'widgets/dish_details.dart';
import 'utils/global_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _searchQuery = "";

  final List<Map<String, dynamic>> dishes = [
    {
      "title": "Spicy Penne Pasta",
      "description":
          "Get ready to spice up your dinner with this tantalizing Spicy Penne Pasta! Bursting with flavors ....",
      "reviews": "170 Reviews",
      "stars": 5.0,
      "prep": "25 min",
      "cook": "1 hr",
      "feeds": "4-5",
      "image": "assets/images/pasta.png",
      "price": "\$300",
    },
    {
      "title": "Spaghetti Bolognese",
      "description":
          "A rich, hearty bowl of this spaghetti bolognese prepared with ground beef and other classic ...",
      "reviews": "150 Reviews",
      "stars": 4.5,
      "prep": "25 min",
      "cook": "1 hr",
      "feeds": "4-5",
      "image": "assets/images/spaghetti.jpg",
      "price": "\$200",
    },
    {
      "title": "Soy Sauce Pan Fried Noodles",
      "description":
          "10-minute easy soy sauce pan fried noodles made with fresh egg noodles, bean sprouts, green onion ...",
      "reviews": "100 Reviews",
      "stars": 4.0,
      "prep": "15 min",
      "cook": "30 mins",
      "feeds": "1-2",
      "image": "assets/images/Noddles.jpg",
      "price": "\$200",
    },
    {
      "title": "Crispy Comté Frico Cheeseburgers",
      "description":
          "Anna Theoktisto's Crispy Comté Cheeseburgers uses brioche hamburger buns, butter lettuce, and red ...",
      "reviews": "190 Reviews",
      "stars": 5.0,
      "prep": "25 min",
      "cook": "1 hr",
      "feeds": "1-2",
      "image": "assets/images/burger.jpg",
      "price": "\$400",
    },
  ];

  Widget _buildHomeContent() {
    List<Map<String, dynamic>> filteredDishes = dishes
        .where((dish) =>
            dish["title"].toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Search your favorite dish...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: filteredDishes.length,
            itemBuilder: (context, index) {
              final dish = filteredDishes[index];
              return DishCard(
                title: dish["title"],
                description: dish["description"],
                reviews: dish["reviews"],
                stars: dish["stars"],
                prep: dish["prep"],
                cook: dish["cook"],
                feeds: dish["feeds"],
                imagePath: dish["image"],
                price: dish["price"],
                onOrder: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DishDetailsPage(
                        title: dish["title"],
                        description: dish["description"],
                        reviews: dish["reviews"],
                        stars: dish["stars"],
                        prep: dish["prep"],
                        cook: dish["cook"],
                        feeds: dish["feeds"],
                        imagePath: dish["image"],
                        price: dish["price"],
                      ),
                    ),
                  ).then((value) {
                    if (value == true) {
                      setState(() {}); // Refresh badge when cart updates
                    }
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomeContent(),
      const FavoritesPage(),
      const CartPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        title: _selectedIndex == 0
            ? const Text(
                "WELCOME TO DYNAMO KITCHEN!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              )
            : null,
        backgroundColor: Colors.orange[400],
        centerTitle: true,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (cartList.isNotEmpty)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Text(
                        '${cartList.length}', // ✅ Number of items in cart
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: "Cart",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

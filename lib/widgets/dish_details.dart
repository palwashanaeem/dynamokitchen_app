

import 'package:flutter/material.dart';
import '../utils/global_data.dart';

class DishDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final String reviews;
  final double stars;
  final String prep;
  final String cook;
  final String feeds;
  final String imagePath;
  final String price;

  const DishDetailsPage({
    super.key,
    required this.title,
    required this.description,
    required this.reviews,
    required this.stars,
    required this.prep,
    required this.cook,
    required this.feeds,
    required this.imagePath,
    required this.price,
  });

  void addToCart(BuildContext context) {
    final index = cartList.indexWhere((item) => item["title"] == title);
    if (index >= 0) {
      cartList[index]["quantity"]++;
    } else {
      cartList.add({
        "title": title,
        "imagePath": imagePath,
        "price": price,
        "quantity": 1,
      });
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$title added to cart")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orange[400],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Dish Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            /// Title and Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            /// Stars and Reviews
            Row(
              children: [
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < stars ? Icons.star : Icons.star_border,
                      color: Colors.orange,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "$reviews",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 15),

            /// Description
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 25),

            /// Prep | Cook | Feeds with Icons (Green)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(Icons.access_time, color: Colors.green, size: 28),
                    const SizedBox(height: 6),
                    Text("Prep\n$prep", textAlign: TextAlign.center),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.timer, color: Colors.green, size: 28),
                    const SizedBox(height: 6),
                    Text("Cook\n$cook", textAlign: TextAlign.center),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.group, color: Colors.green, size: 28),
                    const SizedBox(height: 6),
                    Text("Feeds\n$feeds", textAlign: TextAlign.center),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),

            /// Add to Cart Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  addToCart(context);
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

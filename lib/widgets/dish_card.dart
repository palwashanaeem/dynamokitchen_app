
import 'package:flutter/material.dart';
import '../utils/global_data.dart';

class DishCard extends StatefulWidget {
  final String title;
  final String description;
  final String reviews;
  final double stars;
  final String prep;
  final String cook;
  final String feeds;
  final String imagePath;
  final String price;
  final VoidCallback onOrder;

  const DishCard({
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
    required this.onOrder,
  });

  @override
  State<DishCard> createState() => _DishCardState();
}

class _DishCardState extends State<DishCard> {
  bool get isFavorite {
    return favoritesList.any((dish) => dish["title"] == widget.title);
  }

  void toggleFavorite() {
    setState(() {
        favoritesList.removeWhere((dish) => dish["title"] == widget.title);
      if (isFavorite) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${widget.title} removed from favorites!")),
        );
      } else {
        favoritesList.add({
          "title": widget.title,
          "description": widget.description,
          "reviews": widget.reviews,
          "stars": widget.stars,
          "prep": widget.prep,
          "cook": widget.cook,
          "feeds": widget.feeds,
          "imagePath": widget.imagePath,
          "price": widget.price,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${widget.title} added to favorites!")),
        );
      }
    });
  }
  


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// LEFT SIDE: Title, Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: toggleFavorite,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            /// RIGHT SIDE: Image + Button
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.imagePath,
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: widget.onOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  ),
                  child: const Text(
                    "Order Now",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

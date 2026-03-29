import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  final List<Map<String, dynamic>> _dummyOrders = const [
    {
      "orderId": "#ORD-1002",
      "date": "Oct 24, 2023",
      "status": "Delivered",
      "total": "\$45.00",
      "items": "2x Spicy Penne Pasta, 1x Garlic Bread",
      "image": "assets/images/pasta.png", // Assume an image exists or fallback to icon
    },
    {
      "orderId": "#ORD-0951",
      "date": "Oct 15, 2023",
      "status": "Delivered",
      "total": "\$32.50",
      "items": "1x Margarita Pizza, 2x Cola",
      "image": "assets/images/pizza.png", 
    },
    {
      "orderId": "#ORD-0812",
      "date": "Sep 28, 2023",
      "status": "Cancelled",
      "total": "\$18.00",
      "items": "1x Caesar Salad",
      "image": "assets/images/salad.png", 
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History"),
        backgroundColor: Colors.orange[400],
        elevation: 0,
      ),
      body: _dummyOrders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history_toggle_off, size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text("No previous orders", style: TextStyle(color: Colors.grey[600], fontSize: 18)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _dummyOrders.length,
              itemBuilder: (context, index) {
                final order = _dummyOrders[index];
                final isDelivered = order["status"] == "Delivered";

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              order["orderId"],
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: isDelivered ? Colors.green[100] : Colors.red[100],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                order["status"],
                                style: TextStyle(
                                  color: isDelivered ? Colors.green[800] : Colors.red[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(order["date"], style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                        const Divider(height: 24),
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.orange[50],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(Icons.restaurant, color: Colors.orange[800]), // Fallback icon instead of image to prevent missing asset errors here
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                order["items"],
                                style: const TextStyle(fontSize: 14),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Total:", style: TextStyle(fontSize: 16, color: Colors.grey)),
                            Text(
                              order["total"],
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              // Action to reorder
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.orange[400]!),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text("Reorder", style: TextStyle(color: Colors.orange[800])),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

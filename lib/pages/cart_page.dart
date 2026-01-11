
// import 'package:flutter/material.dart';
// import '../utils/global_data.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   double get totalPrice {
//     double total = 0;
//     for (var item in cartList) {
//       total +=
//           double.parse(item["price"].replaceAll("\$", "")) * item["quantity"];
//     }
//     return total;
//   }

//   void increaseQuantity(int index) {
//     setState(() {
//       cartList[index]["quantity"]++;
//     });
//   }

//   void decreaseQuantity(int index) {
//     setState(() {
//       if (cartList[index]["quantity"] > 1) {
//         cartList[index]["quantity"]--;
//       } else {
//         cartList.removeAt(index);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       appBar: AppBar(
//         title: const Text("Your Cart"),
//         backgroundColor: Colors.orange[400],
//         elevation: 0,
//       ),
//       body: cartList.isEmpty
//           ? const Center(
//               child:
//                   Text("Your cart is empty!", style: TextStyle(fontSize: 18)))
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: cartList.length,
//                     itemBuilder: (context, index) {
//                       final item = cartList[index];
//                       return Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16)),
//                         elevation: 4,
//                         margin: const EdgeInsets.only(bottom: 16),
//                         child: ListTile(
//                           leading: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.asset(item["imagePath"],
//                                 width: 50, height: 50, fit: BoxFit.cover),
//                           ),
//                           title: Text(item["title"]),
//                           subtitle: Text(item["price"]),
//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                   onPressed: () => decreaseQuantity(index),
//                                   icon:
//                                       const Icon(Icons.remove_circle_outline)),
//                               Text("${item["quantity"]}"),
//                               IconButton(
//                                   onPressed: () => increaseQuantity(index),
//                                   icon: const Icon(Icons.add_circle_outline)),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: const BoxDecoration(
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 6,
//                             offset: Offset(0, -2))
//                       ]),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text("Total",
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold)),
//                           Text("\$$totalPrice",
//                               style: const TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       ElevatedButton(
//                         onPressed: () {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text("Proceeding to Checkout...")),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.orange,
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                           minimumSize: const Size(double.infinity, 50),
//                         ),
//                         child: const Text("Checkout", style: TextStyle(color: Colors.white, fontSize: 16)),
//                       ),
                      
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../utils/global_data.dart';
import 'checkout_success.dart'; // ✅ Import the new success page

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalPrice {
    double total = 0;
    for (var item in cartList) {
      total += double.parse(item["price"].replaceAll("\$", "")) * item["quantity"];
    }
    return total;
  }

  void increaseQuantity(int index) {
    setState(() {
      cartList[index]["quantity"]++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartList[index]["quantity"] > 1) {
        cartList[index]["quantity"]--;
      } else {
        cartList.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        backgroundColor: Colors.orange[400],
        elevation: 0,
      ),
      body: cartList.isEmpty
          ? const Center(
              child: Text("Your cart is empty!", style: TextStyle(fontSize: 18)))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      final item = cartList[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 4,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(item["imagePath"],
                                width: 50, height: 50, fit: BoxFit.cover),
                          ),
                          title: Text(item["title"]),
                          subtitle: Text(item["price"]),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () => decreaseQuantity(index),
                                  icon: const Icon(Icons.remove_circle_outline)),
                              Text("${item["quantity"]}"),
                              IconButton(
                                  onPressed: () => increaseQuantity(index),
                                  icon: const Icon(Icons.add_circle_outline)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, -2))
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("\$$totalPrice",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CheckoutSuccessPage()), // ✅ Navigate to success page
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text("Checkout",
                            style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

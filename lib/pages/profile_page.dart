import 'package:flutter/material.dart';
import 'package:pennepasta_app/pages/edit_profile_page.dart';
import 'package:pennepasta_app/pages/order_history_page.dart';
import 'package:pennepasta_app/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.orange[400],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/profile.jpg"), // replace with user image
            ),
            const SizedBox(height: 12),
            const Text("Palwasha", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("Palwasha@gmail.com", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Edit Profile"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("Order History"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderHistoryPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    
      );
    
  }
}

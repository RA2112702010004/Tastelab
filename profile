import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'signup.dart'; // IMPORTANT: Now importing signup.dart instead of login.dart

class ProfileScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

   ProfileScreen({super.key}); // Firebase instance

  void _signOut(BuildContext context) async {
    await _auth.signOut();
    Get.offAll(() => SignUpScreen()); // Navigate to SignUpScreen and clear history
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Picture with Edit Button
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.orangeAccent,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage('android/app/src/main/assets/mprofile.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orangeAccent,
                      ),
                      child: const Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Profile Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: Colors.grey[800],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 2,
                child: Column(
                  children: const [
                    ProfileInfo(title: "Name", value: "user", icon: Icons.person),
                    Divider(color: Colors.grey),
                    ProfileInfo(title: "Email", value: "hellochef@gmail.com", icon: Icons.email),
                    Divider(color: Colors.grey),
                    ProfileInfo(title: "Phone", value: "+91 9865248875", icon: Icons.phone),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Sign Out Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () => _signOut(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Profile Info Widget
class ProfileInfo extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const ProfileInfo({super.key, required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.orangeAccent, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

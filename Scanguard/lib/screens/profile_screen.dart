import 'package:flutter/material.dart';
import 'package:scanguard/constants/colors.dart';
import 'package:scanguard/screens/history_screen.dart';
import 'package:scanguard/screens/placeholder_screen.dart';
import 'package:scanguard/screens/splash_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 60, color: AppColors.primary),
            ),
            const SizedBox(height: 16),
            const Text(
              'Alex Johnson',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            const Text('alex.j@example.com', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 40),
            _buildMenuItem(context, Icons.history, 'Order History', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryScreen()));
            }),
            _buildMenuItem(context, Icons.favorite_border, 'Favorites', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen(title: 'Favorites')));
            }),
            _buildMenuItem(context, Icons.settings_outlined, 'Preferences', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen(title: 'Preferences')));
            }),
            _buildMenuItem(context, Icons.language, 'Language', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen(title: 'Language')));
            }),
            _buildMenuItem(context, Icons.notifications_none, 'Notifications', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen(title: 'Notifications')));
            }),
            _buildMenuItem(context, Icons.palette_outlined, 'Theme', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen(title: 'Theme')));
            }),
            _buildMenuItem(context, Icons.lock_outline, 'Security Preferences', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen(title: 'Security Preferences')));
            }),
            _buildMenuItem(context, Icons.info_outline, "What's New", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen(title: "What's New")));
            }),
            const SizedBox(height: 24),
            _buildMenuItem(context, Icons.logout, 'Logout', () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SplashScreen()),
                (route) => false,
              );
            }, isDestructive: true),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(icon, color: isDestructive ? Colors.red : AppColors.primary),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isDestructive ? Colors.red : AppColors.primary,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, size: 20),
        onTap: onTap,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scanguard/constants/colors.dart';
import 'package:scanguard/widgets/custom_button.dart';
import 'package:scanguard/screens/main_screen.dart';

class ShopDetailsScreen extends StatelessWidget {
  final String name;

  const ShopDetailsScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                'https://picsum.photos/800/600', // Reliable placeholder
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 350,
                  color: AppColors.primary,
                  child: const Icon(Icons.store, color: Colors.white, size: 100),
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back, color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              transform: Matrix4.translationValues(0, -30, 0),
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: 18),
                      SizedBox(width: 4),
                      Text(
                        '24th Avenue, City Center, Block 04',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'About the store',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Grace Supermart offers a wide range of organic groceries, fresh vegetables, and premium dairy products. Enjoy a seamless smart-checkout experience.',
                    style: TextStyle(color: Colors.black54, fontSize: 15, height: 1.5),
                  ),
                  const Spacer(),
                  CustomButton(
                    label: 'Start Shopping',
                    onPressed: () {
                       Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MainScreen(initialIndex: 2)),
                        (route) => false,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

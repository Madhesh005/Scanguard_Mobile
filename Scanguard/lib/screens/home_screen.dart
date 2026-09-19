import 'package:flutter/material.dart';
import 'package:scanguard/constants/colors.dart';
import 'package:scanguard/screens/shop_details_screen.dart';
import 'package:scanguard/widgets/store_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi, Alex!', style: TextStyle(fontSize: 16, color: Colors.grey)),
                        Text(
                          'Good Morning',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person_outline, color: AppColors.primary),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(color: AppColors.cardShadow, blurRadius: 10, offset: Offset(0, 4)),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for shops...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Recently visited',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 240, // Increased height to accommodate constrained width cards
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    StoreCard(
                      name: 'Grace Supermart',
                      location: '24th Avenue, City Center',
                      imageUrl: 'https://images.unsplash.com/photo-1578916171728-46686eac8d58?w=500',
                      onTap: () => _navigateToShop(context, 'Grace Supermart'),
                    ),
                    StoreCard(
                      name: 'Ram Groceries',
                      location: 'North Square, Lane 05',
                      imageUrl: 'https://picsum.photos/400/200', // Test fallback
                      onTap: () => _navigateToShop(context, 'Ram Groceries'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Fastest near you',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              _buildNearByStore(context, 'City Fresh Mart', '1.2 km away', 'https://images.unsplash.com/photo-1604719312563-8912e9223c6a?w=500'),
              const SizedBox(height: 16),
              _buildNearByStore(context, 'Easy Shop Grocery', '0.5 km away', 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=500'),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToShop(BuildContext context, String name) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ShopDetailsScreen(name: name)));
  }

  Widget _buildNearByStore(BuildContext context, String name, String distance, String imgUrl) {
    return GestureDetector(
      onTap: () => _navigateToShop(context, name),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: AppColors.cardShadow, blurRadius: 10, offset: Offset(0, 4)),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imgUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.network(
                  'https://picsum.photos/400/200',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), overflow: TextOverflow.ellipsis),
                  Text(distance, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

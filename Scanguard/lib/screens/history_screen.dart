import 'package:flutter/material.dart';
import 'package:scanguard/constants/colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order History')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildHistoryItem('12 March, 2024', '\$15.12', 'Grace Supermart'),
          _buildHistoryItem('05 March, 2024', '\$42.50', 'Ram Groceries'),
          _buildHistoryItem('28 February, 2024', '\$10.00', 'City Fresh Mart'),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String date, String amount, String store) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: AppColors.cardShadow, blurRadius: 10, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(store, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(amount, style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.primary, fontSize: 18)),
            ],
          ),
          const SizedBox(height: 8),
          Text(date, style: const TextStyle(color: Colors.grey)),
          const Divider(height: 32),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Buy it again'),
            ),
          ),
        ],
      ),
    );
  }
}

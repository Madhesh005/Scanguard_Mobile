import 'package:flutter/material.dart';
import 'package:scanguard/constants/colors.dart';
import 'package:scanguard/screens/bill_screen.dart';
import 'package:scanguard/widgets/cart_item_widget.dart';
import 'package:scanguard/widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  CartItemWidget(
                    name: 'Organic Apples',
                    price: 4.50,
                    quantity: 2,
                    imageUrl: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6bcd6?w=200',
                  ),
                  CartItemWidget(
                    name: 'Low Fat Milk',
                    price: 2.30,
                    quantity: 1,
                    imageUrl: 'https://images.unsplash.com/photo-1550583724-1255818c053b?w=200',
                  ),
                  CartItemWidget(
                    name: 'Whole Grain Bread',
                    price: 3.10,
                    quantity: 1,
                    imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=200',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: AppColors.cardShadow, blurRadius: 15, offset: Offset(0, 5)),
                ],
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal', style: TextStyle(color: Colors.grey)),
                      Text('\$14.40', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax (GST 5%)', style: TextStyle(color: Colors.grey)),
                      Text('\$0.72', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Divider(height: 24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(
                        '\$15.12',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    label: 'Generate Bill',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BillScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add_shopping_cart, color: Colors.white),
      ),
    );
  }
}

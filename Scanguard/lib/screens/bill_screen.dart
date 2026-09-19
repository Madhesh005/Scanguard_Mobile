import 'package:flutter/material.dart';
import 'package:scanguard/constants/colors.dart';
import 'package:scanguard/screens/payment_mode_screen.dart';
import 'package:scanguard/widgets/custom_button.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                   const Text(
                    'RAM GROCERIES',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                      color: AppColors.primary,
                    ),
                  ),
                  const Text(
                    'North Square, Lane 05',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  _buildHeaderRow(),
                  const Divider(height: 32),
                  _buildItemRow('Organic Apples', '2', '\$9.00'),
                  _buildItemRow('Low Fat Milk', '1', '\$2.30'),
                  _buildItemRow('Whole Grain Bread', '1', '\$3.10'),
                  const Divider(height: 32),
                  _buildTotalRow('Subtotal', '\$14.40'),
                  _buildTotalRow('GST (5%)', '\$0.72'),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TOTAL AMOUNT',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$15.12',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Thank you for shopping!',
                    style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            CustomButton(
              label: 'Tap to Pay',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentModeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return const Row(
      children: [
        Expanded(flex: 3, child: Text('ITEM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
        Expanded(child: Text('QTY', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
        Expanded(child: Text('PRICE', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
      ],
    );
  }

  Widget _buildItemRow(String name, String qty, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(name, style: const TextStyle(fontSize: 14))),
          Expanded(child: Text(qty, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14))),
          Expanded(child: Text(price, textAlign: TextAlign.right, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

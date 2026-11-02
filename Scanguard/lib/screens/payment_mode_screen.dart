import 'package:flutter/material.dart';
import 'package:scanguard/constants/colors.dart';
import 'package:scanguard/screens/payment_success_screen.dart';
import 'package:scanguard/widgets/custom_button.dart';

class PaymentModeScreen extends StatefulWidget {
  const PaymentModeScreen({super.key});

  @override
  State<PaymentModeScreen> createState() => _PaymentModeScreenState();
}

class _PaymentModeScreenState extends State<PaymentModeScreen> {
  String _selectedMode = 'UPI';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Payment Mode')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildPaymentOption('Cash in Checkout', Icons.money),
                  _buildPaymentOption('UPI', Icons.account_balance),
                  _buildPaymentOption('Paytm', Icons.account_balance_wallet_outlined),
                  _buildPaymentOption('Other UPI Apps', Icons.apps),
                  _buildPaymentOption('Add Credit / Debit Card', Icons.credit_card),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: 'Pay Now',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentSuccessScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, IconData icon) {
    bool isSelected = _selectedMode == title;
    return GestureDetector(
      onTap: () => setState(() => _selectedMode = title),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: isSelected ? Border.all(color: AppColors.primary, width: 2) : null,
          boxShadow: const [
            BoxShadow(color: AppColors.cardShadow, blurRadius: 10, offset: Offset(0, 4)),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Radio<String>(
              value: title,
              groupValue: _selectedMode,
              onChanged: (value) {
                if (value != null) setState(() => _selectedMode = value);
              },
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

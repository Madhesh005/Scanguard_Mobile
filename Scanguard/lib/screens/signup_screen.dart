import 'package:flutter/material.dart';
import 'package:scanguard/constants/colors.dart';
import 'package:scanguard/screens/main_screen.dart';
import 'package:scanguard/widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Join Scanguard',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primary),
              ),
              const SizedBox(height: 8),
              const Text('Start your smart shopping journey today.', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 40),
              _buildTextField('Full Name', _nameController, Icons.person_outline),
              const SizedBox(height: 16),
              _buildTextField('Email Address', _emailController, Icons.email_outlined),
              const SizedBox(height: 16),
              _buildTextField('Password', _passwordController, Icons.lock_outline, isPassword: true),
              const SizedBox(height: 16),
              _buildTextField('Confirm Password', _confirmPasswordController, Icons.lock_reset, isPassword: true),
              const SizedBox(height: 40),
              CustomButton(
                label: 'Create Account',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const MainScreen()),
                      (route) => false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon, {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primary),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter $label';
        return null;
      },
    );
  }
}

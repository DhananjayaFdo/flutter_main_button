import 'package:flutter/material.dart';
import 'package:flutter_main_button/flutter_main_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MainButton Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainButtonExample(),
    );
  }
}

class MainButtonExample extends StatefulWidget {
  const MainButtonExample({super.key});

  @override
  State<MainButtonExample> createState() => _MainButtonExampleState();
}

class _MainButtonExampleState extends State<MainButtonExample> {
  bool isLoading1 = false;
  bool isLoading2 = false;
  String? result;

  Future<void> _simulateAsync(int buttonNumber) async {
    setState(() {
      if (buttonNumber == 1) {
        isLoading1 = true;
      } else {
        isLoading2 = true;
      }
      result = null;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        if (buttonNumber == 1) {
          isLoading1 = false;
        } else {
          isLoading2 = false;
        }
        result = 'Button $buttonNumber completed!';
      });
    }
  }

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Action'),
        content: const Text('Are you sure you want to proceed?'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MainButton.dual(
              height: 45,
              text: "Cancel",
              backgroundColor: Colors.grey.shade200,
              textColor: Colors.black87,
              onPressed: () => Navigator.pop(context, false),
              secondText: "Confirm",
              secondBackgroundColor: Colors.red,
              secondOnPressed: () {
                Navigator.pop(context, true);
                setState(() => result = 'Action confirmed!');
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainButton Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (result != null) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade300),
                ),
                child: Text(
                  result!,
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
            ],

            _buildSectionTitle('Basic Button'),
            MainButton(
              text: "Basic Button",
              onPressed: () => setState(() => result = 'Basic button pressed'),
            ),
            const SizedBox(height: 30),

            _buildSectionTitle('Loading State'),
            MainButton(
              text: "Click to Load",
              isLoading: isLoading1,
              onPressed: isLoading1 ? null : () => _simulateAsync(1),
            ),
            const SizedBox(height: 30),

            _buildSectionTitle('With Icons'),
            MainButton(
              text: "Download",
              prefixIcon: Icons.download,
              onPressed: () => setState(() => result = 'Download started'),
            ),
            const SizedBox(height: 12),
            MainButton(
              text: "Next",
              suffixIcon: Icons.arrow_forward,
              backgroundColor: Colors.green,
              onPressed: () => setState(() => result = 'Moving to next page'),
            ),
            const SizedBox(height: 30),

            _buildSectionTitle('Custom Styling'),
            MainButton(
              text: "Custom Button",
              backgroundColor: Colors.purple,
              borderRadius: BorderRadius.circular(30),
              height: 55,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              onPressed: () => setState(() => result = 'Custom button pressed'),
            ),
            const SizedBox(height: 12),
            MainButton(
              text: "Outlined Button",
              backgroundColor: Colors.transparent,
              textColor: Colors.blue,
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10),
              onPressed: () => setState(() => result = 'Outlined button pressed'),
            ),
            const SizedBox(height: 30),

            _buildSectionTitle('Disabled Button'),
            MainButton(
              text: "Disabled Button",
              onPressed: null,
            ),
            const SizedBox(height: 12),
            MainButton(
              text: "Explicitly Disabled",
              isDisabled: true,
              onPressed: () {}, // Won't be called
            ),
            const SizedBox(height: 30),

            _buildSectionTitle('Dual Button Layout'),
            MainButton.dual(
              text: "Cancel",
              backgroundColor: Colors.grey.shade300,
              textColor: Colors.black87,
              onPressed: () => setState(() => result = 'Cancelled'),
              secondText: "Confirm",
              secondBackgroundColor: Colors.blue,
              secondOnPressed: () => setState(() => result = 'Confirmed'),
            ),
            const SizedBox(height: 12),
            MainButton.dual(
              text: "Previous",
              prefixIcon: Icons.arrow_back,
              backgroundColor: Colors.grey,
              onPressed: () => setState(() => result = 'Previous page'),
              secondText: "Next",
              secondSuffixIcon: Icons.arrow_forward,
              secondOnPressed: () => setState(() => result = 'Next page'),
            ),
            const SizedBox(height: 30),

            _buildSectionTitle('Dual with Loading'),
            MainButton.dual(
              text: "Load 1",
              isLoading: isLoading1,
              onPressed: isLoading1 ? null : () => _simulateAsync(1),
              secondText: "Load 2",
              secondIsLoading: isLoading2,
              secondOnPressed: isLoading2 ? null : () => _simulateAsync(2),
            ),
            const SizedBox(height: 30),

            _buildSectionTitle('Dialog Example'),
            MainButton(
              text: "Show Confirm Dialog",
              prefixIcon: Icons.info_outline,
              backgroundColor: Colors.orange,
              onPressed: _showConfirmDialog,
            ),
            const SizedBox(height: 30),

            _buildSectionTitle('Social Login Style'),
            MainButton(
              text: "Continue with Google",
              prefixIcon: Icons.login,
              backgroundColor: Colors.white,
              textColor: Colors.black87,
              iconColor: Colors.red,
              border: Border.all(color: Colors.grey.shade300),
              onPressed: () => setState(() => result = 'Google login initiated'),
            ),
            const SizedBox(height: 12),
            MainButton(
              text: "Continue with Apple",
              prefixIcon: Icons.apple,
              backgroundColor: Colors.black,
              onPressed: () => setState(() => result = 'Apple login initiated'),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}

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
            _buildSectionTitle('1. Basic Button'),
            MainButton(
              text: "Basic Button",
              onPressed: () => setState(() => result = 'Basic button pressed'),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('2. Loading State'),
            MainButton(
              text: "Click to Load",
              isLoading: isLoading1,
              onPressed: isLoading1 ? null : () => _simulateAsync(1),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('3. With Icons'),
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
            _buildSectionTitle('4. With Custom Widgets (NEW!)'),
            MainButton(
              text: "Premium",
              prefix: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.star, size: 16, color: Colors.white),
              ),
              backgroundColor: Colors.purple,
              onPressed: () => setState(() => result = 'Premium feature'),
            ),
            const SizedBox(height: 12),
            MainButton(
              text: "50% OFF",
              suffix: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'HOT',
                  style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: Colors.orange,
              onPressed: () => setState(() => result = 'Special offer'),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('5. With Gradient (NEW!)'),
            MainButton(
              text: "Gradient Button",
              gradient: const LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onPressed: () => setState(() => result = 'Gradient button pressed'),
            ),
            const SizedBox(height: 12),
            MainButton(
              text: "Radial Gradient",
              gradient: const RadialGradient(
                colors: [Colors.pink, Colors.deepPurple],
                center: Alignment.center,
                radius: 1.5,
              ),
              onPressed: () => setState(() => result = 'Radial gradient pressed'),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('6. With Shadow (NEW!)'),
            MainButton(
              text: "Elevated Button",
              backgroundColor: Colors.white,
              textColor: Colors.black87,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              onPressed: () => setState(() => result = 'Elevated button pressed'),
            ),
            const SizedBox(height: 12),
            MainButton(
              text: "Colored Shadow",
              backgroundColor: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
              onPressed: () => setState(() => result = 'Colored shadow pressed'),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('7. Circular Button (NEW!)'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainButton(
                  prefixIcon: Icons.add,
                  shape: BoxShape.circle,
                  height: 60,
                  width: 60,
                  backgroundColor: Colors.blue,
                  iconSpacing: 0,
                  onPressed: () => setState(() => result = 'Add pressed'),
                ),
                MainButton(
                  prefixIcon: Icons.favorite,
                  height: 60,
                  width: 60,
                  iconSpacing: 0,
                  backgroundColor: Colors.red,
                  onPressed: () => setState(() => result = 'Favorite pressed'),
                ),
                MainButton(
                  prefixIcon: Icons.share,
                  height: 60,
                  width: 60,
                  iconSpacing: 0,
                  backgroundColor: Colors.green,
                  onPressed: () => setState(() => result = 'Share pressed'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('8. Custom Child Widget (NEW!)'),
            MainButton(
              height: 70,
              backgroundColor: Colors.indigo,
              onPressed: () => setState(() => result = 'Profile viewed'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.blue),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'John Doe',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'View Profile',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('9. Custom Styling'),
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
            _buildSectionTitle('10. Disabled Button'),
            const MainButton(
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
            _buildSectionTitle('11. Dual Button Layout'),
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
            _buildSectionTitle('12. Dual with Gradients (NEW!)'),
            MainButton.dual(
              text: "Cancel",
              gradient: LinearGradient(
                colors: [Colors.grey.shade400, Colors.grey.shade600],
              ),
              onPressed: () => setState(() => result = 'Cancelled'),
              secondText: "Upgrade",
              secondGradient: const LinearGradient(
                colors: [Colors.purple, Colors.pink],
              ),
              secondPrefix: const Icon(Icons.star, size: 20, color: Colors.white),
              secondOnPressed: () => setState(() => result = 'Upgraded'),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('13. Dual with Shadows (NEW!)'),
            MainButton.dual(
              text: "Maybe",
              backgroundColor: Colors.white,
              textColor: Colors.black87,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
              onPressed: () => setState(() => result = 'Maybe selected'),
              secondText: "Yes!",
              secondBackgroundColor: Colors.green,
              secondBoxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
              secondOnPressed: () => setState(() => result = 'Yes selected'),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('14. Dual with Custom Widgets (NEW!)'),
            MainButton.dual(
              text: "Free",
              prefix: const Icon(Icons.check, size: 16, color: Colors.white),
              backgroundColor: Colors.grey,
              onPressed: () => setState(() => result = 'Free selected'),
              secondText: "Premium",
              secondPrefix: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.star, size: 12, color: Colors.white),
              ),
              secondBackgroundColor: Colors.deepPurple,
              secondOnPressed: () => setState(() => result = 'Premium selected'),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('15. Dual with Loading'),
            MainButton.dual(
              text: "Load 1",
              isLoading: isLoading1,
              onPressed: isLoading1 ? null : () => _simulateAsync(1),
              secondText: "Load 2",
              secondIsLoading: isLoading2,
              secondOnPressed: isLoading2 ? null : () => _simulateAsync(2),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('16. Premium Upgrade Button (NEW!)'),
            MainButton(
              height: 80,
              gradient: LinearGradient(
                colors: [Colors.purple.shade400, Colors.deepPurple.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.workspace_premium, color: Colors.amber, size: 32),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Upgrade to Premium',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Unlock all features',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              onPressed: () => setState(() => result = 'Upgrade initiated'),
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('17. Dialog Example'),
            MainButton(
              text: "Show Confirm Dialog",
              prefixIcon: Icons.info_outline,
              backgroundColor: Colors.orange,
              onPressed: _showConfirmDialog,
            ),
            const SizedBox(height: 30),
            _buildSectionTitle('18. Social Login Style'),
            MainButton(
              text: "Continue with Google",
              prefixIcon: Icons.login,
              backgroundColor: Colors.white,
              textColor: Colors.black87,
              iconColor: Colors.red,
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
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
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}

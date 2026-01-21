import 'package:flutter/material.dart';
import 'package:zomatoo/home_screen.dart';
import 'package:zomatoo/main_bottom_nav_screen.dart';

class EnableNotificationPage extends StatelessWidget {
  const EnableNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              /// 🔔 Top Text
              const Text(
                "Enable notifications to get\n"
                "updates\n"
                "about offers, order status and\n"
                "more",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 120),

              /// 🔔 Bell Image
              Center(
                child: Image.asset(
                  'assets/icons/notification.png',
                  height: 160,
                ),
              ),

              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainBottomNavScreen(),
                      ),
                      (route) => false, // clears onboarding stack
                    );
                  },
                  child: const Text(
                    "Enable notifications",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainBottomNavScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Not now",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

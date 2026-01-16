import 'package:flutter/material.dart';
import 'package:zomatoo/dining_screen.dart';
import 'package:zomatoo/home_screen.dart';
import 'package:zomatoo/under_250_screen.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _currentIndex = 0;

  // ✅ Controller belongs here
  late final WebViewController _blinkitController;

  final List<Widget> _screens = const [
    HomeScreen(),
    Under250Screen(),
    DiningScreen(),
  ];

  @override
  void initState() {
    super.initState();

    _blinkitController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://blinkit.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return SafeArea(
      top: false,
      child: Container(
        height: 64,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black12)),
        ),
        child: Row(
          children: [
            Expanded(child: _item(Icons.delivery_dining, "Delivery", 0)),
            Expanded(child: _item(Icons.local_offer, "Under ₹250", 1)),
            Expanded(child: _item(Icons.room_service, "Dining", 2)),
            _blinkitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _item(IconData icon, String label, int index) {
    final isActive = _currentIndex == index;

    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        children: [
          Container(
            height: 3,
            color: isActive ? const Color(0xFFE23744) : Colors.transparent,
          ),
          const Spacer(),
          Icon(icon, color: isActive ? const Color(0xFFE23744) : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isActive ? const Color(0xFFE23744) : Colors.grey,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _blinkitButton(BuildContext context) {
    return InkWell(
      onTap: () => _openBlinkitModal(context),
      child: ClipRect(
        child: Align(
          alignment: Alignment.centerLeft,
          widthFactor: 0.92,
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF9CF3A),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "blinkit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 6),
                Transform.rotate(
                  angle: -math.pi / 4,
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: Color(0xFF0C831F),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openBlinkitModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: FractionallySizedBox(
            heightFactor: 0.8,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    height: 4,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Expanded(
                    child: WebViewWidget(
                      controller: _blinkitController,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

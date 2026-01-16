import 'package:flutter/material.dart';

class RecommendedMenuInfoSection extends StatelessWidget {
  const RecommendedMenuInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                colors: [Color(0xFFDFF5EA), Color(0xFFE8FAF4)],
              ),
            ),
            child: Row(
              children: [
                // 🔹 Text Section
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Delivering for",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Big text + arrow inline
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "people and planet",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E7D32),
                            ),
                          ),
                          const SizedBox(width: 8),

                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2E7D32),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 🔹 Illustration (bigger, no extra space)
                Image.asset(
                  "assets/gif/Packagedelivery.gif",
                  height: 130,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 Bullet points
          _bullet(
            "Menu items, nutritional information and prices are set directly by the restaurant.",
          ),
          _bullet(
            "Nutritional information values displayed are indicative, per serving and may vary depending on the ingredients, portion size and customizations.",
          ),
          _bullet(
            "An average active adult requires 2,000 kcal energy per day, however calorie needs may vary.",
          ),

          const SizedBox(height: 16),

          // 🔹 Report issue
          const Text(
            "Report an issue with the menu ›",
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 30),

          // 🔹 FSSAI
          Text(
            "fssai\nLic. No. 23324011003489",
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 18)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

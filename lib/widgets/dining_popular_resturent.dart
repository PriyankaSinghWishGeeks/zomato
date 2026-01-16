import 'package:flutter/material.dart';

import 'dininf_featured_resturent_cart.dart';
import 'home_filter_bar.dart';

class DiningPopularRestaurants extends StatelessWidget {
  const DiningPopularRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 POPULAR RESTAURANTS AROUND YOU
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: const [
              Text(
                'POPULAR RESTAURANTS AROUND',
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 2,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'YOU',
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 2,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        // 🔹 Filters
        const HomeFilterBar(),

        // 🔹 FEATURED title
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'FEATURED',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 2,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        Column(
          children: List.generate(
            10,
            (index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: FeaturedRestaurantCard(),
            ),
          ),
        ),

        // for overlap
      ],
    );
  }
}

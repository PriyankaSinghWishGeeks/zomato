import 'package:flutter/material.dart';

class DiningExploreCart extends StatefulWidget {
  const DiningExploreCart({super.key});

  @override
  State<DiningExploreCart> createState() => _DiningExploreCartState();
}

class _DiningExploreCartState extends State<DiningExploreCart> {
  final int _currentIndex = 0;

  final List<String> images = [
    'assets/images/resturent1.jpg',
    'assets/images/resturent2.jpg',
    'assets/images/resturent3.jpg',
    'assets/images/resturent4.jpg',
    'assets/images/resturent5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 Heading
        Row(
          children: [
            Expanded(child: Divider(thickness: 1, color: Colors.grey.shade300)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "EXPLORE",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(child: Divider(thickness: 1, color: Colors.grey.shade300)),
          ],
        ),

        const SizedBox(height: 14),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 1.6,
            children: const [
              ExploreCard(
                title: "Up to\n50% OFF",
                icon: Icons.percent,
                bgColor: Color(0xFFFFF1F3), // pink
                iconColor: Colors.pink,
              ),
              ExploreCard(
                title: "Near &\nTop Rated",
                icon: Icons.location_on,
                bgColor: Color(0xFFF1F7FF), // blue
                iconColor: Colors.blue,
              ),
              ExploreCard(
                title: "Premium\nPlaces",
                icon: Icons.star,
                bgColor: Color(0xFFFFF8E1), // yellow
                iconColor: Colors.orange,
              ),
              ExploreCard(
                title: "Newly\nOpened",
                icon: Icons.new_releases,
                bgColor: Color(0xFFF3FFF6), // green
                iconColor: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WhiteTag extends StatelessWidget {
  final String text;

  const _WhiteTag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class ExploreCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;

  const ExploreCard({
    super.key,
    required this.title,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // 🔹 Text
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),
          ),

          // 🔹 Icon bubble
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
        ],
      ),
    );
  }
}

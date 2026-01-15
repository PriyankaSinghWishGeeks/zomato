import 'package:flutter/material.dart';

class ExploreMoreSection extends StatelessWidget {
  const ExploreMoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔤 TITLE
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "EXPLORE MORE",
              style: TextStyle(
                fontSize: 13,
                letterSpacing: 1.4,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // ➡️ HORIZONTAL SCROLL
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _exploreItems.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                final item = _exploreItems[index];
                return _ExploreCard(title: item.title, image: item.image);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ExploreCard extends StatelessWidget {
  final String title;
  final String image;

  const _ExploreCard({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        // 🌫 Zomato-like soft shadow
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 🖼 CENTER IMAGE
          Image.asset(image, height: 42, width: 42, fit: BoxFit.contain),

          const SizedBox(height: 10),

          // 🔤 TITLE
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _ExploreItem {
  final String title;
  final String image;
  _ExploreItem(this.title, this.image);
}

final List<_ExploreItem> _exploreItems = [
  _ExploreItem("Offers", "assets/icons/offer.png"),
  _ExploreItem("Top Rated", "assets/icons/train.png"),
  _ExploreItem("Fast Delivery", "assets/icons/offer.png"),
  _ExploreItem("New", "assets/icons/train.png"),
  _ExploreItem("Pure Veg", "assets/icons/train.png"),
  _ExploreItem("Trending", "assets/icons/offer.png"),
];

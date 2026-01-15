import 'package:flutter/material.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔤 TITLE
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "RECOMMENDED FOR YOU",
              style: TextStyle(
                fontSize: 13,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // 🧱 2-ROW HORIZONTAL GRID
          SizedBox(
            height: 380,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: const [
                      _RestaurantCard(),
                      SizedBox(height: 14),
                      _RestaurantCard(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _RestaurantCard extends StatelessWidget {
  const _RestaurantCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼 IMAGE + OVERLAYS
          Stack(
            clipBehavior: Clip.none, // 🔥 IMPORTANT
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  "assets/images/food_dummy.jpg",
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 8,
                left: 0,
                child: _OfferTag(text: "Buy 1 get 1 free"),
              ),

              Positioned(
                bottom: -6,
                left: 0,
                child: _RatingBadge(rating: "4.1"),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // 🍴 TITLE
          const Text(
            "Chinese Wok",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          // ⏱ PRICE / TIME
          Row(
            children: const [
              Icon(Icons.flash_on, size: 16, color: Colors.green),
              SizedBox(width: 4),
              Text(
                "20–25 mins",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OfferTag extends StatelessWidget {
  final String text;
  const _OfferTag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final String rating;
  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green,

        // 🔵 rounded corners
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),

        // 🤍 white border (top + right only)
        border: const Border(
          top: BorderSide(color: Colors.white, width: 2),
          right: BorderSide(color: Colors.white, width: 2),
        ),

        // 🌫 SHADOW — THIS IS WHERE IT GOES
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, size: 14, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            rating,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

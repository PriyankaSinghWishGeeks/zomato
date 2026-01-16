import 'package:flutter/material.dart';

class DiningFeatured extends StatelessWidget {
  const DiningFeatured({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(child: Divider(thickness: 1, color: Colors.grey.shade300)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "FEATURED IN DELHI NCR",
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

        const SizedBox(height: 12),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.20, // 20vh
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              return FeaturedCityCard(
                width:
                    MediaQuery.of(context).size.width *
                    0.78, // 🔑 1.3 cards effect
                bgColor: _bgColors[index],
                image: _images[index],
                location: _locations[index],
              );
            },
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}

class FeaturedCityCard extends StatelessWidget {
  final double width;
  final Color bgColor;
  final String image;
  final String location;

  const FeaturedCityCard({
    super.key,
    required this.width,
    required this.bgColor,
    required this.image,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          /// 🔹 IMAGE (30%)
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(18),
            ),
            child: Image.asset(
              image,
              width: width * 0.40,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// 🔹 CONTENT (70%)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// Offer
                  const Text(
                    "Up to 40% OFF",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    "Treat yourself to pure indulgence ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const Spacer(),

                  /// Explore More
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Explore More",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final _bgColors = [
  const Color(0xFF5A3A1A), // brown
  const Color(0xFF1E4FD8), // blue
  const Color(0xFF7B1E3A), // dark pink
];

final _images = [
  'assets/images/resturent1.jpg',
  'assets/images/resturent2.jpg',
  'assets/images/resturent3.jpg',
];

final _locations = [
  'Connaught Place, Delhi',
  'Cyber Hub, Gurugram',
  'Noida Sector 18',
];

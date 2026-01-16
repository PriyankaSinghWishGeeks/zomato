import 'package:flutter/material.dart';

class InTheMoodSection extends StatelessWidget {
  const InTheMoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),

        // 🔹 Title with HR
        Row(
          children: [
            Expanded(child: Divider(thickness: 1, color: Colors.grey.shade300)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "IN THE MOOD FOR",
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

        // 🔹 First Grid (2 rows, 3.5 columns visible)
        SizedBox(
          height: 260,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = constraints.maxWidth / 3.2;

              return GridView.builder(
                clipBehavior: Clip.none, // ⭐ VERY IMPORTANT
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: cardWidth / 110,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return _MoodCard(
                    title: moodTitles[index % moodTitles.length],
                    image: moodImages[index % moodImages.length],
                  );
                },
              );
            },
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}
class _MoodCard extends StatelessWidget {
  final String title;
  final String image;

  const _MoodCard({
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final parts = title.split(' ');

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 14,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    parts.first,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (parts.length > 1)
                    Text(
                      parts.sublist(1).join(' '),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),

            Positioned(
              bottom: -10,
              right: -10,
              child: SizedBox(
                height: 70,
                width: 70,
                child: Image.asset(image, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


final List<String> moodTitles = [
  "Family dining",
  "Drink & dine",
  "Premium dining",
  "Romantic",
  "Rooftops",
  "Buffet",
];

final List<String> moodImages = [
  "assets/images/mood2.png",
  "assets/images/mood2.png",
  "assets/images/mood2.png",
  "assets/images/mood2.png",
  "assets/images/mood2.png",
  "assets/images/mood2.png",
];

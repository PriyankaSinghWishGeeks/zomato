import 'package:flutter/material.dart';

class InTheLimeLight extends StatefulWidget {
  const InTheLimeLight({super.key});

  @override
  State<InTheLimeLight> createState() => _InTheLimeLightState();
}

class _InTheLimeLightState extends State<InTheLimeLight> {
  int _currentIndex = 0;

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
                "IN THE LIMELIGHT",
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

        // 🔹 Slider Card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
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
                  // 🖼 Image Slider
                  PageView.builder(
                    itemCount: images.length,
                    onPageChanged: (index) {
                      setState(() => _currentIndex = index);
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),

                  // 🔴 Top-left offer badge
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "FLAT 20% OFF",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),

                  // ⭐ Title (In the Limelight)
                  const Positioned(
                    top: 14,
                    right: 12,
                    child: Text(
                      "In the Limelight",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        shadows: [Shadow(color: Colors.black54, blurRadius: 6)],
                      ),
                    ),
                  ),

                  // ⚪ Bottom-left tags
                  Positioned(
                    bottom: 14,
                    left: 12,
                    child: Wrap(
                      spacing: 6,
                      children: const [
                        _WhiteTag(text: "Live Music"),
                        _WhiteTag(text: "Popular"),
                      ],
                    ),
                  ),

                  // ⚪ Dots indicator
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: Row(
                      children: List.generate(
                        images.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: _currentIndex == index ? 8 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? Colors.white
                                : Colors.white54,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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

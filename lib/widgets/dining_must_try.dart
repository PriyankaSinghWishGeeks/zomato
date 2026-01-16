import 'package:flutter/material.dart';
import 'dart:math' as math;

class MustTriesSection extends StatelessWidget {
  const MustTriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 Heading
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey.shade300)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "MUST-TRIES IN DELHI NCR",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(child: Divider(color: Colors.grey.shade300)),
          ],
        ),

        const SizedBox(height: 14),

        // 🔹 Horizontal cards
        SizedBox(
          height: 200,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = constraints.maxWidth / 2.2;

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: cardWidth,
                    child: MustTryCard(
                      image: 'assets/images/resturent1.jpg',
                      tag1: 'Insta-worthy',
                      tag2: 'spot',
                    ),
                  );
                },
              );
            },
          ),
        ),

        const SizedBox(height: 18),

        // 🔹 Explore more button
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xFFFFE5E5),
            side: const BorderSide(color: Colors.red),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward, color: Colors.red),
          label: const Text(
            "Explore more",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}

class MustTryCard extends StatelessWidget {
  final String image;
  final String tag1;
  final String tag2;

  const MustTryCard({
    super.key,
    required this.image,
    required this.tag1,
    required this.tag2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: ClipPath(
        clipper: TopHalfCircleClipper(rectHeightRatio: 0.8),
        child: Container(
          height: double.infinity, // <-- make it fill the available height
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(color: Colors.grey.shade400, width: 2),
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$tag1',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                              offset: Offset(1.5, 1.5),
                              blurRadius: 3,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '$tag2',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                              offset: Offset(1.5, 1.5),
                              blurRadius: 3,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopHalfCircleClipper extends CustomClipper<Path> {
  final double rectHeightRatio; // fraction of total height for rectangle

  TopHalfCircleClipper({
    this.rectHeightRatio = 0.75,
  }); // default: 75% rectangle, 25% semicircle

  @override
  Path getClip(Size size) {
    final path = Path();

    // Semicircle radius based on width
    double radius = size.width / 2;

    // Rectangle height is fraction of total height
    double rectHeight = size.height * rectHeightRatio;

    // Start bottom-left
    path.moveTo(0, size.height);

    // Line up to top-left of rectangle
    path.lineTo(0, rectHeight);

    // Draw smooth semicircle on top using quadraticBezierTo
    path.quadraticBezierTo(
      size.width / 2, // control point X (center)
      rectHeight - radius, // control point Y (above rectangle)
      size.width, // end point X (top-right)
      rectHeight, // end point Y (top-right of rectangle)
    );

    // Line down right side
    path.lineTo(size.width, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

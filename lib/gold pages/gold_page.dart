import 'package:flutter/material.dart';

class ZomatoGoldPage extends StatelessWidget {
  const ZomatoGoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "zomato",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 30),

            /// GOLD gradient title
            Center(
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFFFD28C),
                      Color(0xFFB78628),
                    ],
                  ).createShader(bounds);
                },
                child: const Text(
                  "GOLD",
                  style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

            /// Special benefits white card
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Color(0xFFFFD28C), size: 30),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Special benefits & updates",
                          style: TextStyle(
                            color: Color(0xFFB78628),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Now enjoy free delivery on orders above ₹199",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ₹1 offer card
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 14),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFFFD28C)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      const Text(
                        "₹1  •  for 3 months",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),

                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFFFFFF), Color(0xFFFFD28C)],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "JOIN GOLD",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD28C),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "UNLIMITED FREE DELIVERY & MORE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// GOLD BENEFITS title
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, color: Color(0xFFFFD28C), size: 18),
                SizedBox(width: 6),
                Text(
                  "GOLD BENEFITS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(width: 6),
                Icon(Icons.star, color: Color(0xFFFFD28C), size: 18),
              ],
            ),

            const SizedBox(height: 16),

            /// Benefit cards
            goldBenefitCard(
              image: "assets/icons/gold_delivery.png",
              title: "Free Delivery",
              desc:
                  "Unlimited free delivery on eligible restaurants without any surge fee.",
            ),

            goldBenefitCard(
              image: "assets/icons/discount_cart.png",
              title: "Up to 30% Extra Off",
              desc:
                  "Exclusive Gold discounts on top restaurants for every order.",
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD28C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "JOIN GOLD",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: const [
                  Text(
                    "Have questions?",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Check FAQs • Zomato Gold Terms",
                    style: TextStyle(
                      color: Color(0xFFFFD28C),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

/// Benefit card widget
Widget goldBenefitCard({
  required String image,
  required String title,
  required String desc,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white24),
    ),
    child: Row(
      children: [
        Image.asset(image, height: 36),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(desc, style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ],
    ),
  );
}

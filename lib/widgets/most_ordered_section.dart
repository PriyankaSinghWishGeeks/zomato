import 'package:flutter/material.dart';

class MostOrderedSection extends StatefulWidget {
  const MostOrderedSection({super.key});

  @override
  State<MostOrderedSection> createState() => _MostOrderedSectionState();
}

class _MostOrderedSectionState extends State<MostOrderedSection> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          // 🔹 Accordion Header
          InkWell(
            onTap: () {
              setState(() {
                isOpen = !isOpen;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Most Ordered together",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),

          // 🔹 Horizontal Scrollable Cards
          if (isOpen)
            SizedBox(
              height: 260, // adjust height for card content
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return _buildMostOrderedCard();
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMostOrderedCard() {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Row 1: Two images + thick line + add icon
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/pizza.png',
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/food_dummy.jpg',
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    height: 4,
                    width: 40,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              const Positioned(
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add, size: 16, color: Colors.green),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // 🔹 Row 2: Veg/Non-veg + ordered by
          Row(
            children: [
              Icon(Icons.eco, size: 16, color: Colors.green), // veg icon
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.amber.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Ordered by 680+ customers",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // 🔹 Row 3: Item names
          const Text(
            "Sweet Corn Pizza + Aloo\nTikki Burger",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),

          // 🔹 Row 4: Price + See items button
          Row(
            children: [
              const Text(
                "₹225",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: const [
                    Text(
                      "See items",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.arrow_forward, size: 14, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zomatoo/models/menu_item.dart';
import 'package:zomatoo/widgets/add_to_cart.dart';

class RecommendedSectionList extends StatefulWidget {
  const RecommendedSectionList({super.key});

  @override
  State<RecommendedSectionList> createState() => _RecommendedSectionListState();
}

class _RecommendedSectionListState extends State<RecommendedSectionList> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 Header
        InkWell(
          onTap: () => setState(() => isOpen = !isOpen),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                const Text(
                  "Recommended for you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Icon(
                  isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 26,
                ),
              ],
            ),
          ),
        ),

        if (isOpen)
          Column(
            children: List.generate(5, (index) {
              final item = MenuItem(
                name: "Aloo Tikki",
                description:
                    "Aloo tikki [2 pieces] stuffed with dry fruits with dahi, green chutney and sonth...",
                image: "assets/images/pizza.png",
                price: 114,
              );

              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => AddToCartSheet(item: item),
                      );
                    },
                    child: const RecommendedItemCard(),
                  ),
                  if (index != 4)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(color: Colors.grey.shade300, height: 24),
                    ),
                ],
              );
            }),
          ),
      ],
    );
  }
}

class RecommendedItemCard extends StatelessWidget {
  const RecommendedItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 LEFT (60%)
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Veg icon
                const Icon(Icons.eco, color: Colors.green, size: 18),
                const SizedBox(height: 6),

                // Title
                const Text(
                  "Aloo Tikki",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 6),

                // Recommended bar
                Row(
                  children: [
                    Container(
                      height: 6,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Highly reordered",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Price
                const Text(
                  "₹114",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 6),

                // Description
                const Text(
                  "Aloo tikki [2 pieces] stuffed with dry fruits with dahi, green chutney and sonth...",
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),

                const SizedBox(height: 10),

                // Add + Share
                Row(
                  children: [
                    _iconButton(Icons.bookmark_border),
                    const SizedBox(width: 10),
                    _iconButton(Icons.share_outlined),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // 🔹 RIGHT (40%)
          Expanded(
            flex: 4,
            child: Column(
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/pizza.png",
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 8),

                // ADD button
                Container(
                  width: double.infinity,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red),
                  ),
                  child: const Center(
                    child: Text(
                      "ADD  +",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                // Customisable
                const Text(
                  "customisable",
                  style: TextStyle(fontSize: 11, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4),
        ],
        color: Colors.white,
      ),
      child: Icon(icon, size: 18),
    );
  }
}

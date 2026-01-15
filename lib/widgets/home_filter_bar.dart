import 'package:flutter/material.dart';

class HomeFilterBar extends StatefulWidget {
  const HomeFilterBar({super.key});

  @override
  State<HomeFilterBar> createState() => _HomeFilterBarState();
}

class _HomeFilterBarState extends State<HomeFilterBar> {
  int selectedIndex = 0;

  final filters = const [
    _FilterItem(label: "Filters", icon: Icons.tune),
    _FilterItem(label: "Near & Fast"),
    _FilterItem(label: "Rating 4.0+"),
    _FilterItem(label: "Pure Veg"),
    _FilterItem(label: "Offers"),
    _FilterItem(label: "New Arrivals"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44, // Zomato exact-ish height
      child: Align(
        alignment: Alignment.center,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: filters.length,
          itemBuilder: (context, index) {
            final item = filters[index];
            final isSelected = selectedIndex == index;

            return _FilterChip(
              label: item.label,
              icon: item.icon,
              isSelected: isSelected,
              onTap: () {
                setState(() => selectedIndex = index);
                debugPrint("Applied filter: ${item.label}");
              },
            );
          },
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Material(
        elevation: isSelected ? 1.2 : 0,
        shadowColor: Colors.black12,
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? Colors.black87 : Colors.grey.shade300,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 16, color: Colors.black87),
                  const SizedBox(width: 4),
                ],
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                if (label == "Filters") ...[
                  const SizedBox(width: 2),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 16,
                    color: Colors.black87,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterItem {
  final String label;
  final IconData? icon;

  const _FilterItem({required this.label, this.icon});
}

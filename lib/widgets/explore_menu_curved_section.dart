import 'package:flutter/material.dart';

class ExploreMenuCurvedSection extends StatefulWidget {
  const ExploreMenuCurvedSection({super.key});

  @override
  State<ExploreMenuCurvedSection> createState() =>
      _ExploreMenuCurvedSectionState();
}

class _ExploreMenuCurvedSectionState extends State<ExploreMenuCurvedSection> {
  int selectedIndex = 0;

  final items = List.generate(
    10,
    (index) => _MenuItemData(
      title: "Item ${index + 1}",
      image: "assets/images/mood2.png",
    ),
  );

  @override
  Widget build(BuildContext context) {
    final itemWidth = 80.0; // fixed width for each item
    final containerHeight = 140.0; // matches SliverPersistentHeader height

    return SizedBox(
      height: containerHeight,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return SizedBox(
            width: itemWidth,
            child: _BottomBorderMenuItem(
              item: item,
              isSelected: selectedIndex == index,
              onTap: () => setState(() => selectedIndex = index),
            ),
          );
        },
      ),
    );
  }
}

class _BottomBorderMenuItem extends StatelessWidget {
  final _MenuItemData item;
  final bool isSelected;
  final VoidCallback onTap;

  const _BottomBorderMenuItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Wrap image inside container with fixed size
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(14),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                item.image,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 6),

          // Label
          Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),

          const SizedBox(height: 8),

          // Bottom selection indicator
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 3,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromARGB(255, 230, 63, 12)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItemData {
  final String title;
  final String image;

  _MenuItemData({required this.title, required this.image});
}

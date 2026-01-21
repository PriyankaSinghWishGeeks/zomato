import 'package:flutter/material.dart';

import '../explore/explore_only_page.dart';

class Under250ExploreMenuSection extends StatefulWidget {
  const Under250ExploreMenuSection({super.key});

  @override
  State<Under250ExploreMenuSection> createState() =>
      _Under250ExploreMenuSectionState();
}

class _Under250ExploreMenuSectionState
    extends State<Under250ExploreMenuSection> {
  int selectedIndex = 0;

  final items = List.generate(
    10,
    (index) => _MenuItemData(
      title: "Item ${index + 1}",
      image: "assets/images/pizza.png",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // 🔒 FIXED HEIGHT
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length + 2, // Explore + items + See All
        itemBuilder: (context, index) {
          if (index == 0) {
            return _ExploreItem(
              isSelected: selectedIndex == 0,
              onTap: () {
                setState(() => selectedIndex = 0);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ExploreOnlyPage()),
                );
              },
            );
          }

          if (index == items.length + 1) {
            return _SeeAllItem(
              isSelected: selectedIndex == index,
              onTap: () {
                setState(() => selectedIndex = index);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ExploreOnlyPage()),
                );
              },
            );
          }

          final item = items[index - 1];
          return _MenuItem(
            item: item,
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() => selectedIndex = index);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ExploreOnlyPage()),
              );
            },
          );
        },
      ),
    );
  }
}

class _ExploreItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const _ExploreItem({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return _BaseMenuWrapper(
      isSelected: isSelected,
      onTap: onTap,
      label: "Explore",
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset("assets/gif/explore.gif", fit: BoxFit.cover),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final _MenuItemData item;
  final bool isSelected;
  final VoidCallback onTap;

  const _MenuItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _BaseMenuWrapper(
      isSelected: isSelected,
      onTap: onTap,
      label: item.title,
      child: Image.asset(item.image, fit: BoxFit.cover),
    );
  }
}

class _SeeAllItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const _SeeAllItem({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return _BaseMenuWrapper(
      isSelected: isSelected,
      onTap: onTap,
      label: "See All",
      child: const Icon(Icons.restaurant_menu, color: Colors.red, size: 30),
    );
  }
}

class _BaseMenuWrapper extends StatelessWidget {
  final Widget child;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _BaseMenuWrapper({
    required this.child,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        margin: const EdgeInsets.only(right: 14),
        padding: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected
                  ? const Color.fromARGB(255, 230, 63, 12)
                  : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Center(child: child),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItemData {
  final String title;
  final String image;

  _MenuItemData({required this.title, required this.image});
}

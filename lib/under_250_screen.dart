import 'package:flutter/material.dart';
import 'package:zomatoo/widgets/explore_menu_curved_section.dart';
import 'package:zomatoo/widgets/home_filter_bar.dart';
import 'package:zomatoo/widgets/under_250_section.dart';

class Under250Screen extends StatelessWidget {
  const Under250Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: false,
            floating: false,
            expandedHeight: 230,
            backgroundColor: const Color.fromARGB(248, 255, 255, 255),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // 🔵 Banner image (NO weird zoom now)
                  Transform.scale(
                    scale: 1.08, // try 1.05 – 1.12
                    child: Image.asset(
                      'assets/images/under_250_banner.png',
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Soft overlay (optional)
                  Container(
                    color: const Color.fromARGB(
                      255,
                      255,
                      255,
                      255,
                    ).withOpacity(0.04),
                  ),

                  // 📍 Header Content
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 📍 Location Icon
                            const Icon(
                              Icons.location_on,
                              color: Color.fromARGB(255, 19, 19, 19),
                              size: 22,
                            ),

                            const SizedBox(width: 6),

                            // 📍 Location Text
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Block R",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Icon(Icons.keyboard_arrow_down, size: 18),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Mohan Garden, Razapur Khurd…",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 8),

                            // 🟡 GOLD Chip
                            Container(
                              height: 32,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF3D6),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: const Color(0xFFFFD28C),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "GOLD",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xFFB78628),
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "₹1",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFB78628),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 8),

                            // 👤 Profile
                            const CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.blue,
                              child: Text(
                                "P",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔹 ExploreMenuCurvedSection as a pinned header
          SliverPersistentHeader(
            pinned: true, // keeps menu visible on scroll
            delegate: _SliverAppBarDelegate(
              minHeight: 140, // must be >= content height
              maxHeight: 140,
              child: Container(
                color: Colors.white, // optional background
                child: ExploreMenuCurvedSection(),
              ),
            ),
          ),

          SliverToBoxAdapter(child: const SizedBox(height: 12)),
          // 🔹 HomeFilterBar
          SliverToBoxAdapter(child: HomeFilterBar()),

          SliverToBoxAdapter(child: const SizedBox(height: 15)),
          SliverToBoxAdapter(child: Under250Section()),

          // 📜 DUMMY CONTENT
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _iconToggle({
  required IconData icon,
  required Color activeColor,
  required bool isActive,
}) {
  return Container(
    height: 28,
    width: 28,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isActive ? activeColor.withOpacity(0.15) : Colors.grey.shade200,
    ),
    child: Icon(icon, size: 16, color: isActive ? activeColor : Colors.grey),
  );
}

/// Helper for pinned SliverPersistentHeader (HomeFilterBar)
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

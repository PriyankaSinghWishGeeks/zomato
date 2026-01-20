import 'package:flutter/material.dart';
import 'package:zomatoo/widgets/explore_menu_curved_section.dart';
import 'package:zomatoo/widgets/in_mood_for.dart';

import 'widgets/dining_explore_cart.dart';
import 'widgets/dining_featured_arount.dart';
import 'widgets/dining_must_try.dart';
import 'widgets/dining_popular_resturent.dart';
import 'widgets/limelight.dart';
import 'widgets/next_fav_bar.dart';

class DiningScreen extends StatelessWidget {
  const DiningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 🔹 Top Purple Banner with Location + Search (pinned)
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 140,
              maxHeight: 140,
              child: Container(
                color: const Color.fromARGB(255, 17, 3, 43), // dark purple
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 📍 Location Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 22,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Row(
                                children: [
                                  Text(
                                    "Block R",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              SizedBox(height: 2),
                              Text(
                                "Mohan Garden, Razapur Khurd…",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12.5,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey.shade200,
                          child: const Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 8),
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

                    const SizedBox(height: 12),

                    // 🔍 Search Bar inside purple
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.red),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Search "noodles"',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Container(
                            height: 24,
                            width: 1,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.mic, color: Colors.red),
                          const SizedBox(width: 10),
                          _iconToggle(
                            icon: Icons.eco,
                            activeColor: Colors.green,
                            isActive: true,
                          ),
                          const SizedBox(width: 8),
                          _iconToggle(
                            icon: Icons.favorite,
                            activeColor: Colors.green,
                            isActive: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 🟣 Banner below purple header (scrolls)
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                image: DecorationImage(
                  image: AssetImage('assets/images/dinner_banner.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // 🔵 Curved Explore Menu Section (pinned)
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 140,
              maxHeight: 140,
              child: Container(
                color: Colors.white,
                child: ExploreMenuCurvedSection(),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: InTheMoodSection()),

          const SliverToBoxAdapter(child: FavouriteBarSection()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          const SliverToBoxAdapter(child: InTheLimeLight()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          const SliverToBoxAdapter(child: DiningExploreCart()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          const SliverToBoxAdapter(child: DiningFeatured()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          const SliverToBoxAdapter(child: MustTriesSection()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          const SliverToBoxAdapter(child: DiningPopularRestaurants()),

   SliverToBoxAdapter(child: SizedBox(height: 20)),

        ],
      ),
    );
  }
}

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

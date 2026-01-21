import 'package:flutter/material.dart';
import 'package:zomatoo/gold%20pages/gold_page.dart';
import 'package:zomatoo/location/location_bottom_sheet.dart';
import 'package:zomatoo/offers_banner_slider.dart';
import 'package:zomatoo/payment_history/money_history_page.dart';
import 'package:zomatoo/profile/user_profile.dart';
import 'package:zomatoo/search_items/search_items.dart';
import 'package:zomatoo/widgets/explore_menu_section.dart';
import 'package:zomatoo/widgets/explore_more_section.dart';
import 'package:zomatoo/widgets/featured_section.dart';
import 'package:zomatoo/widgets/home_filter_bar.dart';
import 'package:zomatoo/widgets/recommended_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 📍 LOCATION + TOP BAR (scrolls)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.red, size: 22),
                    const SizedBox(width: 6),
                    InkWell(
                      onTap: () => _openLocationBottomSheet(context),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Row(
                              children: [
                                Text(
                                  "Block R",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down, size: 18),
                              ],
                            ),
                            Text(
                              "Mohan Garden, Razapur khud...",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 7),

                    // GOLD
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ZomatoGoldPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3D6),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFFFD28C)),
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
                            SizedBox(width: 3),
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
                    ),

                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ZomatoMoneyPage(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey.shade200,
                        child: const Icon(
                          Icons.account_balance_wallet_outlined,
                          size: 18,
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfilePage(),
                          ),
                        );
                      },
                      child: const CircleAvatar(
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
                    ),
                  ],
                ),
              ),
            ),

            // 🔍 FIXED SEARCH BAR
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 1,
              toolbarHeight: 72,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SearchItemsPage(),
                      ),
                    );
                  },
                  child: Container(
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
                ),
              ),
            ),

            // 🎬 GIF BANNER
            SliverToBoxAdapter(
              child: Column(
                children: const [
                  SizedBox(height: 12),
                  OffersBannerSlider(), // <-- your custom slider widget
                ],
              ),
            ),
            SliverToBoxAdapter(child: ExploreMenuSection()),

            SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(child: HomeFilterBar()),
            SliverToBoxAdapter(child: SizedBox(height: 8)),

            SliverToBoxAdapter(
              child: Divider(
                height: 1,
                thickness: 0.6,
                color: Color(0xFFE0E0E0),
              ),
            ),
            SliverToBoxAdapter(child: RecommendedSection()),
            SliverToBoxAdapter(child: SizedBox(height: 8)),
            SliverToBoxAdapter(child: ExploreMoreSection()),
            SliverToBoxAdapter(child: FeaturedSection()),

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
      ),
    );
  }

  // 🔴 Top Category Widget
  static Widget _topCategory(String title, IconData icon) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red.shade50,
            child: Icon(icon, color: Colors.red, size: 30),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // 🍽 Restaurant Card Widget
  static Widget _restaurantCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                color: Colors.grey.shade300,
              ),
              child: const Center(
                child: Icon(Icons.restaurant, size: 60, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Burger King",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Fast Food, Burger",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 6),
                  Text("⭐ 4.2 • 30 mins", style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
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

void _openLocationBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => const LocationBottomSheet(),
  );
}

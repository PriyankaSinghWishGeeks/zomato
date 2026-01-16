import 'package:flutter/material.dart';
import 'package:zomatoo/widgets/home_filter_bar.dart';
import 'package:zomatoo/widgets/most_ordered_section.dart';
import 'package:zomatoo/widgets/recommende_section_list.dart';
import 'package:zomatoo/widgets/recommended_combo_section.dart';
import 'package:zomatoo/widgets/recommended_menu_info.dart';

class RestaurantMenuScreen extends StatelessWidget {
  const RestaurantMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _header(context),
              _restaurantInfo(),
              _offers(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ), // space above and below
                  child: HomeFilterBar(),
                ),
              ),

              MostOrderedSection(),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300),
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: const RecommendedSectionList(),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300),
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: const RecommendedComboSection(),
                ),
              ),

              SliverToBoxAdapter(child: RecommendedMenuInfoSection()),
            ],
          ),

          Positioned(bottom: 20, right: 16, child: _menuButton(context)),
        ],
      ),
    );
  }

  // 🔹 HEADER
  SliverAppBar _header(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 2,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12), // subtle shadow
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(Icons.arrow_back, size: 20, color: Colors.black),
          ),
        ),
      ),

      titleSpacing: 0,

      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {
              // TODO: open search page
            },
            child: Container(
              height: 40, // match the back button height
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, size: 18, color: Colors.black),
                  SizedBox(width: 6),
                  Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {
              // TODO: menu action
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
                // 🔹 use border instead of shadow if you want flatter UI
                // border: Border.all(color: Colors.black12),
              ),
              child: const Icon(Icons.more_vert, color: Colors.black, size: 20),
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  // 🔹 RESTAURANT DETAILS
  SliverToBoxAdapter _restaurantInfo() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 LEFT SIDE (Info)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1️⃣ Pure Veg tag
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.eco, size: 14, color: Colors.green),
                        SizedBox(width: 4),
                        Text(
                          "Pure Veg",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 2️⃣ Restaurant Name + info icon
                  Row(
                    mainAxisSize:
                        MainAxisSize.min, // hug content, no extra space
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delicious Restaurant",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Superscript-like info icon
                      Transform.translate(
                        offset: const Offset(
                          2,
                          -6,
                        ), // move slightly right and up
                        child: const Icon(
                          Icons.info_outline,
                          size: 16, // slightly smaller than text
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // 3️⃣ Location
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text("3.6 km", style: TextStyle(color: Colors.grey)),
                      Text(
                        " • Uttam Nagar",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // 4️⃣ Schedule
                  Row(
                    children: const [
                      Icon(
                        Icons.access_time_outlined,
                        size: 16,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text("40–45 mins", style: TextStyle(color: Colors.grey)),
                      Text(
                        " • Schedule for later",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 244, 248),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.check,
                          size: 18,
                          color: Color.fromARGB(255, 4, 83, 6),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "On-time preparation",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 35, 63),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // 🔹 RIGHT SIDE (Ratings)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // 1️⃣ Rating container
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 2, 80, 4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.star, size: 16, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        "4.0",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                  ), // spacing from above row
                  child: Text(
                    "By 1.9k+",
                    style: const TextStyle(
                      fontSize: 12, // slightly bigger

                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted,
                      decorationThickness:
                          2.5, // make dotted underline more visible
                      height: 2.3, // increases space between text and underline
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 OFFERS
  SliverToBoxAdapter _offers() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.local_offer, color: Colors.orange),
              SizedBox(width: 8),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      "10% OFF up to ₹40",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(), // pushes the following group to the right
                    Row(
                      children: [
                        Text(
                          "2 offers",
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(width: 4), // small gap before arrow
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 16,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _menuButton(BuildContext context) {
  return InkWell(
    borderRadius: BorderRadius.circular(24),
    onTap: () => _openMenuSheet(context),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: const [
          Icon(Icons.restaurant_menu, color: Colors.white, size: 18),
          SizedBox(width: 8),
          Text(
            "Menu",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}

void _openMenuSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => const _MenuBottomSheet(),
  );
}

class _MenuBottomSheet extends StatelessWidget {
  const _MenuBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🔹 Header
          Row(
            children: [
              const Text(
                "Menu",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, size: 22),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 🔹 Menu List
          _menuItem(
            title: "Most Ordered Together",
            count: 5,
            color: Colors.red,
          ),
          _menuItem(title: "Recommended for you", count: 8),
          _menuItem(title: "Pizza Combos", count: 6),
          _menuItem(title: "Veg Single Pizza", count: 9),
          _menuItem(title: "Party Specials", count: 4),
        ],
      ),
    );
  }

  Widget _menuItem({
    required String title,
    required int count,
    Color color = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ),
          Text(
            count.toString(),
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zomatoo/offers_banner_slider.dart';
import 'package:zomatoo/widgets/explore_menu_section.dart';
import 'package:zomatoo/widgets/home_filter_bar.dart';

class Under250Screen extends StatefulWidget {
  const Under250Screen({super.key});

  @override
  State<Under250Screen> createState() => _Under250ScreenState();
}

class _Under250ScreenState extends State<Under250Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 251, 255),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 8),

                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.red, size: 22),
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
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down, size: 18),
                            ],
                          ),
                          Text(
                            "Mohan Garden, Razapur Khurd…",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.5,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 8),

                    // GOLD
                    Container(
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

                  
                    const SizedBox(width: 8),

                    // 👤 Profile icon
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
          ],
        ),
      ),
    );
  }
}

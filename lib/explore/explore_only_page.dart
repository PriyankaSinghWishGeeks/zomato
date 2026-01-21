import 'package:flutter/material.dart';
import 'package:zomatoo/search_items/search_items.dart';
import 'package:zomatoo/widgets/explore_menu_section.dart';
import 'package:zomatoo/widgets/home_filter_bar.dart';
import 'package:zomatoo/widgets/recommended_section.dart';
import 'package:zomatoo/widgets/explore_more_section.dart';
import 'package:zomatoo/widgets/featured_section.dart';

class ExploreOnlyPage extends StatelessWidget {
  const ExploreOnlyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: CustomScrollView(
          slivers: [

            /// 🔍 FIXED SEARCH WITH BACK + MIC
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
                child: Row(
                  children: [

                    /// BACK
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back, color: Colors.black),
                    ),

                    const SizedBox(width: 10),

                    /// SEARCH BAR
                    Expanded(
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
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search, color: Colors.red),
                              const SizedBox(width: 8),
                              const Expanded(
                                child: Text(
                                  'Search food or restaurant',
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// 🍱 START DIRECTLY WITH EXPLORE
            SliverToBoxAdapter(child: ExploreMenuSection()),
            SliverToBoxAdapter(child: const SizedBox(height: 12)),
            SliverToBoxAdapter(child: HomeFilterBar()),
            SliverToBoxAdapter(child: const SizedBox(height: 8)),

            SliverToBoxAdapter(
              child: Divider(
                height: 1,
                thickness: 0.6,
                color: Color(0xFFE0E0E0),
              ),
            ),

            SliverToBoxAdapter(child: RecommendedSection()),
            SliverToBoxAdapter(child: const SizedBox(height: 8)),
            SliverToBoxAdapter(child: ExploreMoreSection()),
            SliverToBoxAdapter(child: FeaturedSection()),
          ],
        ),
      ),
    );
  }
}

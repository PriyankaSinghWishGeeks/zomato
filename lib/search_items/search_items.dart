import 'package:flutter/material.dart';
import 'package:zomatoo/explore/explore_only_page.dart';

class SearchItemsPage extends StatelessWidget {
  const SearchItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      "Pizza",
      "Burger",
      "Noodles",
      "Biryani",
      "Pasta",
      "Sandwich",
      "Fries",
      "Momos",
      "Wrap",
      "Pizza",
      "Burger",
      "Noodles",
      "Biryani",
      "Pasta",
      "Sandwich",
      "Fries",
      "Momos",
      "Wrap",
      "Pizza",
      "Burger",
      "Noodles",
      "Biryani",
      "Pasta",
      "Sandwich",
      "Fries",
      "Momos",
      "Wrap",
      "Pizza",
      "Burger",
      "Noodles",
      "Biryani",
      "Pasta",
      "Sandwich",
      "Fries",
      "Momos",
      "Wrap",
      "Pizza",
      "Burger",
      "Noodles",
      "Biryani",
      "Pasta",
      "Sandwich",
      "Fries",
      "Momos",
      "Wrap",
      "Pizza",
      "Burger",
      "Noodles",
      "Biryani",
      "Pasta",
      "Sandwich",
      "Fries",
      "Momos",
      "Wrap",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔴 SEARCH HEADER
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.red),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.red),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search for dishes",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(Icons.mic, color: Colors.red),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "What’s on your mind?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),

            /// 🍕 GRID LIST
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    return _itemCard(context, items[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🍽 GRID ITEM CARD
  Widget _itemCard(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ExploreOnlyPage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/pizza.png",
              height: 48,
              width: 48,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

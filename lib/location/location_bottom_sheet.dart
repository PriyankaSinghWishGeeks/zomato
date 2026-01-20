import 'package:flutter/material.dart';

class LocationBottomSheet extends StatelessWidget {
  const LocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// ⬇️ Close Arrow
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.keyboard_arrow_down, size: 32),
            ),

            const SizedBox(width: 8),

            /// 📍 Title
            const Text(
              "Select a location",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            /// 🔍 Search Field
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.red),
                hintText: "Search for area, street name...",
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// 📍 Current Location
            _locationRow(
              icon: Icons.my_location,
              iconColor: Colors.red,
              title: "Use current location",
              subtitle: "Industrial Area Sector 62, Noida",
            ),

            const Divider(height: 30),

            /// ➕ Add Address
            _locationRow(
              icon: Icons.add,
              iconColor: Colors.red,
              title: "Add address",
            ),

            const SizedBox(height: 20),

            /// 📌 Nearby Locations Title
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "NEARBY LOCATIONS",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// 🗂 Nearby Cards
            Expanded(
              child: ListView(
                children: List.generate(10, (index) {
                  return _nearbyLocationCard(
                    distance: "7.4 km",
                    title: "The Corenthum",
                    subtitle: "Sector 62, Block A, Industrial Area, Noida",
                  );
                }),
              ),
            ),

            const SizedBox(height: 16),

            /// 📌 Nearby Locations Title
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "EECENT LOCATIONS",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _nearbyLocationCard(
                    distance: "7.4 km",
                    title: "The Corenthum",
                    subtitle: "Sector 62, Block A, Industrial Area, Noida",
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Reusable row
  Widget _locationRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14),
        ],
      ),
    );
  }

  /// Nearby location card
  Widget _nearbyLocationCard({
    required String distance,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const Icon(Icons.location_on, color: Colors.red),
                const SizedBox(height: 4),
                Text(distance, style: const TextStyle(fontSize: 11)),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final locations = List.filled(10, {
  "distance": "7.4 km",
  "title": "The Corenthum",
  "subtitle": "Sector 62, Block A, Industrial Area, Noida",
});

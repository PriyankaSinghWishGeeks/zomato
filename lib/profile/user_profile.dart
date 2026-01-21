import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            /// 🧑 PROFILE CARD
            _card(
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Priyanka Singh",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "priyanka@email.com",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Edit profile",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// 💳 MONEY & COUPONS
            _card(
              child: Row(
                children: [
                  _actionButton(
                    icon: Icons.account_balance_wallet,
                    label: "Zomato Money",
                    onTap: () {},
                  ),
                  _divider(),
                  _actionButton(
                    icon: Icons.local_offer_outlined,
                    label: "Your Coupons",
                    onTap: () {},
                  ),
                ],
              ),
            ),

            /// ⚙️ PREFERENCES
            _card(
              child: Column(
                children: [
                  _listTile("Food Preferences", "Veg / Non-Veg"),
                  _listTile("Health Mode", "Low oil, low sugar"),
                  _listTile("Appearance", "Light / Dark"),
                  _listTile("Payment Methods", "Cards, UPI"),
                ],
              ),
            ),

            /// 🍽️ SERVICES
            _card(
              child: Column(
                children: [
                  _listTile("Food Delivery"),
                  _listTile("Dining & Experiences"),
                  _listTile("Gift Cards & Credits"),
                  _listTile("Zomato for Enterprises"),
                  _listTile("Feeding India"),
                  _listTile("Membership & Rewards"),
                  _listTile("More"),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// 🧱 COMMON CARD
  Widget _card({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      ),
    );
  }

  /// 🔘 BUTTON
  Widget _actionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Icon(icon, color: Colors.red),
            const SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.grey.shade300,
    );
  }

  /// 📄 LIST TILE
  Widget _listTile(String title, [String? subtitle]) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle) : null,
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          onTap: () {},
        ),
        Divider(color: Colors.grey.shade200),
      ],
    );
  }
}

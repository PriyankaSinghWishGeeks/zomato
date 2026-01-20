import 'package:flutter/material.dart';
import 'package:zomatoo/notificationLogin/enable_notification.dart';

class LoginPersonalDetailPage extends StatefulWidget {
  const LoginPersonalDetailPage({super.key});

  @override
  State<LoginPersonalDetailPage> createState() =>
      _LoginPersonalDetailPageState();
}

class _LoginPersonalDetailPageState extends State<LoginPersonalDetailPage> {
  final TextEditingController nameController = TextEditingController(
    text: "Priyanka Singh",
  );

  int selectedDiet = 0; // 0 = none, 1 = veg, 2 = non-veg

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Personal Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// What's your name
            const Text(
              "What's your name?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 12),

            /// Name Input with Clear Button
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter your name",
                suffixIcon: GestureDetector(
                  onTap: () => nameController.clear(),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: const Icon(Icons.close, size: 18),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 32),

            /// Dietary Preferences
            const Text(
              "What is your dietary preference?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                _dietOption(
                  label: "Veg",
                  isSelected: selectedDiet == 1,
                  borderColor: Colors.green,
                  iconColor: Colors.green,
                  onTap: () => setState(() => selectedDiet = 1),
                ),
                const SizedBox(width: 16),
                _dietOption(
                  label: "Non-Veg",
                  isSelected: selectedDiet == 2,
                  borderColor: Colors.brown,
                  iconColor: Colors.brown,
                  onTap: () => setState(() => selectedDiet = 2),
                ),
              ],
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EnableNotificationPage(),
                    ),
                  );
                },
                child: const Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(255, 254, 253, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Diet Option Widget
  Widget _dietOption({
    required String label,
    required bool isSelected,
    required Color borderColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? borderColor : Colors.grey.shade400,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            /// Circle with symbol
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(color: iconColor, width: 2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: iconColor,
                    shape: label == "Veg"
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(label),
          ],
        ),
      ),
    );
  }
}

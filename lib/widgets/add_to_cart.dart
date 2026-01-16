import 'package:flutter/material.dart';
import 'package:zomatoo/models/menu_item.dart';

class AddToCartSheet extends StatefulWidget {
  final MenuItem item;

  const AddToCartSheet({super.key, required this.item});

  @override
  State<AddToCartSheet> createState() => _AddToCartSheetState();
}

class _AddToCartSheetState extends State<AddToCartSheet> {
  int quantity = 1;
  String size = "Regular";
  bool cheeseCrust = false;
  bool extraCheese = false;
  Map<String, bool> addOns = {
    "Cheese Burst": false,
    "Extra Cheese": false,
    "Extra Spicy": false,
    "Butter Topping": false,
    "Olives": false,
  };

  int get totalPrice => widget.item.price * quantity;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: screenHeight * 0.8,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 80),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // ✅ sheet background
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// HEADER
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.item.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // ✅ make text visible
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    /// IMAGE + DETAILS
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            widget.item.image,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Veg icon
                                const Icon(
                                  Icons.eco,
                                  color: Colors.green,
                                  size: 18,
                                ),

                                const SizedBox(height: 6),

                                // Title
                                Text(
                                  widget.item.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                // Recommended bar
                                Row(
                                  children: [
                                    Container(
                                      height: 6,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Text(
                                      "Highly recommended",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 8),

                                // Price
                                Text(
                                  "₹${widget.item.price}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                // Description
                                const Text(
                                  "Aloo tikki [2 pieces] stuffed with dry fruits with dahi, green chutney and sonth...",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                // Add + Share
                                Row(
                                  children: [
                                    _iconButton(Icons.bookmark_border),
                                    const SizedBox(width: 10),
                                    _iconButton(Icons.share_outlined),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// SIZE
                    const Text(
                      "Choose Size",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    _radioTile("Regular"),
                    _radioTile("Medium"),
                    _radioTile("Large"),

                    const SizedBox(height: 12),

                    /// CRUST
                    const Text(
                      "Choice of Crust",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    _checkTile(
                      "Cheese Burst",
                      cheeseCrust,
                      (v) => setState(() => cheeseCrust = v),
                    ),

                    const SizedBox(height: 12),

                    /// ADD ONS
                    const Text(
                      "Add-ons",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    ...addOns.entries.map(
                      (e) => _checkTile(
                        e.key,
                        e.value,
                        (v) => setState(() => addOns[e.key] = v),
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// COOKING REQUEST
                    const Text(
                      "Cooking request",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: "Less spicy, well cooked, etc.",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// FIXED BOTTOM BAR
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _qtyButton(Icons.remove, () {
                      if (quantity > 1) setState(() => quantity--);
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        quantity.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _qtyButton(Icons.add, () => setState(() => quantity++)),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "ADD ₹$totalPrice",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioTile(String value) => RadioListTile<String>(
    value: value,
    groupValue: size,
    onChanged: (v) => setState(() => size = v!),
    title: Text(value),
    dense: true,
  );

  Widget _checkTile(String title, bool value, Function(bool) onChanged) =>
      CheckboxListTile(
        value: value,
        onChanged: (v) => onChanged(v!),
        title: Text(title),
        dense: true,
        controlAffinity: ListTileControlAffinity.leading,
      );

  Widget _qtyButton(IconData icon, VoidCallback onTap) => InkWell(
    onTap: onTap,
    child: Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, size: 18),
    ),
  );
}

Widget _iconButton(IconData icon) => Container(
  height: 36,
  width: 36,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey.shade300),
    borderRadius: BorderRadius.circular(8),
  ),
  child: Icon(icon, size: 18),
);

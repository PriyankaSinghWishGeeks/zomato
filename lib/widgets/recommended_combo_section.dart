import 'package:flutter/material.dart';
import 'package:zomatoo/widgets/recommende_section_list.dart';

class RecommendedComboSection extends StatelessWidget {
  const RecommendedComboSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Pizza Pia Combination",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          ComboAccordion(title: "Veg Single Pizza"),
          ComboAccordion(title: "Pizza Pia Combination"),
        ],
      ),
    );
  }
}

class ComboAccordion extends StatefulWidget {
  final String title;

  const ComboAccordion({super.key, required this.title});

  @override
  State<ComboAccordion> createState() => _ComboAccordionState();
}

class _ComboAccordionState extends State<ComboAccordion> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() => isOpen = !isOpen),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 24,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ),
        ),

        if (isOpen)
          Column(
            children: List.generate(3, (index) {
              return Column(
                children: [
                  const RecommendedItemCard(),

                  if (index != 2)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(color: Colors.grey.shade300, height: 24),
                    ),
                ],
              );
            }),
          ),
      ],
    );
  }
}

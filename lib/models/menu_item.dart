class MenuItem {
  final String name;
  final String description;
  final String image;
  final int price;
  final bool isVeg;
  final bool highlyReordered;

  MenuItem({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.isVeg = true,
    this.highlyReordered = true,
  });
}

class AutoImageSlider extends StatefulWidget {
  const AutoImageSlider({super.key});

  @override
  State<AutoImageSlider> createState() => _AutoImageSliderState();
}

class _AutoImageSliderState extends State<AutoImageSlider> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<String> images = List.generate(
    5,
    (i) => 'assets/images/resturent${i + 1}.jpg',
  );

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 3));
      _currentIndex = (_currentIndex + 1) % images.length;

      _controller.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: images.length,
      itemBuilder: (_, index) {
        return Image.asset(
          images[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}

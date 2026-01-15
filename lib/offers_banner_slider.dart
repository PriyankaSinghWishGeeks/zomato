import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class OffersBannerSlider extends StatefulWidget {
  const OffersBannerSlider({super.key});

  @override
  State<OffersBannerSlider> createState() => _OffersBannerSliderState();
}

class _OffersBannerSliderState extends State<OffersBannerSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<_BannerItem> banners = [
    _BannerItem(type: BannerType.lottie, path: 'assets/banners/banner1.json'),
    _BannerItem(type: BannerType.gif, path: 'assets/banners/banner2.gif'),
    _BannerItem(type: BannerType.gif, path: 'assets/banners/banner3.gif'),
    _BannerItem(type: BannerType.gif, path: 'assets/banners/banner4.gif'),
  ];

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_pageController.hasClients) {
        _currentIndex = (_currentIndex + 1) % banners.length;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // 🎯 Banner
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 160,
              child: PageView.builder(
                controller: _pageController,
                itemCount: banners.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (_, index) {
                  return _BannerView(item: banners[index]);
                },
              ),
            ),
          ),

          const SizedBox(height: 8),

          // ⚪ DOT INDICATOR (bottom-center)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(banners.length, (index) {
              final isActive = index == _currentIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 16 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(isActive ? 0.6 : 0.3),
                  borderRadius: BorderRadius.circular(6),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _BannerView extends StatelessWidget {
  final _BannerItem item;

  const _BannerView({required this.item});

  @override
  Widget build(BuildContext context) {
    switch (item.type) {
      case BannerType.lottie:
        return Lottie.asset(
          item.path,
          fit: BoxFit.cover,
          width: double.infinity,
        );

      case BannerType.gif:
      case BannerType.image:
        return Image.asset(
          item.path,
          fit: BoxFit.cover,
          width: double.infinity,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded || frame != null) return child;
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(color: Colors.grey.shade300),
            );
          },
        );
    }
  }
}

enum BannerType { image, gif, lottie }

class _BannerItem {
  final BannerType type;
  final String path;

  _BannerItem({required this.type, required this.path});
}

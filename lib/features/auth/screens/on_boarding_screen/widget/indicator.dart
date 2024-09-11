
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: _controller, // PageController
        count: 3,
        axisDirection: Axis.horizontal,
        effect: const ExpandingDotsEffect(
          dotColor: AppColor.dotColor,
          activeDotColor: AppColor.primary,
          dotHeight: 4,
          spacing: 8,
        ));
  }
}

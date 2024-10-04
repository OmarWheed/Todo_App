import 'package:flutter/material.dart';

import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/extension/navigator.dart';
import 'package:to_do_app/core/routes/app_routes_name.dart';
import 'package:to_do_app/core/shared/cache_helper.dart';
import 'package:to_do_app/core/shared/shared_keys.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/widget/custom_text_button.dart';
import 'package:to_do_app/features/auth/screens/on_boarding_screen/widget/indicator.dart';
import 'package:to_do_app/features/auth/screens/on_boarding_screen/widget/on_boarding_model.dart';
import 'package:to_do_app/core/services/services_locator.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    final lastOnBoarding = pageViewScreen.length - 1;
    return PageView.builder(
      itemCount: pageViewScreen.length,
      controller: _controller,
      itemBuilder: (context, index) {
        return Column(children: [
          //space from up
          14.height,
          //text
          index != lastOnBoarding
              ? Align(
                  alignment: Alignment.topLeft,
                  child: CustomTextButton(
                    text: AppStrings.skip,
                    onPressed: () {
                      _controller.jumpToPage(lastOnBoarding);
                    },
                  ),
                )
              : const SizedBox(
                  height: 50,
                ),

          //image
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Image.asset(pageViewScreen[index].img),
          ),

          Indicator(controller: _controller),

          //title
          Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 42),
            child: Text(pageViewScreen[index].title,
                style: Theme.of(context).textTheme.displayLarge),
          ),

          Text(pageViewScreen[index].desc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                  visible: index != 0,
                  child: CustomTextButton(
                    text: AppStrings.back,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColor.txtColor.withOpacity(0.44),
                        ),
                    onPressed: () {
                      _controller.previousPage(
                          duration: const Duration(milliseconds: 1),
                          curve: Curves.bounceIn);
                    },
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: AppColor.primary),
                child: Text(
                    index == lastOnBoarding
                        ? AppStrings.getStarted
                        : AppStrings.next,
                    style: Theme.of(context).textTheme.displayMedium),
                onPressed: () {
                  if (index != lastOnBoarding) {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 1),
                        curve: Curves.bounceIn);
                  } else {
                    sl<CacheHelper>()
                        .saveData(key: SharedKeys.onBoarding, value: true);
                    context.pushReplacementNamed(AppRoutesName.homePage);
                  }
                },
              ),
            ],
          ),
          55.height
          //two buttons
        ]);
      },
    );
  }
}

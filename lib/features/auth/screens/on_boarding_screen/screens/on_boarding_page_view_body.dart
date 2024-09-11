import 'package:flutter/material.dart';
import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/routes/app_routes_name.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/features/auth/screens/on_boarding_screen/widget/indicator.dart';
import 'package:to_do_app/features/auth/screens/on_boarding_screen/widget/on_boarding_model.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: pageViewScreen.length,
      controller: _controller,
      itemBuilder: (context, index) {
        return Column(children: [
          //space from up
          14.height,
          //text
          index != 2
              ? Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    child: Text(AppStrings.skip,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: AppColor.txtColor.withOpacity(0.44),
                                )),
                    onPressed: () {
                      _controller.jumpToPage(2);
                    },
                  ),
                )
              : const SizedBox(
                  height: 50,
                ),
          //space from up
          15.height,
          //image
          Image.asset(pageViewScreen[index].img),
          //space from up
          16.height,
          Indicator(controller: _controller),
          //space from up
          70.height,
          //title
          Text(pageViewScreen[index].title,
              style: Theme.of(context).textTheme.displayLarge),
          //space from up
          42.height,
          Text(pageViewScreen[index].desc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: Visibility(
                  visible: index != 0,
                  child: Text(AppStrings.back,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColor.txtColor.withOpacity(0.44),
                              )),
                ),
                onPressed: () {
                  _controller.previousPage(
                      duration: const Duration(milliseconds: 1),
                      curve: Curves.bounceIn);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: AppColor.primary),
                child: Text(
                    index == 2 ? AppStrings.getStarted : AppStrings.next,
                    style: Theme.of(context).textTheme.displayMedium),
                onPressed: () {
                  index != 2
                      ? _controller.nextPage(
                          duration: const Duration(milliseconds: 1),
                          curve: Curves.bounceIn)
                      : Navigator.pushNamed(context, AppRoutesName.homePage);
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

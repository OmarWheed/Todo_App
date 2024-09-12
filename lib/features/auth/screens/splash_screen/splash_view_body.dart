import 'package:flutter/material.dart';
import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/routes/app_routes_name.dart';
import 'package:to_do_app/core/shared/cache_helper.dart';
import 'package:to_do_app/core/shared/shared_keys.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/services/services_locator.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});
  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      if (sl<CacheHelper>().getData(key: SharedKeys.onBoarding) == null) {
        Navigator.pushNamed(context, AppRoutesName.onBoarding);
      } else {
        Navigator.pushNamed(context, AppRoutesName.homePage);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Image.asset(AppAssets.appLogo),
          //Gap
          19.height,
          //App Name
          Text(AppStrings.appName,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 40)),
        ],
      ),
    );
  }
}


import 'package:bilim_all/src/features/ui/wishlist_screen/wishlist_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../featured_screen/ui/widgets/courses/course.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final model = WishlistScreenModel();
    return WishlistScreenModelProvider(model: model, child: const _WishlistScreenBody());
  }
}

class _WishlistScreenBody extends StatelessWidget {
  const _WishlistScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackground,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: [
                SvgPicture.asset(AppAssets.svg.search),
                const SizedBox(width: 10,)
              ],
              elevation: 1,
              backgroundColor: AppColors.defaultBackground,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                centerTitle: true,
                title: Text('${AppLocalizations.of(context)?.wishlist}',style: AppStyles.s20w500.copyWith(color: AppColors.mainBlue),),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
            child:Column(
              children: [
              ]
            ),
        ),
      ),
    );
  }
}

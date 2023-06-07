import 'package:bilim_all/src/features/ui/wishlist_screen/ui/widgets/videolist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../constants/app_assets.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_styles.dart';
import '../../data/dto/wishlist_dto.dart';
import 'one_list_tile.dart';

class OneListTileOverView extends StatelessWidget {
  const OneListTileOverView({Key? key,required this.course}) : super(key: key);
  final WishlistDto course;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                actions: [
                  SvgPicture.asset(
                    AppAssets.svg.search,
                    color: AppColors.mainBlue,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
                leading: const BackButton(
                  color: AppColors.mainBlue,
                ),
                elevation: 1,
                backgroundColor: AppColors.defaultBackground,
                title: Center(
                    child: Text(
                      '${AppLocalizations.of(context)?.courseOverview}',
                      style: AppStyles.s20w500.copyWith(color: AppColors.mainBlue),
                    )),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                WishlistTile(
                  course: course,
                  isChecked: false,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 31, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)?.courseOverview}',
                        style:
                        AppStyles.s26w700.copyWith(color: AppColors.black),
                      ),
                      Text(
                        course.description,
                        style:
                        AppStyles.s18w400.copyWith(color: AppColors.black),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Text(
                        course.name,
                        style: AppStyles.s16w600
                            .copyWith(color: AppColors.black, fontSize: 11),
                      ),
                      Text(
                        course.teachers.first.fullName ?? '',
                        style: AppStyles.s12w400.copyWith(
                            color: AppColors.authorNeutralTextColor,
                            fontSize: 11),
                      ),
                      VideosListWishlist(list: course.videoLessons),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );;
  }
}

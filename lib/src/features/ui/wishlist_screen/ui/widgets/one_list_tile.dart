import 'package:bilim_all/constants/app_assets.dart';
import 'package:bilim_all/constants/app_styles.dart';
import 'package:bilim_all/src/features/ui/featured_screen/data/bloc/courses_bloc.dart';
import 'package:bilim_all/src/features/ui/wishlist_screen/data/bloc/wishlist_screen_bloc.dart';
import 'package:bilim_all/src/features/ui/wishlist_screen/data/dto/wishlist_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../constants/app_colors.dart';
import 'one_list_overview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class WishlistTile extends StatelessWidget {
  const WishlistTile({Key? key, required this.course, required this.isChecked})
      : super(key: key);
  final WishlistDto course;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    var colors = '0xFF${course.category.color.replaceAll('#', '')}';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 18),
      child: GestureDetector(
        onTap: () => isChecked
            ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OneListTileOverView(
                          course: course,
                        )))
            : null,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.line),
              borderRadius: BorderRadius.circular(30)),
          child: Stack(
            children: [
              Column(
                children: [
                  Image.network(
                    course.imageUrl,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${course.videoLessons.length} ${AppLocalizations.of(context)?.lessons}',
                              style: AppStyles.s16w600
                                  .copyWith(color: AppColors.neutralTextColor),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              course.name,
                              style: AppStyles.s20w600
                                  .copyWith(color: AppColors.black),
                            )),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(course.teachers.first.avatar),
                              backgroundColor: Colors.transparent,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              course.teachers.first.fullName!,
                              style: AppStyles.s16w500.copyWith(
                                  color: AppColors.authorNeutralTextColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.line,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            children: [
                              Text(
                                course.price == 0
                                    ? '${AppLocalizations.of(context)?.free}'
                                    : course.price.toString(),
                                style: AppStyles.s20w600
                                    .copyWith(color: Color(int.parse(colors))),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                '${AppLocalizations.of(context)?.knowDetails}',
                                style: AppStyles.s20w600,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(int.parse(colors)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    course.category.name.en,
                    style: AppStyles.s14w600
                        .copyWith(color: AppColors.defaultBackground),
                  ),
                ),
              ),
              Positioned(
                  right: 5,
                  top: 5,
                  child: GestureDetector(
                      onTap: () async {
                        BlocProvider.of<WishlistScreenBloc>(context)
                            .add(RemoveWishlistEvent(id: course.id));
                        context.read<CoursesBloc>().add(GetCoursesEvent());
                        if (!isChecked) {
                          Navigator.pop(context);
                        }
                      },
                      child: InkWell(
                          child: SvgPicture.asset(AppAssets.svg.liked)))),
            ],
          ),
        ),
      ),
    );
  }
}

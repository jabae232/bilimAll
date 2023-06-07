import 'package:bilim_all/src/features/ui/account_screen/ui/widgets/edit_profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../data/bloc/account_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return const _AccountScreenBody();
  }
}

class _AccountScreenBody extends StatelessWidget {
  const _AccountScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          if (state is AccountLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AccountLoadedState) {
            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        Image(
                            image:
                                AssetImage(AppAssets.images.gradientAccount)),
                        Positioned(
                            top: 71,
                            left: 65,
                            right: 65,
                            child: Image(
                                image: AssetImage(AppAssets.images.logo))),
                      ],
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 17, right: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(AppAssets.images.userPic),
                        width: 205,
                        height: 205,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.svg.settings,
                            color: Colors.transparent,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.account.fullName,
                                  textAlign: TextAlign.center,
                                  style: AppStyles.s30w500
                                      .copyWith(color: AppColors.black),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                              },
                              child: SvgPicture.asset(AppAssets.svg.settings)),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                '${AppLocalizations.of(context)?.username}',
                                style: AppStyles.s12w400.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.authorNeutralTextColor),
                              )),
                              Expanded(
                                  child: Text(
                                      '${AppLocalizations.of(context)?.password}',
                                      style: AppStyles.s12w400.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors
                                              .authorNeutralTextColor))),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                '${state.account.email}',
                                style: AppStyles.s15w400.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.authorNeutralTextColor),
                              )),
                              Expanded(
                                  child: Text('* * * * * *',
                                      style: AppStyles.s15w400.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors
                                              .authorNeutralTextColor))),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Language',
                            style: AppStyles.s12w400.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.authorNeutralTextColor),
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: 10,
                                  child: Image(
                                    image: AssetImage(
                                      AppAssets.images.eng,
                                    ),
                                  )),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'English',
                                style: AppStyles.s15w400.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.authorNeutralTextColor),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is AccountError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

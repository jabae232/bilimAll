import 'package:bilim_all/src/features/ui/wishlist_screen/ui/widgets/one_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../data/bloc/wishlist_screen_bloc.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WishlistScreenBloc>(context).add(GetWishlistEvent());
    return _WishlistScreenBody(context: context,);
  }
}

class _WishlistScreenBody extends StatelessWidget {
  const _WishlistScreenBody({Key? key,required this.context}) : super(key: key);
  final BuildContext context;
  Future refresh() async {
    BlocProvider.of<WishlistScreenBloc>(context).add(GetWishlistEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackground,
      body: BlocBuilder<WishlistScreenBloc, WishlistScreenState>(
        builder: (context, state) {
          if(state is WishlistScreenLoadingState) {
            return const Center(child: CircularProgressIndicator(),);
          }if(state is WishlistScreenLoadedState) {
                return NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        actions: [
                          SvgPicture.asset(AppAssets.svg.search),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                        elevation: 1,
                        backgroundColor: AppColors.defaultBackground,
                        flexibleSpace: FlexibleSpaceBar(
                          titlePadding: EdgeInsets.zero,
                          centerTitle: true,
                          title: Text(
                            '${AppLocalizations
                                .of(context)
                                ?.wishlist}',
                            style:
                            AppStyles.s20w500.copyWith(color: AppColors.mainBlue),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return WishlistTile(
                                course: state.wishlist[index],
                                isChecked: true,
                              );
                            },
                            itemCount: state.wishlist.length,
                            shrinkWrap: true,),
                        ),
                        const SizedBox(height: 200,),
                      ],
                    ),
                  ),
                );
          }if(state is WishlistScreenErrorState) {
            return const Center(child: Text('Something gone wrong'),);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

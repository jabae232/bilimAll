
import 'package:bilim_all/src/features/ui/search_screen/search_screen_model.dart';
import 'package:bilim_all/src/features/ui/search_screen/widgets/top_searches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final model = SearchScreenModel();
  @override
  Widget build(BuildContext context) {
    return SearchScreenModelProvider(
        child: const _SearchScreenBody(), model: model);
  }
}

class _SearchScreenBody extends StatelessWidget {
  const _SearchScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackground,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 1,
              backgroundColor: AppColors.defaultBackground,
              title: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 19),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SvgPicture.asset(
                          AppAssets.svg.searchScreen,
                          width: 15.6,
                          height: 15.6,
                        ),
                      ),
                      hintText: "Search",
                      hintStyle: AppStyles.s15w400,
                      fillColor: AppColors.loginField,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 7.0,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(12.8)),
                      )),
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Container(height: 1,color: AppColors.loginField,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Top Searches',style: AppStyles.s16w600,),
                  Row(
                   children: const [
                     TopSearch(searchName: 'C#',),
                     TopSearch(searchName: 'JavaScript',),
                     TopSearch(searchName: 'Excel',),
                     TopSearch(searchName: 'Sql',),
                     TopSearch(searchName: 'C++',),
                     TopSearch(searchName: 'C#',),
                   ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: const [
                      TopSearch(searchName: 'Design',),
                      TopSearch(searchName: 'SMM',),
                      TopSearch(searchName: 'Marketing',),
                      TopSearch(searchName: 'React',),
                      TopSearch(searchName: 'UI/UX',),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

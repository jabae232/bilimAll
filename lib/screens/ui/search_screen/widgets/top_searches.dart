import 'package:bilim_all/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class TopSearch extends StatelessWidget {
  const TopSearch({Key? key,required this.searchName}) : super(key: key);
  final String searchName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey
        ),
        child: Padding(
          padding:EdgeInsets.all(1),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.defaultBackground,
            ),
              child: Text(searchName,style: AppStyles.s12w400,)),
        ),
      ),
    );
  }
}

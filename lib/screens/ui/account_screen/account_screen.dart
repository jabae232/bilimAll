import 'package:bilim_all/screens/ui/account_screen/account_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final model = AccountScreenModel();
    return AccountScreenModelProvider(model: model, child: const _AccountScreenBody());
  }
}

class _AccountScreenBody extends StatelessWidget {
  const _AccountScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
          /*  SliverAppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.chevron_left)),
              ),
              elevation: 0,
              backgroundColor: AppColors.defaultBackground,
              title:  Image(image: AssetImage(AppAssets.images.gradientAccount)),
            ),*/
            SliverToBoxAdapter(
              child:  Stack(
                children: [
                  Image(image: AssetImage(AppAssets.images.gradientAccount)),
                  Positioned(
                    top: 71,
                      left: 65,
                      right: 65,
                      child: Image(image: AssetImage(AppAssets.images.logo))),
                  /*Positioned(
                      top: 50,
                      left: 24,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.chevron_left,color: AppColors.defaultBackground,size: 30,)),
                      ),),*/
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 17,right: 17),
            child: Column(
              children: [
                  Image(image: AssetImage(AppAssets.images.userPic),width: 205,height: 205,),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(flex: 1,child: SizedBox(),),
                      Expanded(flex: 2,child: Text('Username',style: AppStyles.s30w500.copyWith(color: AppColors.black),),),
                      InkWell(
                        onTap: () => AccountScreenModelProvider.read(context)?.model.editProfile(context),
                          child: SvgPicture.asset(AppAssets.svg.settings)),
                    ],
                  ),
                const SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text('Email',style: AppStyles.s12w400.copyWith(fontWeight: FontWeight.w500,color:AppColors.authorNeutralTextColor ),)),
                        Expanded(child: Text('Password',style: AppStyles.s12w400.copyWith(fontWeight: FontWeight.w500,color:AppColors.authorNeutralTextColor))),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text('Username@mail.ru',style: AppStyles.s15w400.copyWith(fontWeight: FontWeight.w500,color:AppColors.authorNeutralTextColor ),)),
                        Expanded(child: Text('* * * * * *',style: AppStyles.s15w400.copyWith(fontWeight: FontWeight.w500,color:AppColors.authorNeutralTextColor))),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text('Language',style: AppStyles.s12w400.copyWith(fontWeight: FontWeight.w500,color:AppColors.authorNeutralTextColor ),),
                    Row(
                      children: [
                        CircleAvatar(radius: 10,child: Image(image: AssetImage(AppAssets.images.eng,),)),
                        const SizedBox(width: 4,),
                        Text('English',style: AppStyles.s15w400.copyWith(fontWeight: FontWeight.w500,color:AppColors.authorNeutralTextColor ),)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


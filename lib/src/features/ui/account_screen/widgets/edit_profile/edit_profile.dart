import 'package:bilim_all/constants/app_assets.dart';
import 'package:bilim_all/constants/app_colors.dart';
import 'package:bilim_all/constants/app_styles.dart';
import 'package:flutter/material.dart';

import 'edit_profile_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final model = EditProfileModel();
    return EditProfileModelProvider(child: const _EditProfileBody(), model: model);
  }
}

class _EditProfileBody extends StatelessWidget {
  const _EditProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
              SliverAppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.chevron_left,color: AppColors.mainBlue,)),
              ),
              elevation: 1,
              backgroundColor: AppColors.defaultBackground,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                centerTitle: true,
                title: Text('Edit Profile',style: AppStyles.s20w500.copyWith(color: AppColors.mainBlue),),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image(image: AssetImage(AppAssets.images.userPic),width: 155,height: 155,)),
                const SizedBox(height: 20,),
                Center(child: Text('Change avatar',style: AppStyles.s17w400.copyWith(fontWeight: FontWeight.w500,color: AppColors.mainBlue),)),
                const SizedBox(height: 47,),
                Text('PROFILE SETTINGS',style: AppStyles.s10w700.copyWith(fontWeight: FontWeight.w500,color: AppColors.authorNeutralTextColor),),
                const SizedBox(height: 15,),
                _Settings(title: 'Name', subtitle: 'Username'),
                _Settings(title: 'Change email', subtitle: 'Username@gmail.com'),
                _Settings(title: 'Change password', subtitle: '123456789'),
                _Settings(title: 'Language', subtitle: 'English'),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class _Settings extends StatelessWidget {
  const _Settings({Key? key,required this.title,required this.subtitle}) : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: AppStyles.s17w400.copyWith(fontWeight: FontWeight.w500,color: AppColors.black),),
      subtitle: Text(subtitle,style: AppStyles.s15w400.copyWith(fontWeight: FontWeight.w500,color: AppColors.authorNeutralTextColor),),
      trailing: const Icon(Icons.chevron_right_outlined,color: AppColors.black,),
    );
  }
}

import 'package:bilim_all/constants/app_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import 'login_screen_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final model = LoginScreenModel();
  @override
  Widget build(BuildContext context) {
    return LoginScreenModelProvider(
        child: _LoginScreenBody(), model: model);
  }
}

class _LoginScreenBody extends StatelessWidget {
  _LoginScreenBody({Key? key}) : super(key: key);
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.defaultBackground,
      ),
      backgroundColor: AppColors.defaultBackground,
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 63,),
            Text('Login', style: AppStyles.s36w700mainBlue),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 43),
                child: Image(image: AssetImage(AppAssets.images.logo))),
            TextField(
              onChanged: (value) => LoginScreenModelProvider.watch(context)?.model.email = value,
              decoration: InputDecoration(
                  errorText: LoginScreenModelProvider.watch(context)?.model.errorEmail,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child:  SvgPicture.asset(AppAssets.svg.user,width: 25,height: 25,),
                  ),
                  hintText: "Email",
                  hintStyle: AppStyles.s15w400,
                  fillColor: AppColors.loginField,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12.8)),
                )
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                onChanged: (value) => LoginScreenModelProvider.watch(context)?.model.password = value,
                obscureText: check,
                obscuringCharacter: '・',
                decoration: InputDecoration(
                  errorText: LoginScreenModelProvider.watch(context)?.model.errorPas,
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (check == true) {
                          check = false;
                        } else {
                          check = true;
                        }
                        LoginScreenModelProvider.watch(context)?.model.visibility = check;
                      },
                      icon: check ? SvgPicture.asset(AppAssets.svg.visibility): SvgPicture.asset(AppAssets.svg.closedEye),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SvgPicture.asset(AppAssets.svg.password,width: 25,height: 25,),
                    ),
                    hintText: "Password",
                    hintStyle: AppStyles.s15w400,
                    fillColor: AppColors.loginField,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12.8)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: ElevatedButton(
                  onPressed: () => LoginScreenModelProvider.read(context)?.model.nextPage(context),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fixedSize: const Size(300, 48)),
                  child: Text("Login",
                      style: AppStyles.s17w400.copyWith(color: Colors.white))),
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You don`t have account?',style: AppStyles.s15w400.copyWith(color: AppColors.textLogin),),
                  const SizedBox(width: 5,),
                  Text('Create',style: AppStyles.s15w400.copyWith(color: AppColors.mainBlue),),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

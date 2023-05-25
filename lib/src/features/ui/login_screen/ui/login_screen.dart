import 'package:bilim_all/constants/app_styles.dart';
import 'package:bilim_all/src/features/ui/login_screen/data/bloc/login_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../navigation/main_navigation.dart';
import '../../../shared_pref/shared_pref.dart';
import '../../bottom_persistent_bar/bottom_persistent_nav_bar.dart';
import 'login_screen_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final model = LoginScreenModel();
  @override
  Widget build(BuildContext context) {
    return _LoginScreenBody();
  }
}

class _LoginScreenBody extends StatelessWidget {
  _LoginScreenBody({Key? key}) : super(key: key);
  bool check = true;
  final modelSharedPref = SharedPrefModel();
  final logController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: modelSharedPref.loggedRead(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          if(snapshot.data.toString() == "Y") {
            return const ProvidedStylesExample();
          }
          else{
            return BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  final modelSharedPref = SharedPrefModel();
                  modelSharedPref.loggedWrite('Y');
                  Navigator.of(context).pushReplacementNamed(
                      MainNavigationRouteNames.mainNavBar);
                }
              },
              builder: (context, state) {
                if (state is LoginLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is LoginErrorState) {
                  return Center(
                    child: Text('${AppLocalizations
                        .of(context)
                        ?.somethingWentWrong}'),
                  );
                }
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
                            const SizedBox(
                              height: 63,
                            ),
                            Text('${AppLocalizations
                                .of(context)
                                ?.login}', style: AppStyles.s36w700mainBlue),
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 43),
                                child: Image(image: AssetImage(
                                    AppAssets.images.logo))),
                            TextField(
                              controller: logController,
                              onChanged: (value) =>
                              LoginScreenModelProvider
                                  .watch(context)
                                  ?.model
                                  .email =
                                  value,
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: SvgPicture.asset(
                                      AppAssets.svg.user,
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                  hintText: "${AppLocalizations
                                      .of(context)
                                      ?.email}",
                                  hintStyle: AppStyles.s15w400,
                                  fillColor: AppColors.loginField,
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12.8)),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: TextField(
                                controller: passController,
                                onChanged: (value) =>
                                LoginScreenModelProvider
                                    .watch(context)
                                    ?.model
                                    .password = value,
                                obscureText: check,
                                obscuringCharacter: '・',
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        if (check == true) {
                                          check = false;
                                        } else {
                                          check = true;
                                        }
                                      },
                                      icon: check
                                          ? SvgPicture.asset(
                                          AppAssets.svg.visibility)
                                          : SvgPicture.asset(
                                          AppAssets.svg.closedEye),
                                    ),
                                    prefixIcon: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 16),
                                      child: SvgPicture.asset(
                                        AppAssets.svg.password,
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                    hintText: "${AppLocalizations
                                        .of(context)
                                        ?.password}",
                                    hintStyle: AppStyles.s15w400,
                                    fillColor: AppColors.loginField,
                                    filled: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16.0,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(12.8)),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: ElevatedButton(
                                  onPressed: () =>
                                      context.read<LoginBloc>().add(
                                        LoginUserEvent(
                                            username: logController.text,
                                            password: passController.text),
                                      ),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      fixedSize: const Size(300, 48)),
                                  child: Text("${AppLocalizations
                                      .of(context)
                                      ?.login}",
                                      style: AppStyles.s17w400
                                          .copyWith(color: Colors.white))),
                            ),
                            InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${AppLocalizations
                                        .of(context)
                                        ?.dontAccount}',
                                    style: AppStyles.s15w400
                                        .copyWith(color: AppColors.textLogin),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${AppLocalizations
                                        .of(context)
                                        ?.create}',
                                    style: AppStyles.s15w400
                                        .copyWith(color: AppColors.mainBlue),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
              },
            );
          }
        }
        return const CircularProgressIndicator();
      }
    );
  }
}

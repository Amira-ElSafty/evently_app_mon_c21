import 'package:evently_app_mon_c21/core/utils/app_assets.dart';
import 'package:evently_app_mon_c21/core/utils/app_colors.dart';
import 'package:evently_app_mon_c21/core/utils/app_routes.dart';
import 'package:evently_app_mon_c21/core/utils/app_styles.dart';
import 'package:evently_app_mon_c21/core/utils/size_utils.dart';
import 'package:evently_app_mon_c21/firebase_utils.dart';
import 'package:evently_app_mon_c21/l10n/app_localizations.dart';
import 'package:evently_app_mon_c21/model/my_user.dart';
import 'package:evently_app_mon_c21/providers/app_theme_provider.dart';
import 'package:evently_app_mon_c21/providers/user_provider.dart';
import 'package:evently_app_mon_c21/ui/common/widgets/custom_elevated_button.dart';
import 'package:evently_app_mon_c21/ui/common/widgets/custom_text_field.dart';
import 'package:evently_app_mon_c21/ui/common/widgets/dialog_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController(text: "Amira");

  var emailController = TextEditingController(text: 'amira@route.com');

  var passwordController = TextEditingController(text: '123456');

  var rePasswordController = TextEditingController(text: '123456');

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: height * 0.02,
                children: [
                  Image.asset(
                    themeProvider.isDark
                        ? AppAssets.logoDarkImage
                        : AppAssets.logoLightImage,
                  ),
                  Text(
                    AppLocalizations.of(context)!.create_your_account,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  CustomTextField(
                    filled: true,
                    fillColor: Theme.of(context).highlightColor,
                    hintText: AppLocalizations.of(context)!.please_enter_name,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    prefixIcon: Icon(
                      Icons.person_2_outlined,
                      color: AppColors.lightGreyColor,
                      size: 25,
                    ),
                    controller: nameController,
                    validator: (text) {
                      //todo: validation
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter Name";
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    filled: true,
                    fillColor: Theme.of(context).highlightColor,
                    hintText: AppLocalizations.of(context)!.please_enter_email,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.lightGreyColor,
                      size: 25,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (text) {
                      //todo: validation
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter Email.";
                      }
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(text);

                      if (!emailValid) {
                        return "Please enter a valid Email";
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    filled: true,
                    fillColor: Theme.of(context).highlightColor,
                    hintText: AppLocalizations.of(
                      context,
                    )!.please_enter_password,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.lightGreyColor,
                      size: 25,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_off_outlined,
                      color: AppColors.lightGreyColor,
                      size: 25,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obscureText: true,
                    validator: (text) {
                      //todo: validation
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter Password";
                      }
                      if (text.length < 6) {
                        return "Password should be at least 6 chars.";
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    filled: true,
                    fillColor: Theme.of(context).highlightColor,
                    hintText: AppLocalizations.of(
                      context,
                    )!.please_enter_rePassword,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.lightGreyColor,
                      size: 25,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_off_outlined,
                      color: AppColors.lightGreyColor,
                      size: 25,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    controller: rePasswordController,
                    obscureText: true,
                    validator: (text) {
                      //todo: validation
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter Re-Password";
                      }
                      if (text != passwordController.text) {
                        return "Re-Password doesn't match password.";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.01),
                  CustomElevatedButton(
                    onPressed: () {
                      //todo: signUp
                      register();
                    },
                    verticalPadding: height * 0.01,
                    child: Text(
                      AppLocalizations.of(context)!.sign_up,
                      style: AppStyles.medium20White,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.already_have_account,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextButton(
                        onPressed: () {
                          //todo: navigate to login screen
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).primaryColor,
                                decorationThickness: 2,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Theme.of(context).dividerColor,
                          indent: width * 0.02,
                          endIndent: width * 0.04,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Theme.of(context).dividerColor,
                          indent: width * 0.04,
                          endIndent: width * 0.02,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  CustomElevatedButton(
                    onPressed: () {
                      //todo: signup with google
                    },
                    backgroundColor: Theme.of(context).highlightColor,
                    borderColor: Theme.of(context).dividerColor,
                    verticalPadding: height * 0.02,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: width * 0.04,
                      children: [
                        Image.asset(AppAssets.googleLogo),
                        Text(
                          AppLocalizations.of(context)!.sign_up_with_google,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formKey.currentState?.validate() == true) {
      //todo: register
      try {
        //todo: show loading
        DialogUtils.showLoading(context: context, loadingMessage: 'Waiting...');
        //todo: create user in firebase Auth
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        //todo: save user in firestore
        MyUser myUser = MyUser(
          id: credential.user?.uid ?? '',
          name: nameController.text,
          email: emailController.text,
        );
        //todo: save user in provider
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(myUser);
        await FirebaseUtils.addUserInFireStore(myUser);
        //todo: hide loading
        DialogUtils.hideLoading(context: context);
        //todo: show message
        DialogUtils.showMessage(
          context: context,
          message: 'Register successfully.',
          title: 'Success',
          posActionName: 'Ok',
          onPosAction: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.homeRouteName);
          },
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          //todo: hide loading
          DialogUtils.hideLoading(context: context);
          //todo: show message
          DialogUtils.showMessage(
            context: context,
            message: 'The password provided is too weak.',
            title: 'Error',
            posActionName: 'Ok',
          );
        } else if (e.code == 'email-already-in-use') {
          //todo: hide loading
          DialogUtils.hideLoading(context: context);
          //todo: show message
          DialogUtils.showMessage(
            context: context,
            message: 'The account already exists for that email.',
            title: 'Error',
            posActionName: 'Ok',
          );
        } else if (e.code == 'network-request-failed') {
          //todo: hide loading
          DialogUtils.hideLoading(context: context);
          //todo: show message
          DialogUtils.showMessage(
            context: context,
            message: 'No Internet connection.',
            title: 'Error',
            posActionName: 'Ok',
          );
        }
      } catch (e) {
        //todo: hide loading
        DialogUtils.hideLoading(context: context);
        //todo: show message
        DialogUtils.showMessage(
          context: context,
          message: e.toString(),
          title: 'Error',
          posActionName: 'Ok',
        );
      }
    }
  }
}

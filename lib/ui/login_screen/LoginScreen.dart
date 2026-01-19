import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/core/resources/Validation.dart';
import 'package:evently/core/reusable/Custom_field.dart';
import 'package:evently/core/reusable/Custome_button.dart';
import 'package:evently/ui/ForgetPass/ForgetPass.dart';
import 'package:evently/ui/home/homeScreen.dart';
import 'package:evently/ui/signup/Signup.dart';
import 'package:flutter/material.dart';

import '../../core/resources/AssetsManager.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static const String routeName = "Login";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passController;

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsManager.logo,
          height: 27,
          fit: BoxFit.fitHeight,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: widget.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringsManager.loginTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 24),
                CustomField(
                  validation: Validation.validateEmail,
                  prefixIcon: AssetsManager.email,
                  hint: StringsManager.enterYourEmail,
                  Controller: emailController,
                ),
                SizedBox(height: 24),
                CustomField(
                  validation: Validation.validatePass,
                  prefixIcon: AssetsManager.lockPass,
                  hint: StringsManager.enterYourPassword,
                  Controller: passController,
                  suffixIcon: AssetsManager.invisiblePass,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ForgetPass.routeName);
                    },
                    child: Text(
                      StringsManager.forgetPasswordAsk,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: CustomeButton(
                    text: StringsManager.loginBtn,
                    onclick: () {
                      login();
                    },
                  ),
                ),
                SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringsManager.donNotHaveAccount,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          SignupScreen.routeName,
                        );
                      },
                      child: Text(
                        StringsManager.signupText,
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge?.copyWith(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSecondaryContainer,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          StringsManager.or,
                          style: Theme.of(context).textTheme.displayLarge
                              ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSecondaryContainer,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Container(
                  height: 48,
                  width: double.infinity,
                  child: CustomeButton(
                    logo: AssetsManager.google,
                    text: StringsManager.loginWithGoogle,
                    onclick: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if(widget.formKey.currentState?.validate() ?? false ){
      Navigator.pushReplacementNamed(context, Homescreen.routeName);
    }
  }
}

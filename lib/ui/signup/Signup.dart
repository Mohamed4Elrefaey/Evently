import 'package:evently/ui/login_screen/LoginScreen.dart';
import 'package:flutter/material.dart';

import '../../core/resources/AssetsManager.dart';
import '../../core/resources/StringsManager.dart';
import '../../core/resources/Validation.dart';
import '../../core/reusable/Custom_field.dart';
import '../../core/reusable/Custome_button.dart';
import '../home/homeScreen.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  static const String routeName = "Signup";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController nameController;

  late TextEditingController emailController;

  late TextEditingController passController;

  late TextEditingController confirmPassController;

  @override
  void initState() {
    // TODO: implement initState
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    confirmPassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
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
                  StringsManager.signupTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 24),
                CustomField(
                  validation: Validation.validateName,
                  prefixIcon: AssetsManager.user,
                  hint: StringsManager.enterYourName,
                  Controller: emailController,
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
                SizedBox(height: 24),
                CustomField(
                  validation: (value) {
                    return Validation.validateConfirmPass(
                      value,
                      passController.text,
                    );
                  },
                  prefixIcon: AssetsManager.lockPass,
                  hint: StringsManager.confirmPassword,
                  Controller: confirmPassController,
                  suffixIcon: AssetsManager.invisiblePass,
                ),
                SizedBox(height: 48),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: CustomeButton(
                    text: StringsManager.signupBtn,
                    onclick: () {
                      signup();
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
                          LoginScreen.routeName,
                        );
                      },
                      child: Text(
                        StringsManager.loginText,
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
                    text: StringsManager.signupWithGoogle,
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

  void signup() {
    if(widget.formKey.currentState?.validate() ?? false ){
      Navigator.pushReplacementNamed(context, Homescreen.routeName);
    }
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/Firebase/firestore_manager.dart';
import 'package:evently/core/resources/DialogUtils.dart';
import 'package:evently/models/User.dart' as MyUser;
import 'package:evently/ui/login_screen/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/User_provider.dart';
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
                  StringsManager.signupTitle.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 24),
                CustomField(
                  validation: Validation.validateName,
                  prefixIcon: AssetsManager.user,
                  hint: StringsManager.enterYourName.tr(),
                  controller: nameController,
                ),
                SizedBox(height: 24),
                CustomField(
                  validation: Validation.validateEmail,
                  prefixIcon: AssetsManager.email,
                  hint: StringsManager.enterYourEmail.tr(),
                  controller: emailController,
                ),
                SizedBox(height: 24),
                CustomField(
                  isPass: true,
                  validation: Validation.validatePass,
                  prefixIcon: AssetsManager.lockPass,
                  hint: StringsManager.enterYourPassword.tr(),
                  controller: passController,
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
                  hint: StringsManager.confirmPassword.tr(),
                  controller: confirmPassController,
                  suffixIcon: AssetsManager.invisiblePass,
                  isPass: true,
                ),
                SizedBox(height: 48),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: CustomeButton(
                    text: StringsManager.signupBtn.tr(),
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
                      StringsManager.donNotHaveAccount.tr(),
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
                        StringsManager.loginText.tr(),
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
                          StringsManager.or.tr(),
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
                    text: StringsManager.signupWithGoogle.tr(),
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

  void signup() async {
    if (widget.formKey.currentState?.validate() ?? false) {
      try {
        DialogUtils.loadingDialog(context: context);
        UserCredential credential = await FirebaseAuth
            .instance // singleton
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passController.text,
            );
        final newUser = MyUser.User(
          id: credential.user!.uid,
          email: emailController.text,
          name: nameController.text
        );
        // add user to database
        await FirestoreManager.addUser(
          userId: credential.user!.uid,
          user: newUser
        );
        // context.read<UserProvider>().setUser(newUser);
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, Homescreen.routeName);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context); //to close loading dialog
        if (e.code == "weak-password") {
          DialogUtils.massageDialog(
            context: context,
            massage: "The password is too weak.",
          );
        } else if (e.code == "email-already-in-use") {
          DialogUtils.massageDialog(
            context: context,
            massage: "The account already exists for that email.",
          );
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}

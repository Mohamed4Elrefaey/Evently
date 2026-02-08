import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/DialogUtils.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/core/resources/Validation.dart';
import 'package:evently/core/reusable/CustomAppBar.dart';
import 'package:evently/core/reusable/Custom_field.dart';
import 'package:evently/core/reusable/Custome_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/resources/AssetsManager.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  static const String routeName = "ForgetPass";

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  late TextEditingController controller;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: Text(
          StringsManager.forgetPasswordTitle.tr(),
          style: Theme
              .of(
            context,
          )
              .textTheme
              .headlineLarge
              ?.copyWith(fontSize: 18),
        ),
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Image.asset(AssetsManager.forgetPass),
                SizedBox(height: 32),
                CustomField(
                  prefixIcon: AssetsManager.email,
                  validation: Validation.validateEmail,
                  hint: StringsManager.enterYourEmail,
                  controller: controller,
                ),
                SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 48,
                  child: CustomeButton(
                    text: StringsManager.resetPasswordBtn.tr(),
                    onclick: resetPass,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void resetPass() async {
    if (formKey.currentState!.validate()) {
      try {
        DialogUtils.loadingDialog(context: context);
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: controller.text,
        );
        Navigator.pop(context);
        DialogUtils.showToast(
            "mail sent successfully please check your email", context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == "user-not-found") {
          DialogUtils.massageDialog(
            context: context,
            massage: "no user for that email",
          );
        } else {
          DialogUtils.massageDialog(
            context: context,
            massage: e.message ?? "Something went wrong",
          );
        }
      } catch (e) {
        Navigator.pop(context);
        DialogUtils.massageDialog(context: context, massage: e.toString());
      }
    }
  }
}

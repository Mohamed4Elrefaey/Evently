import 'package:evently/models/OnboardingModel.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {
  final OnboardingModel model;

  ContentPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.4,
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          model.image,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}

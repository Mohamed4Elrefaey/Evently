import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomField extends StatefulWidget {
  String hint;
  final TextEditingController controller;
  String? prefixIcon;
  bool? isPass;
  String? suffixIcon;
  int maxLines;
  ValueChanged<String>? onChange  ;

  String? Function(String?)? validation;

  CustomField({
    this.maxLines = 1,
    required this.validation,
    required this.hint,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isPass = false,
    this.onChange
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:  widget.onChange ,
      controller: widget.controller,
      maxLines: widget.maxLines,
      validator: widget.validation,
      obscureText: widget.isPass == false ? false : !isVisible,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.primaryContainer,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        hintText: widget.hint.tr(),
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontSize: 14),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 40,
          minHeight: 40,
          maxWidth: 40,
          minWidth: 40,
        ),
        prefixIcon:
            widget.prefixIcon != null && context.locale.languageCode != 'ar'
            ? Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SvgPicture.asset(widget.prefixIcon!),
              )
            : widget.prefixIcon != null && context.locale.languageCode == 'ar'
            ? Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset(widget.prefixIcon!),
              )
            : null,

        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: SvgPicture.asset(
                  isVisible ? AssetsManager.invisibleOn : widget.suffixIcon!,
                  width: 24,
                  height: 24,
                ),
              )
            : null,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

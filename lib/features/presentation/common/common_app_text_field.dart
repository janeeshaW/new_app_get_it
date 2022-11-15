import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/services/dependency_injection.dart';
import 'package:news_app/core/util/app_colors.dart';
import 'package:news_app/core/util/app_validations.dart';
import 'package:news_app/core/util/enums.dart';



class CommonAppTextField extends StatefulWidget {
  final TextEditingController controller;
  final Widget? icon;
  final Widget? prefixWidget;
  final Widget? action;
  final String? hint;
  final String? label;
  final Color? labelColor;
  final Color? hintColor;
  final ValidationType validationType;
  final bool isObscure;

  const CommonAppTextField(
      {
      required this.controller,
      this.prefixWidget,
      this.label,
      this.icon,
      this.action,
      this.hint,
      this.labelColor,
      this.hintColor,
      this.isObscure = false,
      required this.validationType});

  @override
  State<CommonAppTextField> createState() => _CommonAppTextFieldState();
}

class _CommonAppTextFieldState extends State<CommonAppTextField> {
  final validator = injection<AppValidations>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Wrap(
                children: [
                  SizedBox(
                    width: 18.w,
                  ),
                  Text(
                    widget.label!,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: widget.labelColor ?? AppColors.appColorBlack,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            : const SizedBox.shrink(),
        widget.label != null
            ? const SizedBox(
                height: 2,
              )
            : const SizedBox.shrink(),
        Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              height: 40.h,
              child: TextFormField(
                validator: (text) {
                  if (widget.validationType == ValidationType.EMAIL) {
                    return validator.emailValidation(text);
                  } else if (widget.validationType == ValidationType.NORMAL) {
                    return validator.normalTextValidation(text);
                  } else if (widget.validationType == ValidationType.PW) {
                    return validator.passwordValidation(text);
                  } else if (widget.validationType == ValidationType.MOBILE) {
                    return validator.mobileValidation(text);
                  }
                  return null;
                },
                controller: widget.controller,
                obscureText: widget.isObscure,
                textInputAction: TextInputAction.done,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                    prefix: widget.prefixWidget,
                    contentPadding: const EdgeInsets.all(16),
                    hintText: widget.hint,
                    counterText: "",
                    prefixIcon: widget.icon,
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 55,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                        color: AppColors.colorSecondary,
                      ),
                    ),
                    suffixIcon: widget.action,
                    filled: true,
                    hintStyle: TextStyle(
                        color: widget.hintColor ?? AppColors.appGrayColor,
                        fontSize: 14.sp),
                    fillColor: AppColors.appColorWhite),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

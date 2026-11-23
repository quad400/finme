import 'package:finme/core/constants/app_icons.dart';
import 'package:finme/core/router/app_routes.dart';
import 'package:finme/core/shared/widget/app_text_form_field.dart';
import 'package:finme/core/shared/widget/app_button.dart';
import 'package:finme/core/theme/app_dimensions.dart';
import 'package:finme/core/theme/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:finme/core/theme/app_theme.dart';
import 'package:finme/core/theme/app_color.dart';
import 'package:finme/features/auth/presentation/widgets/login_header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if(!_formKey.currentState!.validate()) return;

  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.overlayOnDark,
      sized: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            LoginHeader(),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingMd,
                ),
                decoration: BoxDecoration(color: AppColors.white),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.only(top: AppDimensions.paddingXl),
                    children: [
                      AppTextFormField(
                        controller: _emailController,
                        hint: "Enter Email Address",
                        keyboardType: TextInputType.emailAddress,
                        label: "Email Address",
                        prefixIcon: AppIcons.email,
                      ),
                      SizedBox(height: AppDimensions.padding),
                      AppTextFormField(
                        controller: _passwordController,
                        hint: "Enter 6-digit Password",
                        keyboardType: TextInputType.emailAddress,
                        label: "Email Address",
                        prefixIcon: AppIcons.email,
                        isPassword: true,
                      ),
                      SizedBox(height: AppDimensions.padding),
                      RichText(
                        text: TextSpan(
                          text: 'Forget Password? ',
                          style: AppTextStyle.bodySmall,
                  
                          children: [
                            TextSpan(
                              text: "Reset",
                              style: AppTextStyle.bodySmall.copyWith(
                                color: AppColors.primary500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    context.push(AppRoutes.forgetPassword),
                            ),
                          ],
                        ),
                      ),
                  
                      Padding(
                        padding: const EdgeInsets.only(
                          top: AppDimensions.paddingXxl,
                        ),
                        child: Row(
                          spacing: AppDimensions.paddingXs,
                          children: [
                            Expanded(
                              child: AppButton(
                                label: "Login",
                                onPressed: _onSubmit,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.fingerprint,
                                color: AppColors.primary500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: AppDimensions.padding,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: "Not yet a user? ",
                              style: AppTextStyle.bodySmall,
                              children: [
                                TextSpan(
                                  style: AppTextStyle.labelMedium.copyWith(
                                    color: AppColors.primary500,
                                  ),
                                  text: "Create Account",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        context.push(AppRoutes.createAccount),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

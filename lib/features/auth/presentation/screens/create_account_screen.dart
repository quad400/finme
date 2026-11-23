import 'package:finme/core/shared/widget/app_header.dart';
import 'package:finme/core/shared/widget/app_text_form_field.dart';
import 'package:finme/core/shared/widget/custom_app_bar.dart';
import 'package:finme/core/shared/widget/app_button.dart';
import 'package:finme/core/theme/app_color.dart';
import 'package:finme/core/theme/app_dimensions.dart';
import 'package:finme/core/utils/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    final email = _emailController.text.trim();
    if (email.isEmpty) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.padding,
          ),
          child: Form(
            child: Column(
              spacing: AppDimensions.paddingXl,
              children: [
                AppHeader(
                  title: "Create Account",
                  subtitle: "Enter yout email address to begin creating your Pillarpay account",
                ),
                AppTextFormField(
                  controller: _emailController,
                  label: "Email",
                  validator: AppValidator.email,
                  keyboardType: TextInputType.emailAddress,
                  hint: "Enter your email address",
                ),

                AppButton(label: "Continue", onPressed: _submit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

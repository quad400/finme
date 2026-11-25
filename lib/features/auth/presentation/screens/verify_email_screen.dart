import 'package:finme/core/router/app_routes.dart';
import 'package:finme/core/shared/widget/app_header.dart';
import 'package:finme/core/shared/widget/app_text_form_field.dart';
import 'package:finme/core/shared/widget/custom_app_bar.dart';
import 'package:finme/core/shared/widget/app_button.dart';
import 'package:finme/core/theme/app_color.dart';
import 'package:finme/core/theme/app_dimensions.dart';
import 'package:finme/core/utils/app_validator.dart';
import 'package:finme/features/auth/presentation/notifier/verify_email_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends ConsumerState<VerifyEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();

    await ref
        .read(verifyEmailProvider.notifier)
        .verifyEmail(_emailController.text.trim());

    if(!mounted) return;
        
    context.go(AppRoutes.forgetPassword);
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
            key: _formKey,
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

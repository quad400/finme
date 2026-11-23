import 'package:finme/core/theme/app_color.dart';
import 'package:finme/core/theme/app_dimensions.dart';
import 'package:finme/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final String? prefixIcon;
  final bool isPassword;

  final TextInputType? keyboardType;
  final String? errorText;
  final String? Function(String?)? validator;

  const new({
    super.key,
    required this.controller,
    this.hint,
    this.label,
    this.prefixIcon,
    this.errorText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  });
  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool _obscureText = widget.isPassword;

  void _toggleObscureText() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppDimensions.paddingXs,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(widget.label!, style: AppTextStyle.labelMedium),
        TextFormField(
          autocorrect: false,
          cursorColor: AppColors.primary500,
          cursorErrorColor: AppColors.error500,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          validator: widget.validator,

          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon != null
                ? SizedBox(
                    height: AppDimensions.iconLg,
                    width: AppDimensions.iconLg,
                    child: Center(
                      child: SvgPicture.asset(
                        widget.prefixIcon!,
                        height: AppDimensions.iconSm,
                        width: AppDimensions.iconSm,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : null,
            suffixIcon: widget.isPassword
                ? InkWell(
                    onTap: _toggleObscureText,
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.neutral100,
                        size: AppDimensions.icon,
                      ),
                    ),
                  )
                : null,
          ),
          // decoration: InputDecoration(),
        ),
      ],
    );
  }
}

import 'package:ecom1_frontend/utils/app_text_styles.dart';
import 'package:ecom1_frontend/view/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Reset Password",
                style: AppTextStyle.withColor(
                  AppTextStyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Enter your email address to reset your password",
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLargeText,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
              const SizedBox(height: 40),

              // email textfield
              CustomTextField(
                label: "Email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!GetUtils.isEmail(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => showSuccessDialog(context),
                  child: Text(
                    "Send Reset Link",
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMediumText,
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// showSuccessDialog

void showSuccessDialog(BuildContext context) {
  Get.dialog(
    AlertDialog(
      title: Text("Check your emails", style: AppTextStyle.h3),
      content: Text(
        "We have sent password recovery instructions to your email",
        style: AppTextStyle.bodyMediumText,
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "Ok",
            style: AppTextStyle.withColor(
              AppTextStyle.bodyMediumText,
              Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    ),
  );
}

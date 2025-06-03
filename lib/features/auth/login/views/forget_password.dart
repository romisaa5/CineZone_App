import 'package:cinezone_app/core/helper/validation_methods.dart';
import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:cinezone_app/core/widgets/custom_button.dart';
import 'package:cinezone_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.yellowcolor),
        ),
        centerTitle: true,
        title: Text(
          'Forget Password',
          style: Styles.textStyle14.copyWith(color: AppColors.yellowcolor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 15.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/Forgot_password.png'),
            AppTextFormField(
              onChanged: (value) {
                email = value;
              },
              controller: emailController,
              prefixIcon: Icon(Icons.email),
              hintText: 'Email',
              validator: (value) => ValidationMethods.validateEmail(value),
            ),
            CustomButton(
              text: 'Verify Email',
              color: AppColors.yellowcolor,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cinezone_app/core/helper/validation_methods.dart';
import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:cinezone_app/core/utils/app_router.dart';
import 'package:cinezone_app/core/widgets/custom_button.dart';
import 'package:cinezone_app/core/widgets/custom_text_form_field.dart';
import 'package:cinezone_app/features/auth/login/widgets/custom_devider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  String? email;
  String? password;
  bool isshown = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formkey,
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80.h),
                Image.asset('assets/images/logo.png', height: 75, width: 75),
                SizedBox(height: 20.h),
                AppTextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  controller: emailController,
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Email',
                  validator: (value) => ValidationMethods.validateEmail(value),
                ),
                AppTextFormField(
                  maxLines: 1,
                  isObscureText: isshown,
                  onChanged: (value) {
                    password = value;
                  },
                  controller: passwordController,
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Password',
                  validator:
                      (value) => ValidationMethods.validatePassword(value),
                  suffixIcon:
                      isshown
                          ? IconButton(
                            onPressed: () {
                              setState(() {
                                isshown = !isshown;
                              });
                            },
                            icon: Icon(Icons.visibility),
                          )
                          : IconButton(
                            onPressed: () {
                              setState(() {
                                isshown = !isshown;
                              });
                            },
                            icon: Icon(Icons.visibility_off),
                          ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.forgetPassword);
                    },
                    child: Text(
                      'Forget Password ?',
                      style: Styles.textStyle12.copyWith(
                        color: AppColors.yellowcolor,
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      try {
                        UserCredential user = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                              email: email!.trim(),
                              password: password!.trim(),
                            );
                        GoRouter.of(
                          context,
                        ).pushReplacement(AppRouter.homeview);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'user-not-found') {
                        } else if (ex.code == 'wrong-password') {
                        } else {}
                      }
                    }
                  },
                  text: 'Login',
                  color: AppColors.yellowcolor,
                  width: double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t Have Account ?', style: Styles.textStyle12),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.registerView);
                      },
                      child: Text(
                        ' Create One',
                        style: Styles.textStyle12.copyWith(
                          color: AppColors.yellowcolor,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomDevider(),
                SizedBox(height: 10.h),
                CustomButton(
                  image: 'assets/images/google.png',
                  text: 'Login With Google',
                  color: AppColors.yellowcolor,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
import 'package:google_sign_in/google_sign_in.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final formkey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  String? email;
  String? password;
  String? name;
  String? confirmPassword;
  bool isshown = true;
  bool isshownconfirm = true;
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
                    name = value;
                  },
                  controller: nameController,
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Name',
                  validator:
                      (value) => ValidationMethods.validateUsername(value),
                ),
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
                AppTextFormField(
                  maxLines: 1,
                  isObscureText: isshownconfirm,
                  onChanged: (value) {
                    confirmPassword = value;
                  },
                  controller: confirmpasswordController,
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Confirm Password',
                  validator:
                      (value) =>
                          ValidationMethods.validateConfirmPassword(value),
                  suffixIcon:
                      isshownconfirm
                          ? IconButton(
                            onPressed: () {
                              setState(() {
                                isshownconfirm = !isshownconfirm;
                              });
                            },
                            icon: Icon(Icons.visibility),
                          )
                          : IconButton(
                            onPressed: () {
                              setState(() {
                                isshownconfirm = !isshownconfirm;
                              });
                            },
                            icon: Icon(Icons.visibility_off),
                          ),
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      final user = FirebaseAuth.instance.currentUser;
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );
                        GoRouter.of(context).push(AppRouter.emailVerifiedView);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  text: 'Create Account',
                  color: AppColors.yellowcolor,
                  width: double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have Account ? ', style: Styles.textStyle12),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.loginView);
                      },
                      child: Text(
                        ' Login',
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
                  onTap: () {
                    Future<UserCredential> signInWithGoogle() async {
                      final GoogleSignInAccount? googleUser =
                          await GoogleSignIn().signIn();
                      final GoogleSignInAuthentication? googleAuth =
                          await googleUser?.authentication;
                      final credential = GoogleAuthProvider.credential(
                        accessToken: googleAuth?.accessToken,
                        idToken: googleAuth?.idToken,
                      );
                      return await FirebaseAuth.instance.signInWithCredential(
                        credential,
                      );
                    }
                  },
                  image: 'assets/images/google.png',
                  text: 'Register With Google',
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

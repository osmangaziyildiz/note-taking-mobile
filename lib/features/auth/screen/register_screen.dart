import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notetakingapp/core/router/app_router.dart';
import 'package:notetakingapp/features/auth/widgets/auth_button.dart';
import 'package:notetakingapp/features/auth/widgets/auth_divider.dart';
import 'package:notetakingapp/features/auth/widgets/auth_text_field.dart';
import 'package:notetakingapp/features/auth/widgets/social_auth_button.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Back Button and Title
                Row(
                  children: [
                    IconButton(
                      onPressed: () => context.router.pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Create Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 27.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 48.w,
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Subtitle
                Text(
                  'Sign up to start taking notes.',
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(height: 40.h),

                // Social Auth Buttons
                SocialAuthButton(
                  iconPath: 'assets/icons/google_icon.png',
                  label: 'Continue with Google',
                  onPressed: () {
                    // TODO: Implement Google Sign In
                  },
                ),

                SizedBox(height: 16.h),

                SocialAuthButton(
                  iconPath: 'assets/icons/apple_icon.png',
                  label: 'Continue with Apple',
                  onPressed: () {
                    // TODO: Implement Apple Sign In
                  },
                ),

                SizedBox(height: 32.h),

                // Divider
                const AuthDivider(),

                SizedBox(height: 32.h),

                // Name Field
                AuthTextField(
                  controller: _nameController,
                  hintText: 'Full Name (Optional)',
                  keyboardType: TextInputType.name,
                ),

                SizedBox(height: 16.h),

                // Email Field
                AuthTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  //validator: ,
                ),

                SizedBox(height: 16.h),

                // Password Field
                AuthTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: !_isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                 // validator:,
                ),

                SizedBox(height: 16.h),

                // Confirm Password Field
                AuthTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: !_isConfirmPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                  //validator: ,
                ),

                SizedBox(height: 32.h),

                // Sign Up Button
                AuthButton(
                  text: 'Sign Up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Implement sign up logic
                    }
                  },
                ),

                SizedBox(height: 32.h),

                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.router.push(const LoginRoute());
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

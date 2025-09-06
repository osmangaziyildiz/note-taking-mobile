import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notetakingapp/core/router/app_router.dart';
import 'package:notetakingapp/core/theme/app_colors.dart';
import 'package:notetakingapp/core/utils/snackbar_helper.dart';
import 'package:notetakingapp/core/widgets/theme_toggle_button.dart';
import 'package:notetakingapp/features/auth/bloc/login/login_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/login/login_event.dart';
import 'package:notetakingapp/features/auth/bloc/login/login_state.dart';
import 'package:notetakingapp/features/auth/widgets/auth_button.dart';
import 'package:notetakingapp/features/auth/widgets/auth_divider.dart';
import 'package:notetakingapp/features/auth/widgets/auth_text_field.dart';
import 'package:notetakingapp/features/auth/widgets/social_auth_button.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.singleTimeEvent != null) {
                  state.singleTimeEvent!.when(
                    navigateToHome: () {
                      context.router.replaceAll([const HomeRoute()]);
                      context.read<LoginBloc>().clearSingleTimeEvent();
                    },
                    showErrorDialog: (message) {
                      SnackbarHelper.showError(
                        context: context,
                        title: 'Login Failed',
                        message: message,
                      );
                      context.read<LoginBloc>().clearSingleTimeEvent();
                    },
                  );
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Column(
                    children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: ThemeToggleButton(),
                ),

                SizedBox(height: 16.h),

                // Welcome Back Title
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8.h),

                // Subtitle
                Text(
                  'Sign in to continue to your notes.',
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
                    context.read<LoginBloc>().add(
                      const LoginEvent.signInWithGooglePressed(),
                    );
                  },
                ),

                SizedBox(height: 16.h),
                
                
                // Maybe implement Apple Sign In for iOS later

                /* SocialAuthButton(
                  iconPath: 'assets/icons/apple_icon.png',
                  label: 'Continue with Apple',
                  onPressed: () {
                  },
                ), */

                SizedBox(height: 32.h),

                // Divider
                const AuthDivider(),

                SizedBox(height: 32.h),

                // Email Field
                AuthTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  errorText: state.emailError,
                  onChanged: (value) {
                    context.read<LoginBloc>().add(LoginEvent.emailChanged(value));
                  },
                  validator: (value) => state.emailError,
                ),

                SizedBox(height: 16.h),

                // Password Field
                AuthTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: !_isPasswordVisible,
                  errorText: state.passwordError,
                  onChanged: (value) {
                    context.read<LoginBloc>().add(LoginEvent.passwordChanged(value));
                  },
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
                  validator: (value) => state.passwordError,
                ),

                SizedBox(height: 8.h),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Implement forgot password
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 32.h),

                // Login Button
                AuthButton(
                  text: 'Login',
                  isLoading: state.isLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginBloc>().add(
                        const LoginEvent.submitPressed(),
                      );
                    }
                  },
                ),

                SizedBox(height: 32.h),

                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.router.push(const RegisterRoute());
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

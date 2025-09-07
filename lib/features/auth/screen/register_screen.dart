import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notetakingapp/core/di/service_locator.dart';
import 'package:notetakingapp/core/router/app_router.dart';
import 'package:notetakingapp/features/auth/bloc/register/register_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/register/register_event.dart';
import 'package:notetakingapp/features/auth/bloc/register/register_state.dart';
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
    return BlocProvider(
      create: (context) => sl.get<RegisterBloc>(),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          state.singleTimeEvent?.when(
            showErrorDialog: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error)),
              );
              context.read<RegisterBloc>().clearSingleTimeEvent();
            },
            showSuccessDialog: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.green,
                ),
              );
              context.read<RegisterBloc>().clearSingleTimeEvent();
            },
            navigateToHome: () {
              context.router.replaceAll([const HomeRoute()]);
            },
            navigateToLogin: () {
              context.router.replaceAll([const LoginRoute()]);
            },
            navigateToEmailVerification: () {
              context.router.push(const EmailVerificationRoute());
            },
          );
        },
        child: Scaffold(
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
                     BlocBuilder<RegisterBloc, RegisterState>(
                       builder: (context, state) {
                         return SocialAuthButton(
                           iconPath: 'assets/icons/google_icon.png',
                           label: 'Continue with Google',
                           onPressed: state.isLoading
                               ? () {}
                               : () {
                                   context.read<RegisterBloc>().add(
                                     const RegisterEvent.signInWithGooglePressed(),
                                   );
                                 },
                         );
                       },
                     ),

                    SizedBox(height: 16.h),

                    // Maybe implement Apple Sign In for iOS later
                    /* SocialAuthButton(
                      iconPath: 'assets/icons/apple_icon.png',
                      label: 'Continue with Apple',
                      onPressed: () {
                        // TODO: Implement Apple Sign In
                      },
                    ), */

                    SizedBox(height: 32.h),

                    // Divider
                    const AuthDivider(),

                    SizedBox(height: 32.h),

                     // Name Field
                     BlocBuilder<RegisterBloc, RegisterState>(
                       builder: (context, state) {
                         return AuthTextField(
                           controller: _nameController,
                           hintText: 'Full Name (Optional)',
                           keyboardType: TextInputType.name,
                           errorText: state.nameError,
                           onChanged: (value) {
                             context.read<RegisterBloc>().add(
                               RegisterEvent.nameChanged(value),
                             );
                           },
                         );
                       },
                     ),

                    SizedBox(height: 16.h),

                    // Email Field
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return AuthTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          errorText: state.emailError,
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(
                              RegisterEvent.emailChanged(value),
                            );
                          },
                        );
                      },
                    ),

                    SizedBox(height: 16.h),

                    // Password Field
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return AuthTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          obscureText: !_isPasswordVisible,
                          errorText: state.passwordError,
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(
                              RegisterEvent.passwordChanged(value),
                            );
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
                        );
                      },
                    ),

                    SizedBox(height: 16.h),

                    // Confirm Password Field
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return AuthTextField(
                          controller: _confirmPasswordController,
                          hintText: 'Confirm Password',
                          obscureText: !_isConfirmPasswordVisible,
                          errorText: state.confirmPasswordError,
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(
                              RegisterEvent.confirmPasswordChanged(value),
                            );
                          },
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible =
                                    !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 32.h),

                     // Sign Up Button
                     BlocBuilder<RegisterBloc, RegisterState>(
                       builder: (context, state) {
                         return AuthButton(
                           text: 'Sign Up',
                           isLoading: state.isLoading,
                           onPressed: state.isFormValid && !state.isLoading
                               ? () {
                                   context.read<RegisterBloc>().add(
                                     const RegisterEvent.submitPressed(),
                                   );
                                 }
                               : () {},
                         );
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
        ),
      ),
    );
  }
}

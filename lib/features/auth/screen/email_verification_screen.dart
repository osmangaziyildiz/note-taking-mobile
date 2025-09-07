import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notetakingapp/core/di/service_locator.dart';
import 'package:notetakingapp/core/router/app_router.dart';
import 'package:notetakingapp/core/utils/snackbar_helper.dart';
import 'package:notetakingapp/features/auth/bloc/register/register_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/register/register_event.dart';
import 'package:notetakingapp/features/auth/bloc/register/register_state.dart';

@RoutePage()
class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<RegisterBloc>(),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          state.singleTimeEvent?.when(
            showErrorDialog: (message) {
              SnackbarHelper.showError(
                context: context,
                title: 'Error',
                message: message,
              );
              context.read<RegisterBloc>().clearSingleTimeEvent();
            },
            showSuccessDialog: (message) {
              SnackbarHelper.showSuccess(
                context: context,
                title: 'Success',
                message: message,
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
              // Already on email verification screen
            },
          );
        },
        child: Scaffold(
          backgroundColor: const Color(0xFF1E1E1E),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Email Icon
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE53E3E).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.email_outlined,
                      size: 50,
                      color: Color(0xFFE53E3E),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Title
                  const Text(
                    'Check Your Email',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),

                  // Description
                  Text(
                    'We\'ve sent a verification link to your email address. Please check your inbox and click the link to verify your account.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[400],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // Check Verification Button
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: state.isLoading
                              ? null
                              : () {
                                  context.read<RegisterBloc>().add(
                                    const RegisterEvent.checkEmailVerification(),
                                  );
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE53E3E),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: state.isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : const Text(
                                  'I\'ve Verified My Email',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Resend Email Button
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: OutlinedButton(
                          onPressed: state.isLoading
                              ? null
                              : () {
                                  context.read<RegisterBloc>().add(
                                    const RegisterEvent.sendEmailVerification(),
                                  );
                                },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFFE53E3E),
                            side: const BorderSide(
                              color: Color(0xFFE53E3E),
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Resend Verification Email',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  // Back to Login
                  TextButton(
                    onPressed: () {
                      context.router.replaceAll([const LoginRoute()]);
                    },
                    child: Text(
                      'Back to Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

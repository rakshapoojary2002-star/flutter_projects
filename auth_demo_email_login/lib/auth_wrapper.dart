import 'package:auth_demo_email_login/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:authentication_package/authentication.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // Handle auth state changes globally if needed
        // switch (state.runtimeType) {
        //   case AuthError:
        //     final errorState = state as AuthError;
        //     showErrorDialog(errorState.message);
        //     break;
        //   case AuthAuthenticated:
        //     Navigator.pushReplacementNamed(context, '/home');
        //     break;
        //   case AuthActionRequired:
        //     final actionState = state as AuthActionRequired;
        //     if (actionState.actionType == AuthActionType.emailVerification) {
        //       showEmailVerificationDialog();
        //     }
        //     break;
        //     case AuthError:
        //   final errorState = state as AuthError;
        //   showErrorDialog(errorState.message);
        //   break;

        // case AuthActionRequired:
        //   final actionState = state as AuthActionRequired;
        //   if (actionState.actionType == AuthActionType.emailVerification) {
        //     showEmailVerificationDialog();
        //   }
        //   break;

        // }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitializing) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is AuthAuthenticated) {
            return HomeScreen(); // Your main app screen
          }

          return LoginScreen(
            onLoginSuccess: () {
              // Navigation will be handled automatically by BlocBuilder
            },
            onSignUp: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            },
            onForgotPassword: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
              );
            },
          );
        },
      ),
    );
  }
}

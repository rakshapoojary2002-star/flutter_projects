import 'package:auth_demo_email_login/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:authentication_package/authentication.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the authentication package
  await AuthenticationPackage.initialize(
    config: AuthConfig(
      // enableEmailAuth: true,
      // enableGoogleSignIn: true,
      // useFirebaseForEmail: true,
      // requireEmailVerification: true,
      enablePhoneAuth: true,

      // Require email verification
      // allowedEmailDomains: ['company.com'], // Restrict to specific domains

      // // Security Settings
      //maxLoginAttempts: 7, // Max failed login attempts
      // lockoutDurationMinutes: 30,        // Lockout duration after max attempts
      //sessionTimeoutMinutes: 1440, // Session timeout (24 hours)
      // 480 (8 hours)
      // // Password Requirements
      // minPasswordLength: 8,              // Minimum password length
      // requireUppercase: true,            // Require uppercase letters
      // requireLowercase: true,            // Require lowercase letters
      // requireNumbers: true,              // Require numbers
      // requireSpecialCharacters: true,    // Require special characters

      // // Storage and Persistence
      // persistSession: true, // Remember user sessions
      // enableBiometricAuth: false,        // Biometric authentication (coming soon)

      // // Development
      enableLogging: true, // Enable debug logging
    ),
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthenticationPackage.wrapWithProvider(
      child: MaterialApp(
        supportedLocales: const [Locale('en'), Locale('hi'), Locale('es')],
        locale: Locale('hi'),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'My App',
        home: AuthWrapper(),
      ),
    );
  }
}

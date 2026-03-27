import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../../shared/widgets/custom_logo.dart';
import '../../../shared/widgets/email_field.dart';
import '../../../shared/widgets/password_field.dart';
import '../controller/sign_in_controller.dart';
import '../widgets/background_blur.dart';
import '../widgets/sign_in_button.dart';
import '../../sign_up/view/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final controller = SignInController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundBlur(),
          SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomLogo(),
                      SizedBox(height: 12),
                      Text(
                        "Digital Twins Sync",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 20,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 32,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24),

                      // ------- Form -------
                      EmailField(controller: controller.emailController),
                      SizedBox(height: 16),
                      PasswordField(controller: controller.passwordController),
                      SizedBox(height: 16),
                      SignInButton(controller: controller),

                      SizedBox(height: 16),

                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'New here? ',
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: Colors.cyan,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => SignUpScreen(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

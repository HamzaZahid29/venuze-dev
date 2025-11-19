import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:venuze_dev/core/constants/app_assets.dart';
import 'package:venuze_dev/core/providers/password_visiblity_provider.dart';
import 'package:venuze_dev/core/services/app_snackbar_service.dart';
import 'package:venuze_dev/core/services/app_validation_service.dart';
import 'package:venuze_dev/core/theme/app_text_styles.dart';
import 'package:venuze_dev/core/widgets/app_elevated_button.dart';
import 'package:venuze_dev/core/widgets/app_form_field.dart';
import 'package:venuze_dev/features/auth/widgets/captcha_checkbox.dart';
import 'package:venuze_dev/features/auth/widgets/or_devider.dart';
import 'package:venuze_dev/features/auth/widgets/social_auth_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 18),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppAssets.appLogo),
                  Text('Log in', style: AppTextStyles.heading1),
                  RichText(
                    text: TextSpan(
                      text: "Don't have account Yet? ",
                      style: AppTextStyles.caption,
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: AppTextStyles.captionPrimary,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              AppSnackbarService.showSnackbar(
                                'Signup not implemented yet',
                              );
                            },
                        ),
                      ],
                    ),
                  ),

                  AppFormField(
                    title: 'Email',
                    textEditingController: _emailController,
                    validator: AppValidationService.validateEmail,
                    textInputType: TextInputType.emailAddress,
                  ),
                  ChangeNotifierProvider(
                    create: (_) => PasswordVisibilityProvider(),
                    child: Consumer<PasswordVisibilityProvider>(
                      builder: (context, provider, child) {
                        return AppFormField(
                          title: 'Password',
                          textEditingController: _passwordController,
                          validator: AppValidationService.validateRequired,
                          textInputType: TextInputType.visiblePassword,
                          isObsecured: provider.isObscured,
                          icon: provider.isObscured
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          onTap: () {
                            provider.toggleVisibility();
                          },
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          AppSnackbarService.showSnackbar(
                            'Forgot Password not implemented yet',
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: AppTextStyles.captionPrimary,
                        ),
                      ),
                    ],
                  ),
                  CaptchaCheckbox(value: false, onChanged: (value) {}),
                  Row(children: []),
                  Row(
                    children: [
                      Expanded(
                        child: AppElevatedButton(
                          onTap: () async {
                            await _handleLogin(context);
                          },
                          label: 'Login',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  OrDivider(),
                  SizedBox(height: 10),

                  SocialAuthButton(
                    svgPath: AppAssets.facebook,
                    label: 'Login with facebook',
                    onTap: () {
                      AppSnackbarService.showSnackbar('Not implemented yet');
                    },
                  ),
                  SocialAuthButton(
                    svgPath: AppAssets.google ,
                    label: 'Login with google',
                    onTap: () {
                      AppSnackbarService.showSnackbar('Not implemented yet');
                    },
                  ),
                  SocialAuthButton(
                    svgPath: AppAssets.apple ,
                    label: 'Login with apple',
                    onTap: () {
                      AppSnackbarService.showSnackbar('Not implemented yet');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      // await context.read<AuthProvider>().login(
      //   emailController.text.trim(),
      //   passwordController.text.trim(),
      //   context,
      // );
    }
  }
}

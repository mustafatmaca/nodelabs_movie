import 'package:flutter/material.dart';
import 'package:nodelabs_movie/config/theme/app_color.dart';
import 'package:nodelabs_movie/config/theme/app_theme.dart';
import 'package:nodelabs_movie/presentation/pages/main_screen.dart';
import 'package:nodelabs_movie/presentation/pages/register_screen.dart';
import 'package:nodelabs_movie/presentation/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 27.0, right: 27.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      children: [
                        Text('Merhabalar',
                            style: AppTheme.theme.textTheme.displaySmall),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Text(
                            'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.',
                            textAlign: TextAlign.center,
                            style: AppTheme.theme.textTheme.titleLarge),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextFormField(
                  style: AppTheme.theme.textTheme.labelMedium,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset('assets/icons/message.png'),
                    label: const Text(
                      'E-Posta',
                    ),
                  ).applyDefaults(AppTheme.theme.inputDecorationTheme),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  obscureText: true,
                  style: AppTheme.theme.textTheme.labelMedium,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset('assets/icons/unlock.png'),
                    suffixIcon: const Icon(
                      Icons.visibility_off_outlined,
                      color: AppColor.labelTwo,
                    ),
                    label: const Text(
                      'Şifre',
                    ),
                  ).applyDefaults(AppTheme.theme.inputDecorationTheme),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Şifremi Unuttum',
                    style: AppTheme.theme.textTheme.labelSmall,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      style: AppTheme.theme.elevatedButtonTheme.style!.copyWith(
                          minimumSize: const WidgetStatePropertyAll(
                              Size.fromHeight(53))),
                      child: Text(
                        'Giriş Yap',
                        style: AppTheme.theme.textTheme.headlineLarge,
                      ),
                    ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialButton(iconName: 'assets/icons/google.png'),
                        SocialButton(iconName: 'assets/icons/apple.png'),
                        SocialButton(iconName: 'assets/icons/facebook.png'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bir hesabın yok mu? ',
                          style: AppTheme.theme.textTheme.labelMedium,
                          textAlign: TextAlign.start,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ));
                          },
                          child: Text(
                            'Kayıt Ol',
                            style: AppTheme.theme.textTheme.labelLarge,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

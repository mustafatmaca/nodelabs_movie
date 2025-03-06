import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie/config/theme/app_color.dart';
import 'package:nodelabs_movie/config/theme/app_theme.dart';
import 'package:nodelabs_movie/injection_container.dart';
import 'package:nodelabs_movie/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/login/login_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/login/login_event.dart';
import 'package:nodelabs_movie/presentation/blocs/login/login_state.dart';
import 'package:nodelabs_movie/presentation/blocs/password_visibility/password_visibility_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/password_visibility/password_visibility_event.dart';
import 'package:nodelabs_movie/presentation/blocs/password_visibility/password_visibility_state.dart';
import 'package:nodelabs_movie/presentation/blocs/register/register_bloc.dart';
import 'package:nodelabs_movie/presentation/pages/main_screen.dart';
import 'package:nodelabs_movie/presentation/pages/register_screen.dart';
import 'package:nodelabs_movie/presentation/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 27.0, right: 27.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child:
                  BlocBuilder<PasswordVisibilityBloc, PasswordVisibilityState>(
                builder: (context, state) {
                  return Column(
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
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
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
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: AppTheme.theme.textTheme.labelMedium,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset('assets/icons/message.png'),
                          label: const Text(
                            'E-Posta',
                          ),
                        ).applyDefaults(AppTheme.theme.inputDecorationTheme),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "E-Posta boş bırakılamaz.";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Lütfen geçerli bir e-posta giriniz";
                          }
                          return null;
                        },
                        onSaved: (newValue) =>
                            _emailController.text = newValue!,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !state.isVisible,
                        style: AppTheme.theme.textTheme.labelMedium,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset('assets/icons/unlock.png'),
                          suffixIcon: IconButton(
                              onPressed: () {
                                context
                                    .read<PasswordVisibilityBloc>()
                                    .add(TogglePasswordVisibility());
                              },
                              icon: state.isVisible
                                  ? Icon(Icons.visibility_outlined,
                                      color: AppColor.labelTwo)
                                  : const Icon(Icons.visibility_off_outlined,
                                      color: AppColor.labelTwo)),
                          label: const Text(
                            'Şifre',
                          ),
                        ).applyDefaults(AppTheme.theme.inputDecorationTheme),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Şifre boş bırakılamaz.";
                          }
                          return null;
                        },
                        onSaved: (newValue) =>
                            _passwordController.text = newValue!,
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
                              child: BlocListener<LoginBloc, LoginState>(
                            listener: (context, state) {
                              if (state is LoginSuccess) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BlocProvider<BottomNavigationBloc>(
                                      create: (context) => getIt(),
                                      child: MainScreen(
                                        user: state.user!,
                                      ),
                                    ),
                                  ),
                                  (route) => false,
                                );
                              }
                              if (state is LoginFailed) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state
                                        .error!.response!.statusCode
                                        .toString()),
                                  ),
                                );
                              }
                            },
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  context.read<LoginBloc>().add(Login(
                                      _emailController.text,
                                      _passwordController.text));
                                }
                              },
                              style: AppTheme.theme.elevatedButtonTheme.style!
                                  .copyWith(
                                      minimumSize: const WidgetStatePropertyAll(
                                          Size.fromHeight(53))),
                              child: Text(
                                'Giriş Yap',
                                style: AppTheme.theme.textTheme.headlineLarge,
                              ),
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
                              SocialButton(
                                  iconName: 'assets/icons/facebook.png'),
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
                                        builder: (context) =>
                                            BlocProvider<RegisterBloc>(
                                          create: (context) => getIt(),
                                          child: BlocProvider<
                                              PasswordVisibilityBloc>(
                                            create: (context) => getIt(),
                                            child: RegisterScreen(),
                                          ),
                                        ),
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

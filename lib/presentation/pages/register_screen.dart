import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie/config/theme/app_color.dart';
import 'package:nodelabs_movie/config/theme/app_theme.dart';
import 'package:nodelabs_movie/injection_container.dart';
import 'package:nodelabs_movie/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/register/register_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/register/register_event.dart';
import 'package:nodelabs_movie/presentation/blocs/register/register_state.dart';
import 'package:nodelabs_movie/presentation/pages/main_screen.dart';
import 'package:nodelabs_movie/presentation/widgets/social_button.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RegisterScreen({Key? key}) : super(key: key);

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        children: [
                          Text(
                            'Hoşgeldiniz',
                            style: AppTheme.theme.textTheme.displaySmall,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Text(
                            'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.',
                            textAlign: TextAlign.center,
                            style: AppTheme.theme.textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  TextFormField(
                    controller: _nameController,
                    style: AppTheme.theme.textTheme.labelMedium,
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/icons/add_user.png'),
                      label: const Text(
                        'Ad Soyad',
                      ),
                    ).applyDefaults(AppTheme.theme.inputDecorationTheme),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ad Soyad boş bırakılamaz.";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _nameController.text = newValue!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                    controller: _emailController,
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
                    onSaved: (newValue) => _emailController.text = newValue!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    style: AppTheme.theme.textTheme.labelMedium,
                    obscureText: true,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Şifre boş bırakılamaz.";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _passwordController.text = newValue!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                    controller: _passwordCheckController,
                    style: AppTheme.theme.textTheme.labelMedium,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/icons/unlock.png'),
                      label: const Text(
                        'Şifre Tekrar',
                      ),
                    ).applyDefaults(AppTheme.theme.inputDecorationTheme),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Lütfen bu alanı doldurunuz.";
                      }
                      return null;
                    },
                    onSaved: (newValue) =>
                        _passwordCheckController.text = newValue!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Wrap(
                          children: [
                            Text('Kullanıcı sözleşmesini ',
                                style: AppTheme.theme.textTheme.labelMedium),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'okudum ve kabul ediyorum.',
                                style: AppTheme.theme.textTheme.labelSmall,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Text('Bu sözleşmeyi okuyarak devam ediniz lütfen.',
                                style: AppTheme.theme.textTheme.labelMedium),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: BlocListener<RegisterBloc, RegisterState>(
                        listener: (context, state) {
                          if (state is RegisterSuccess) {
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
                          if (state is RegisterFailed) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.error!.response!.statusCode
                                    .toString()),
                              ),
                            );
                          }
                        },
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              if (_passwordController.text !=
                                  _passwordCheckController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Şifreler eşleşmiyor!'),
                                  ),
                                );
                              } else {
                                context.read<RegisterBloc>().add(Register(
                                    _nameController.text,
                                    _emailController.text,
                                    _passwordController.text));
                              }
                            }
                          },
                          style: AppTheme.theme.elevatedButtonTheme.style!
                              .copyWith(
                            minimumSize: const WidgetStatePropertyAll(
                                Size.fromHeight(53)),
                          ),
                          child: Text(
                            'Şimdi Kaydol',
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
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Zaten bir hesabın var mı? ',
                            style: AppTheme.theme.textTheme.labelMedium,
                            textAlign: TextAlign.start,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Giriş Yap',
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
      ),
    );
  }
}

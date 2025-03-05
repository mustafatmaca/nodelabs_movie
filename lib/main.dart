import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie/config/theme/app_theme.dart';
import 'package:nodelabs_movie/injection_container.dart';
import 'package:nodelabs_movie/presentation/blocs/login/login_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/upload_photo/upload_photo_bloc.dart';
import 'package:nodelabs_movie/presentation/pages/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<UploadPhotoBloc>(
          create: (context) => getIt(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nodelabs Movie',
        theme: AppTheme.theme,
        home: LoginScreen(),
      ),
    ),
  );
}

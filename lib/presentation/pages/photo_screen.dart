import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie/config/theme/app_color.dart';
import 'package:nodelabs_movie/config/theme/app_theme.dart';
import 'package:nodelabs_movie/presentation/blocs/upload_photo/upload_photo_bloc.dart';
import 'package:nodelabs_movie/presentation/blocs/upload_photo/upload_photo_event.dart';
import 'package:nodelabs_movie/presentation/blocs/upload_photo/upload_photo_state.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Profil Detayı',
          style: AppTheme.theme.textTheme.headlineLarge,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Column(
                  children: [
                    Text(
                      'Fotoğraflarınızı Yükleyin',
                      style: AppTheme.theme.textTheme.displaySmall,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Text('Resources out incentivize relaxation floor loss cc.',
                        textAlign: TextAlign.center,
                        style: AppTheme.theme.textTheme.titleLarge),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            InkWell(
              onTap: () {
                context.read<UploadPhotoBloc>().add(PickPhoto());
              },
              child: BlocBuilder<UploadPhotoBloc, UploadPhotoState>(
                builder: (context, state) {
                  if (state is UploadPhotoLoaded) {
                    if (state.pickedPhoto != null) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(state.pickedPhoto!),
                              fit: BoxFit.cover),
                          color: Color(0x1AFFFFFF),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: AppColor.labelTwo,
                            size: MediaQuery.of(context).size.width * 0.12,
                          ),
                        ),
                      );
                    }
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Color(0x1AFFFFFF),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: AppColor.labelTwo,
                          size: MediaQuery.of(context).size.width * 0.12,
                        ),
                      ),
                    );
                  }
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      color: Color(0x1AFFFFFF),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: AppColor.labelTwo,
                        size: MediaQuery.of(context).size.width * 0.12,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              children: [
                Expanded(
                    child: BlocListener<UploadPhotoBloc, UploadPhotoState>(
                  listener: (context, state) {
                    if (state is UploadPhotoSuccess) {
                      Navigator.pop(context);
                    }
                    if (state is UploadPhotoFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Yüklenemedi!'),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<UploadPhotoBloc, UploadPhotoState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (state is UploadPhotoLoaded) {
                            context
                                .read<UploadPhotoBloc>()
                                .add(UploadPhoto(state.pickedPhoto!));
                          }
                        },
                        style: AppTheme.theme.elevatedButtonTheme.style!
                            .copyWith(
                                minimumSize: const WidgetStatePropertyAll(
                                    Size.fromHeight(53))),
                        child: Text('Devam Et',
                            style: AppTheme.theme.textTheme.headlineLarge),
                      );
                    },
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_movie/config/theme/app_theme.dart';
import 'package:nodelabs_movie/domain/entities/user_entity.dart';
import 'package:nodelabs_movie/presentation/pages/photo_screen.dart';
import 'package:nodelabs_movie/presentation/widgets/discount_card.dart';
import 'package:nodelabs_movie/presentation/widgets/favorite_movie.dart';

class ProfileScreen extends StatelessWidget {
  final UserEntity user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

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
          actions: [
            ElevatedButton(
                style: AppTheme.theme.elevatedButtonTheme.style!.copyWith(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)))),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.black,
                    barrierColor: Colors.white10,
                    isScrollControlled: true,
                    // Saydam arka plan
                    builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                          left: 8,
                          right: 8,
                          bottom: 8,
                          top: 24,
                        ),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(30)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/bottom_sheet_bg.png'))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Sınırlı Teklif',
                                style: AppTheme.theme.textTheme.displayMedium),
                            Text('Jeton paketin’ni seçerek bonus',
                                style: AppTheme.theme.textTheme.labelLarge),
                            Text('kazanın ve yeni bölümlerin kilidini açın!',
                                style: AppTheme.theme.textTheme.labelLarge),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0x1AFFFFFF),
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: Colors.white54,
                                    width: 0.2,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Text('Alacağınız Bonuslar',
                                        style: AppTheme
                                            .theme.textTheme.headlineLarge),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18,
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 24,
                                                backgroundColor:
                                                    const Color(0xFF70050B),
                                                child: Image.asset(
                                                    'assets/images/bs_bonus_one.png'),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                              ),
                                              Text(
                                                'Premium Hesap',
                                                textAlign: TextAlign.center,
                                                style: AppTheme
                                                    .theme.textTheme.labelLarge,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18,
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 24,
                                                backgroundColor:
                                                    const Color(0xFF70050B),
                                                child: Image.asset(
                                                    'assets/images/bs_bonus_two.png'),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                              ),
                                              Text(
                                                'Daha Fazla Eşleşme',
                                                textAlign: TextAlign.center,
                                                style: AppTheme
                                                    .theme.textTheme.labelLarge,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18,
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 24,
                                                backgroundColor:
                                                    const Color(0xFF70050B),
                                                child: Image.asset(
                                                    'assets/images/bs_bonus_three.png'),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                              ),
                                              Text('Öne Çıkarma',
                                                  textAlign: TextAlign.center,
                                                  style: AppTheme.theme
                                                      .textTheme.labelLarge),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18,
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 24,
                                                backgroundColor:
                                                    const Color(0xFF70050B),
                                                child: Image.asset(
                                                    'assets/images/bs_bonus_four.png'),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                              ),
                                              Text(
                                                'Daha Fazla Beğeni',
                                                textAlign: TextAlign.center,
                                                style: AppTheme
                                                    .theme.textTheme.labelLarge,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text('Kilidi açmak için bir jeton paketi seçin',
                                style: AppTheme.theme.textTheme.headlineLarge),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DiscountCard(
                                  firstJeton: '220',
                                  secondJeton: '330',
                                  price: '₺99,99',
                                  discount: '+10%',
                                  gradient: [
                                    Color(0xFF70050B),
                                    Color(0xFFE50914),
                                  ],
                                  discountColor: Color(0xFF70050B),
                                ),
                                DiscountCard(
                                  firstJeton: '2.000',
                                  secondJeton: '3.375',
                                  price: '₺799,99',
                                  discount: '+70%',
                                  gradient: [
                                    Color(0xFF5948E4),
                                    Color(0xFFA0287A),
                                    Color(0xFFE50914),
                                  ],
                                  discountColor: Color(0xFF5948E4),
                                ),
                                DiscountCard(
                                  firstJeton: '1.000',
                                  secondJeton: '1.350',
                                  price: '₺399,99',
                                  discount: '+35%',
                                  gradient: [
                                    Color(0xFF70050B),
                                    Color(0xFFE50914),
                                  ],
                                  discountColor: Color(0xFF70050B),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: ElevatedButton(
                                  onPressed: () {},
                                  style: AppTheme
                                      .theme.elevatedButtonTheme.style!
                                      .copyWith(
                                          minimumSize:
                                              const WidgetStatePropertyAll(
                                                  Size.fromHeight(53)),
                                          shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18)))),
                                  child: Text('Tüm Jetonları Gör',
                                      style: AppTheme
                                          .theme.textTheme.headlineLarge),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.diamond,
                      size: 18,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Text('Sınırlı Teklif',
                        style: AppTheme.theme.textTheme.labelLarge),
                  ],
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 27.0, right: 27.0, top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          child: user.photoUrl != null
                              ? CachedNetworkImage(
                                  imageUrl: user.photoUrl!,
                                  placeholder: (context, url) =>
                                      Text(user.name![0]),
                                  errorWidget: (context, url, error) =>
                                      const Text('U'),
                                )
                              : const Text('U')),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            user.name != null
                                ? Text(user.name!,
                                    style:
                                        AppTheme.theme.textTheme.headlineLarge)
                                : Text('User Name',
                                    style:
                                        AppTheme.theme.textTheme.headlineLarge),
                            user.id != null
                                ? Text(
                                    "ID: ${user.id}",
                                    style: AppTheme.theme.textTheme.labelMedium,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : Text("ID: ",
                                    style:
                                        AppTheme.theme.textTheme.labelMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: AppTheme.theme.elevatedButtonTheme.style!.copyWith(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhotoScreen(),
                          ),
                        );
                      },
                      child: Text('Fotoğraf Ekle',
                          style: AppTheme.theme.textTheme.labelLarge))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text("Beğendiğim Filmler",
                  style: AppTheme.theme.textTheme.headlineLarge),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return FavoriteMovie();
                  },
                ),
              )
            ],
          ),
        ));
  }
}

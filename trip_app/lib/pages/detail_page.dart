import 'package:flutter/material.dart';
import 'package:trip_app/misc/colors.dart';
import 'package:trip_app/widgets/app_butons.dart';
import 'package:trip_app/widgets/app_large_text.dart';
import 'package:trip_app/widgets/app_text.dart';
import 'package:trip_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 320,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'img/mountain.jpeg'
                    ),
                    fit: BoxFit.cover
                  )
                ),
              )
            ),
            Positioned(
              left: 20,
              top: 50,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.menu), color: Colors.white,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.recommend_outlined), color: Colors.white ,),
                ],
              ),
            ),
            Positioned(
              top: 250,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: 'Yosemite', color: Colors.black.withOpacity(0.8),),
                        AppLargeText(text: '\$ 250',color: AppColors.mainColor,)
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor,),
                        SizedBox(width: 5,),
                        AppText(text: 'USA, California', color: AppColors.textColor1,),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star, color: index < gottenStars ? AppColors.starColor : AppColors.textColor2,);
                          }),
                        ),
                        SizedBox(width: 10,),
                        AppText(text: '4.0', color: AppColors.textColor2,)
                      ],
                    ),
                    SizedBox(height: 20,),
                    AppLargeText(text: 'People', color: Colors.black.withOpacity(0.8), size: 20,),
                    SizedBox(height: 5,),
                    AppText(text: 'Number of people in your group', color: AppColors.mainTextColor,),
                    SizedBox(height: 10,),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: (){
                            setState((){selectedIndex = index;});
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                                color: selectedIndex == index ? Colors.white : Colors.black,
                                size: 50,
                                background: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                                borderColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                                text: (index+1).toString(),
                            ),
                          ),
                        );
                      })
                    ),
                    SizedBox(height: 15,),
                    AppLargeText(text: 'Description', color: Colors.black.withOpacity(0.8), size: 20,),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: AppText(
                        text: 'You must go to a travel. Travelling helps get rid of pressure. Go to the mountains to see the nature!',
                        color: AppColors.mainTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 20,
              right: 20,
              child: Container(
                child: Row(
                  children: [
                    AppButtons(
                      color: AppColors.textColor2,
                      size: 60,
                      background: Colors.white,
                      borderColor: AppColors.textColor2,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(width: 5,),
                    ResponsiveButton(width: double.maxFinite, isResponsive: true,)
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

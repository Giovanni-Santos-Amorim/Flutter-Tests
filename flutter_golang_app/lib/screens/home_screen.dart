import 'package:flutter/material.dart';
import 'package:flutter_golang_app/colors/app_colors.dart';
import 'package:flutter_golang_app/widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/welcome.jpg',
            ),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                  text: 'Hello',
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 60,
                    fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(
                      text: '\nStart your beautiful day',
                      style: TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: 14,
                      ),
                    )
                  ]
                )
            ),
            SizedBox(height: MediaQuery.of(context).size.height/2.0,),
            ButtonWidget(
                backgroundColor: AppColors.mainColor,
                text: 'Add Task',
                textColor: Colors.white),
            const SizedBox(height: 15,),
            ButtonWidget(
                backgroundColor: Colors.white,
                text: 'View All',
                textColor: AppColors.smallTextColor),
          ],
        ),
      ),
    );
  }
}

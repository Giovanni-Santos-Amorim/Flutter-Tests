import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_app/misc/colors.dart';
import 'package:trip_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;


  ResponsiveButton({Key? key, this.width, this.isResponsive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            isResponsive == true ? Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppText(text: 'Book trip now', color: Colors.white,)) : Container(),
            Image.asset('img/button-one.png')
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_golang_app/colors/app_colors.dart';
import 'package:flutter_golang_app/widgets/task_widget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myData = [
      'Try harder',
      'Try smarter'
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, top: 20),
            alignment: Alignment.topLeft,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height/3.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/header1.jpg')
              )
            ),
            child: Icon(Icons.arrow_back, color: AppColors.secondaryColor,),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(Icons.home, color: AppColors.secondaryColor,),
                const SizedBox(width: 10,),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 15,),
                ),
                Expanded(child: Container()),
                Icon(Icons.calendar_month_sharp, color: AppColors.secondaryColor,),
                const SizedBox(width: 10,),
                Text('2', style: TextStyle(fontSize: 20, color: AppColors.secondaryColor),)
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Flexible(
            child: ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10,),
                child: TaskWidget(
                  text: myData[index],
                  color: Colors.blueGrey,
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

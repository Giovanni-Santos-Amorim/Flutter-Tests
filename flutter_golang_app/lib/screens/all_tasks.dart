import 'package:flutter/material.dart';
import 'package:flutter_golang_app/colors/app_colors.dart';
import 'package:flutter_golang_app/widgets/task_widget.dart';
import 'package:get/get.dart';
import '../controllers/data_controller.dart';
import '../widgets/button_widget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  _loadData()async{
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    print(Get.find<DataController>().myData.length);


    List myData = [
      'Try harder',
      'Try smarter'
    ];

    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xff2e3253).withOpacity(0.5),
      alignment: Alignment.centerLeft,
      child: const Icon(
          Icons.edit,
        color: Colors.white,
      ),
    );

    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );

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
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: AppColors.secondaryColor,),
            )
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
                itemCount: Get.find<DataController>().myData.length,
                itemBuilder: (context, index) {
              return Dismissible(
                background: leftEditIcon,
                secondaryBackground: rightDeleteIcon,
                onDismissed: (DismissDirection direction){

                },
                confirmDismiss: (DismissDirection direction) async{
                  if(direction == DismissDirection.startToEnd){
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (_){
                          return Container(
                            height: 500,
                            decoration: BoxDecoration(
                              color: const Color(0xff2e3253).withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonWidget(backgroundColor: AppColors.mainColor, text: 'View', textColor: Colors.white,),
                                  const SizedBox(height: 20,),
                                  ButtonWidget(backgroundColor: AppColors.mainColor, text: 'Edit', textColor: Colors.white,)

                                ],
                              ),
                            ),
                          );
                        });

                    return false;
                  }
                  else{
                    return Future.delayed(Duration(seconds: 1),() => direction == DismissDirection.endToStart);
                  }
                } ,
                key: ObjectKey(index),
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10,),
                  child: TaskWidget(
                    text: Get.find<DataController>().myData[index]["task_name"],
                    color: Colors.blueGrey,
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_app/controllers/data_controller.dart';
import 'package:get/get.dart';

import '../colors/app_colors.dart';
import '../widgets/textfield_widget.dart';

class ViewTask extends StatelessWidget {
  final int id;

  const ViewTask({Key? key, required this.id}) : super(key: key);

  _loadingSingleTask()async{
    print("id passed "+ id.toString());
    await Get.find<DataController>().getSingleData(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    _loadingSingleTask();

    return Scaffold(
        body: GetBuilder<DataController>(builder: (controller){
          nameController.text = controller.singleData['task_name']?? 'Task detail not found';
          detailController.text = controller.singleData['task_detail']?? 'Task detail not found';

          return Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/addtask1.jpg'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 40,),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back),
                      color: AppColors.secondaryColor,)
                  ],
                ),
                Column(
                  children:  [
                    TextFieldWidget(
                        readOnly: true,
                        textController: nameController,
                        hintText: 'task name',
                        borderRadius: 30),
                    const SizedBox(height: 15,),
                    TextFieldWidget(
                      readOnly: true,
                      textController: detailController,
                      hintText: 'task detail',
                      borderRadius: 30,
                      maxLines: 3,),
                    const SizedBox(height: 15,),

                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height/6,)
              ],
            ),
          );
    })
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang_app/screens/all_tasks.dart';
import 'package:flutter_golang_app/widgets/button_widget.dart';
import 'package:flutter_golang_app/widgets/error_warning_msg.dart';
import 'package:flutter_golang_app/widgets/textfield_widget.dart';
import 'package:get/get.dart';
import '../colors/app_colors.dart';
import '../controllers/data_controller.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    bool _dataValidation(){
      if(nameController.text.trim() == ''){
        Message.taskErrorOrWarning('Task Name', ' Task name is empty');

        return false;
      }
      else if(detailController.text.trim() == ''){
        Message.taskErrorOrWarning('Task Detail', ' Task detail is empty');

        return false;
      }

      return true;
    }

    return Scaffold(
      body: Container(
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
                    textController: nameController,
                    hintText: 'Task Name',
                    borderRadius: 30),
                const SizedBox(height: 15,),
                TextFieldWidget(
                    textController: detailController,
                    hintText: 'Task Detail',
                    borderRadius: 30,
                    maxLines: 3,),
                const SizedBox(height: 15,),
                GestureDetector(
                  onTap: () {
                    if(_dataValidation()){
                      Get.find<DataController>().postData(
                          nameController.text.trim(),
                          detailController.text.trim()
                      );

                      Get.to(() => AllTasks(),
                        transition: Transition.circularReveal,


                      );
                    }
                  },
                  child: ButtonWidget(
                      backgroundColor: AppColors.mainColor,
                      text: 'Add',
                      textColor: Colors.white),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/6,)
          ],
        ),
      ),
    );
  }
}

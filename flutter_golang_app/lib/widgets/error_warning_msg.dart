import 'package:flutter_golang_app/colors/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message{
  static void taskErrorOrWarning(String taskName, String taskErrorOrWarning){
    Get.snackbar(taskName, taskErrorOrWarning,
      backgroundColor: AppColors.mainColor,
      titleText: Text(
        taskName,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
        messageText: Text(
          taskErrorOrWarning,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.amber
          ),
        )
    );

  }
}
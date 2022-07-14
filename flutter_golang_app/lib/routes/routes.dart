import 'package:flutter_golang_app/screens/add_task.dart';
import 'package:flutter_golang_app/screens/all_tasks.dart';
import 'package:flutter_golang_app/screens/home_screen.dart';
import 'package:get/get.dart';

import '../screens/edit_task.dart';
import '../screens/view_task.dart';

class RoutesClass {
  static String home = "/";
  static String allTasks = "/alltasks";
  static String addTask = "/addtask";
  static String editTask = "/edittask";
  static String viewTask = "/viewtask";


  static String getHomeRoute() => home;
  static String getAllTasksRoute() => allTasks;
  static String getAddTasksRoute() => addTask;
  static String getEditTasksRoute(String id) => '$editTask?id=$id';
  static String getViewTasksRoute(String id) => '$viewTask?id=$id';

  static List<GetPage> routes =[
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: allTasks, page: () => const AllTasks(), transition: Transition.fade, transitionDuration: const Duration(seconds: 1)),
    GetPage(name: addTask, page: () => const AddTask(), transition: Transition.zoom, transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: editTask, page: (){
      var id = Get.parameters["id"];
      return EditTask(id: int.parse(id!));
    }, transition: Transition.zoom, transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: viewTask, page: (){
      var id = Get.parameters["id"];
      return ViewTask(id: int.parse(id!));
    }, transition: Transition.zoom, transitionDuration: const Duration(milliseconds: 500)),

  ];
      
}
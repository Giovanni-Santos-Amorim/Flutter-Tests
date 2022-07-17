import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ticket_booking/screens/bottom_bar.dart';


void main(){
  testWidgets('screen switching with BottomNavigationBar', (WidgetTester tester) async{
    await tester.pumpWidget(
         BottomBar()
    );

    
 });
}
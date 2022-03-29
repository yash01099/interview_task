import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/src/screens/Home/home_screen.dart';

class InterviewTask extends StatefulWidget {
  const InterviewTask({Key? key}) : super(key: key);

  @override
  _InterviewTaskState createState() => _InterviewTaskState();
}

class _InterviewTaskState extends State<InterviewTask> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Interview Task',
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
          progressIndicatorTheme:
              ProgressIndicatorThemeData(color: Colors.blue),
          scaffoldBackgroundColor: Colors.grey.shade300,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
          )),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

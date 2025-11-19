import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:resqpk/Screens/first_aid.dart';

import 'Screens/hospital_list.dart';
import 'Screens/medical_history.dart';
import 'Screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MedicalHistoryScreen()
    );
  }
}

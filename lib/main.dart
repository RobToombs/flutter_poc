import 'package:flutter/material.dart';

import 'appointments/appointment_list.dart';
import 'sign_up/sign_up.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SignUpScreen(),
        '/appointments': (context) => AppointmentScreen(),
      },
    );
  }
}

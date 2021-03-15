import 'package:flutter/material.dart';

FractionallySizedBox createTitleRow() {
  return FractionallySizedBox(
      widthFactor: 0.9,
      child: Row(
        children: [
          centeredText('Last Name'),
          centeredText('First Name'),
          centeredText('DOB'),
          centeredText('MRN'),
          centeredText('Date'),
          centeredText('Time'),
          centeredText('Clinician'),
          centeredText('Last Saved'),
        ],
  ));
}

Expanded centeredText(String text) {
  return Expanded(
    child: Text(
      text,
      textAlign: TextAlign.center,
    ),
  );
}

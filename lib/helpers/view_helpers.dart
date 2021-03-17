import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

IgnorePointer createTitleRow() {
  return IgnorePointer(
      child: ExpansionTile (
        tilePadding: const EdgeInsets.only(right: 20.0),
        title:
          Row(
              children: <Widget>[
                centeredBoldText('Last Name'),
                centeredBoldText('First Name'),
                centeredBoldText('DOB'),
                centeredBoldText('MRN'),
                centeredBoldText('Date'),
                centeredBoldText('Time'),
                centeredBoldText('Clinician'),
                centeredBoldText('Last Saved'),
              ],
            ),
        trailing: SizedBox.shrink()
     )
   );
}

Expanded centeredBoldText(String text) {
  return centeredText(text, TextStyle(fontWeight: FontWeight.bold));
}

Expanded centeredNormalText(String text) {
  return centeredText(text, null);
}

Expanded centeredText(String text, TextStyle? _style) {
  return Expanded(
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: _style,
    ),
  );
}
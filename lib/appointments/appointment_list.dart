import 'package:flutter/material.dart';
import 'package:flutter_poc/helpers/view_helpers.dart';

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.id,
  });

  String expandedValue;
  String headerValue;
  int id;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
      id: index
    );
  });
}

class AppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: [
              createTitleRow(),
              AppointmentList(),
      ])),
    );
  }
}

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  final List<Item> _data = generateItems(10);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList.radio(
      expansionCallback: (int index, bool isExpanded) {},
      children: _data.map<ExpansionPanelRadio>((Item item) {
        return ExpansionPanelRadio(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Row(children: <Widget>[
              centeredNormalText('Toombs'),
              centeredNormalText('Rob'),
              centeredNormalText('2/3/1990'),
              centeredNormalText('MRN1235'),
              centeredNormalText('3/17/2021'),
              centeredNormalText('10:30 AM'),
              centeredNormalText('Dr. Pants Man'),
              centeredNormalText('3/15/2021 @ 9:30 AM'),
            ]);
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          canTapOnHeader: true,
          value: item.id,
        );
      }).toList(),
    );
  }
}

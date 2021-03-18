import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_poc/helpers/view_helpers.dart';
import 'package:http/http.dart' as http;

import 'models.dart';

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
  late Future<List<Appointment>> _futureAppointments;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return FutureBuilder<List<Appointment>> (
      future: _futureAppointments,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _appointmentPanelList(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, let's show a loading spinner.
        return CircularProgressIndicator();
      }
    );
  }

  ExpansionPanelList _appointmentPanelList(List<Appointment> appointments) {
    return ExpansionPanelList.radio(
      expansionCallback: (int index, bool isExpanded) {},
      children: appointments.map<ExpansionPanelRadio>((Appointment appt) {
        return ExpansionPanelRadio(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Row(children: <Widget>[
              centeredNormalText(appt.lastName),
              centeredNormalText(appt.firstName),
              centeredNormalText(appt.dob.toString()),
              centeredNormalText(appt.mrn),
              centeredNormalText(appt.date.toString()),
              centeredNormalText(appt.clinician),
              centeredNormalText(appt.lastSaved.toString()),
            ]);
          },
          body: ListTile(
              title: Text(appt.firstName),
              subtitle:
              const Text('Delete this appointment.'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  appointments.removeWhere((Appointment currentAppt) => appt == currentAppt);
                });
              }),
          canTapOnHeader: true,
          value: appt.id,
        );
      }).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    _futureAppointments = _fetchAppointments();
  }

  Future<List<Appointment>> _fetchAppointments() async {
    http.Response response = await http.get(Uri.http('localhost:8080', 'appointments'));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
                .map((appt) => Appointment.fromJson(appt))
                .toList();
    } else {
      throw Exception('Failed to load appointments');
    }
  }

}

import 'package:flutter/material.dart';

import 'flutter_flow/flutter_flow_theme.dart';

class Appoint extends StatefulWidget {

  int doc=0;
 Appoint({Key? key,  required this.doc}):super(key:key);


  @override
  State<Appoint> createState() => _AppointState();
}

class _AppointState extends State<Appoint> {
  @override
  Widget build(BuildContext context) {
    List<String> tyhc = [
      'Diagnostics',
      'Reminders',
      'Appointments',
      'Water Intake'
    ];
    List<String> remainders = [
      'Jogging',
      'Calories'
    ];
    List<String> experts=[
      'Doctor1',
      'Doctor2',
      'Doctor3',
      'Doctor4',
    ];
    List<String> pic=[
      'diag.jpg',
      'reminder.jpg',
      'appointment.jpg',
      'water.jpg'

    ];
    List<String> doct=[
      'Dr Dummy1','Dr Dummy2','Dr Dummy3','Dr Dummy4','Dr Dummy5',
    ];
    List<String> name=['Yashoda','Apollo','DRA Lien','Medanta','Artemis'];
    List<String> fee=['500','1000','1500','1200','900'];
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth,
                height: screenHeight * 0.4,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(0.5, 0.5),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(-0.5, -0.5),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Doctor name:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Spacer(),
                          Text(
                            doct[widget.doc],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Clinic name:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Spacer(),
                          Text(
                            name[widget.doc],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Slot:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Spacer(),
                          Text(
                            'Dr Dummy1',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Consultency Fee:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Spacer(),
                          Text(
                            fee[widget.doc],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text("Book Appointment"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

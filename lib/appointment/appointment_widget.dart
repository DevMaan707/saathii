import 'package:get/get.dart';

import '../appoint.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appointment_model.dart';
export 'appointment_model.dart';

class AppointmentWidget extends StatefulWidget {
  const AppointmentWidget({super.key});

  @override
  State<AppointmentWidget> createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  late AppointmentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Appointments",
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsets.only(right: screenHeight * 0.02),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight*0.02,top: screenHeight*0.02),
                    child: Text(
                      'Preffered Doctor',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenHeight * 0.018, top: screenHeight * 0.02),
                    child: Container(
                      width: screenWidth,
                      height: screenHeight * 0.1,
                      decoration: BoxDecoration(
                        color: Color(0xFFDEE5E5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: screenWidth*0.05,),
                          CircleAvatar(radius: 25,backgroundImage: AssetImage('assets/images/2.jpg'),),
                          SizedBox(width: screenWidth*0.02,),
                          Text(doct[0]),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top:screenHeight*0.02,left: screenHeight*0.025),
                    child: Text(
                      'Other Available Experts',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(5, (index) =>GestureDetector(
                      onTap: (){Get.to(Appoint(doc:index));},
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: screenHeight * 0.018, top: screenHeight * 0.02),
                        child: Container(
                          width: screenWidth,
                          height: screenHeight * 0.1,
                          decoration: BoxDecoration(
                            color: Color(0xFFDEE5E5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: screenWidth*0.05,),
                              CircleAvatar(radius: 25,backgroundImage: AssetImage('assets/images/${index+1}.jpg'),),
                              SizedBox(width: screenWidth*0.02,),
                              Text(doct[index]),
                            ],
                          ),
                        ),
                      ),
                    ),),
                  )
                 ] )
          )
          ),
        ),
      ),
    );
  }
}

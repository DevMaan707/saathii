import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


import '../controllers/chatbot_Api.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../homepage/homepage.dart';
class Diag extends StatefulWidget {
  const Diag({super.key});

  @override
  State<Diag> createState() => _DiagState();
}

class _DiagState extends State<Diag> {
  TextEditingController user_input = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:EdgeInsets.only(
                left: screenHeight * 0.02, right: screenHeight * 0.02),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top:screenHeight*0.015),
                  child: Container(
                    height: screenHeight * 0.06,
                    width: screenWidth,
                    //color: Colors.red,
                    child: Row(
                      children: [
                        GestureDetector(onTap: (){Get.to(HomepageW());},child: Icon(CupertinoIcons.back)),
                        SizedBox(width: screenWidth*0.3,),
                        Text("Diagnose", style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF0F1113),
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                        ),)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.78,
                  width: screenWidth,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(
                     topRight: Radius.circular(15),
                     topLeft: Radius.circular(15),

                   ),
                   color:Colors.grey.shade200,
                 ),
                ),
                TextFormField(
                  //controller: fnameController,
                  onEditingComplete: (){

                  },
                  controller: user_input,
                  decoration: InputDecoration(
                    hintText: "Type a message",
                    suffixIcon:  GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Container(
                          width: screenHeight*0.002,
                          height: screenHeight*0.002,
                          child: GestureDetector(onTap: () async{
                            var chtres= ChatApi();
                            var resp= await chtres.chatresponse(user_input.toString());
                          },child: Icon(Icons.send),)
                        ),
                      ),
                    ),
                    prefixIcon: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Container(
                          width: screenHeight*0.002,
                            height: screenHeight*0.002,
                            child: Image.asset('assets/images/folder.png',fit: BoxFit.fill,),
                        ),
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.deepOrangeAccent),
                      borderRadius: BorderRadius.circular(
                          15), // Change the color for focused state
                    ),
                    //border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

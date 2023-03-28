import 'package:flutter/material.dart';

import 'package:no_hunger/utills/ColorSet.dart';


class ProfilePageOrignial extends StatefulWidget {
  const ProfilePageOrignial({Key? key}) : super(key: key);

  @override
  State<ProfilePageOrignial> createState() => _ProfilePageOrignialState();
}

class _ProfilePageOrignialState extends State<ProfilePageOrignial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Container(
                        width: 436.2,
                        height: 358.9,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Container(
                                  width: 130,
                                  height: 130,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/565/600',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0, -0.65),
                                child: Text(
                                  'praveen sahu',
                                  style:
                                  TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 1.27),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Container(
                          width: 392.9,
                          height: 480,
                          decoration: BoxDecoration(
                            color: ColorSet.secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, -1),
                                      //Yaha par Logic aayega firebase
                                      child: Text(
                                        'Praveen@gmail .com'

                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-0.65, 0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              60, 0, 0, 0),
                                          child: Icon(
                                            Icons.person,
                                            color: ColorSet
                                                .primaryColor,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, -1),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 0, 0),
                                          //Yaha par Logic aayega firebase
                                          child: Text(
                                            'UPraveen123',
                                            textAlign: TextAlign.start,

                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-0.65, 0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              60, 0, 0, 0),
                                          child: Icon(
                                            Icons.phone_android,
                                            color: ColorSet
                                                .primaryColor,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, -1),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 0, 0),
                                          //Yaha par Logic aayega firebase
                                          child: Text(
                                            '9993041091',

                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              60, 0, 0, 0),
                                          child: Icon(
                                            Icons.addchart,
                                            color: ColorSet
                                                .primaryColor,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, -1),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                          child: Text(
                                            'Rz-8 , dabri mpr',

                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                  // child: TextButton(
                                  //   onPressed: () {
                                  //     print('Button pressed ...');
                                  //   },
                                  //   text: 'Logout',
                                  //   style: FFButtonOptions(
                                  //     width: 130,
                                  //     height: 40,
                                  //     padding:
                                  //     EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  //     iconPadding:
                                  //     EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  //     color: FlutterFlowTheme.of(context).primaryColor,
                                  //     textStyle: FlutterFlowTheme.of(context)
                                  //         .subtitle2
                                  //         .override(
                                  //       fontFamily: 'Poppins',
                                  //       color: Colors.white,
                                  //     ),
                                  //     borderSide: BorderSide(
                                  //       color: Colors.transparent,
                                  //       width: 1,
                                  //     ),
                                  //     borderRadius: BorderRadius.circular(8),
                                  //   ),
                                  // ),
                                ),
                                Expanded(
                                  child: Image.asset(
                                    'assets/images/undraw_Eating_together_re_ux62.png',
                                    width: 415,
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.2, -0.22),
                      child: Container(
                        width: 317.7,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorSet.lineColor,
                          ),
                        ),
                        child: Icon(
                          Icons.settings_outlined,
                          color: ColorSet.primaryText,
                          size: 24,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.65, 0),
                      child: Icon(
                        Icons.mail,
                        color:ColorSet.primaryColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
          ,
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utills/firebase_login_and_signup.dart';
import '../utills/route_names.dart';

class CollectorDistributor extends StatefulWidget {
  const CollectorDistributor({Key? key}) : super(key: key);

  @override
  State<CollectorDistributor> createState() => _CollectorDistributorState();
}

class _CollectorDistributorState extends State<CollectorDistributor> {
  @override

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(-0.05, -0.1),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/screen4.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(-0.05, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Text(
                    'Want to Share Food?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Text(
                'Choose Any one',
              ),
              Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            addUserTypeToFirestore('Distributor');

                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/screen1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text('Distributor',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            addUserTypeToFirestore('Collector');
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/undraw_Hamburger_re_7sfy.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text('Collector',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Image.asset(
                      'assets/images/undraw_Eating_together_re_ux62.png',
                      width: 500,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrFrontPageWidget extends StatefulWidget {
  const DrFrontPageWidget({
    Key? key,
    this.searchedData,
  }) : super(key: key);

  final String? searchedData;

  @override
  _DrFrontPageWidgetState createState() => _DrFrontPageWidgetState();
}

class _DrFrontPageWidgetState extends State<DrFrontPageWidget> {
  Completer<ApiCallResponse>? _apiRequestCompleter1;
  Completer<ApiCallResponse>? _apiRequestCompleter2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFC0C0C0),
      drawer: Container(
        width: 300,
        child: Drawer(
          elevation: 16,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.9, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Container(
                              width: 60,
                              height: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/seed/520/600',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Hi ',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 34,
                                  ),
                        ),
                        if (FFAppState().Token != null &&
                            FFAppState().Token != '')
                          Align(
                            alignment: AlignmentDirectional(0.05, -0.05),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                getJsonField(
                                  FFAppState().LoggedInUserData,
                                  r'''$.first_name''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 29,
                                    ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (FFAppState().Token == null || FFAppState().Token == '')
                InkWell(
                  onTap: () async {
                    context.pushNamed('LoginIn');
                  },
                  child: ListTile(
                    title: Text(
                      'Login',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              if (FFAppState().Token != null && FFAppState().Token != '')
                InkWell(
                  onTap: () async {
                    setState(() {
                      FFAppState().LoggedInUserData = null;
                      FFAppState().Token = '';
                    });

                    context.pushNamed('HomePage');
                  },
                  child: ListTile(
                    title: Text(
                      'Logout',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<ApiCallResponse>(
        future: (_apiRequestCompleter1 ??= Completer<ApiCallResponse>()
              ..complete(DoctorAppointmentsCall.call(
                id: getJsonField(
                  FFAppState().LoggedInUserData,
                  r'''$.doctor_id''',
                ).toString(),
              )))
            .future,
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
              ),
            );
          }
          final columnDoctorAppointmentsResponse = snapshot.data!;
          return RefreshIndicator(
            onRefresh: () async {
              setState(() => _apiRequestCompleter1 = null);
              await waitForApiRequestCompleter1();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFE06161),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.98, -0.92),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    // To Login
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                'EVE',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 34,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                      child: Text(
                        'Appointment List :-',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.79,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.62,
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 1,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          alignment:
                              AlignmentDirectional(-0.050000000000000044, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final appointmentChlidList =
                                              getJsonField(
                                            columnDoctorAppointmentsResponse
                                                .jsonBody,
                                            r'''$.data''',
                                          ).toList();
                                          if (appointmentChlidList.isEmpty) {
                                            return Center(
                                              child: Image.asset(
                                                'assets/images/No_Appointments.png',
                                                width: 100,
                                                height: 100,
                                              ),
                                            );
                                          }
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                appointmentChlidList.length,
                                            itemBuilder: (context,
                                                appointmentChlidListIndex) {
                                              final appointmentChlidListItem =
                                                  appointmentChlidList[
                                                      appointmentChlidListIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 4, 16, 8),
                                                child: InkWell(
                                                  onTap: () async {
                                                    if (Navigator.of(context)
                                                        .canPop()) {
                                                      context.pop();
                                                    }
                                                    context.pushNamed(
                                                      'DrAppointmentStatusUpdate',
                                                      queryParams: {
                                                        'appointmentID':
                                                            serializeParam(
                                                          getJsonField(
                                                            appointmentChlidListItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'appStatus':
                                                            serializeParam(
                                                          getJsonField(
                                                            appointmentChlidListItem,
                                                            r'''$.status''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .leftToRight,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: AnimatedContainer(
                                                    duration: Duration(
                                                        milliseconds: 420),
                                                    curve: Curves.elasticOut,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    height: 65,
                                                    decoration: BoxDecoration(
                                                      color: colorFromCssString(
                                                        () {
                                                          if (getJsonField(
                                                                appointmentChlidListItem,
                                                                r'''$.status''',
                                                              ) ==
                                                              'Pending') {
                                                            return '#E7E820';
                                                          } else if (getJsonField(
                                                                appointmentChlidListItem,
                                                                r'''$.status''',
                                                              ) ==
                                                              'In Cabin') {
                                                            return '#F1601C';
                                                          } else if (getJsonField(
                                                                appointmentChlidListItem,
                                                                r'''$.status''',
                                                              ) ==
                                                              'Delayed') {
                                                            return '#9D9D9D';
                                                          } else if (getJsonField(
                                                                appointmentChlidListItem,
                                                                r'''$.status''',
                                                              ) ==
                                                              'Canceled') {
                                                            return '#E94444';
                                                          } else if (getJsonField(
                                                                appointmentChlidListItem,
                                                                r'''$.status''',
                                                              ) ==
                                                              'Done') {
                                                            return '#CA1CD721';
                                                          } else {
                                                            return 'Black';
                                                          }
                                                        }(),
                                                        defaultColor:
                                                            Colors.black,
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          color:
                                                              Color(0x32000000),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      0, 8, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                  appointmentChlidListItem,
                                                                  r'''$.no''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            getJsonField(
                                                                              appointmentChlidListItem,
                                                                              r'''$.First_Name''',
                                                                            ).toString(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                appointmentChlidListItem,
                                                                                r'''$.Last_Name''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        getJsonField(
                                                                          appointmentChlidListItem,
                                                                          r'''$.status''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            getJsonField(
                                                                              appointmentChlidListItem,
                                                                              r'''$.start_time''',
                                                                            ).toString(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                          AutoSizeText(
                                                                            getJsonField(
                                                                              appointmentChlidListItem,
                                                                              r'''$.end_time''',
                                                                            ).toString(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse>(
                                  future: (_apiRequestCompleter2 ??= Completer<
                                          ApiCallResponse>()
                                        ..complete(DoctorsTimeslotListCall.call(
                                          id: getJsonField(
                                            FFAppState().LoggedInUserData,
                                            r'''$.doctor_id''',
                                          ).toString(),
                                        )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnDoctorsTimeslotListResponse =
                                        snapshot.data!;
                                    return RefreshIndicator(
                                      onRefresh: () async {
                                        setState(
                                            () => _apiRequestCompleter2 = null);
                                        await waitForApiRequestCompleter2();
                                      },
                                      child: SingleChildScrollView(
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                final timeslotChild =
                                                    getJsonField(
                                                  columnDoctorsTimeslotListResponse
                                                      .jsonBody,
                                                  r'''$.data''',
                                                ).toList();
                                                if (timeslotChild.isEmpty) {
                                                  return Center(
                                                    child: Image.asset(
                                                      'assets/images/no_timeslots_are_available.png',
                                                      width: 120,
                                                      height: 50,
                                                    ),
                                                  );
                                                }
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      timeslotChild.length,
                                                  itemBuilder: (context,
                                                      timeslotChildIndex) {
                                                    final timeslotChildItem =
                                                        timeslotChild[
                                                            timeslotChildIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 4, 16, 8),
                                                      child: AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 420),
                                                        curve: Curves.linear,
                                                        width: double.infinity,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4,
                                                              color: Color(
                                                                  0x32000000),
                                                              offset:
                                                                  Offset(0, 2),
                                                            )
                                                          ],
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xCA1CD721),
                                                              Color(0xCC19D34C)
                                                            ],
                                                            stops: [0, 1],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    0, -1),
                                                            end:
                                                                AlignmentDirectional(
                                                                    0, 1),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(0),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          3,
                                                                          8,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    getJsonField(
                                                                      timeslotChildItem,
                                                                      r'''$.no''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Available',
                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                getJsonField(
                                                                                  timeslotChildItem,
                                                                                  r'''$.start_time''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                              ),
                                                                              AutoSizeText(
                                                                                getJsonField(
                                                                                  timeslotChildItem,
                                                                                  r'''$.end_time''',
                                                                                ).toString().maybeHandleOverflow(maxChars: 20),
                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFFCFCFCF),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () async {
                                  context.pushNamed('AboutUs');
                                },
                                child: Text(
                                  'About Us',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                              Text(
                                'Contact Us',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 11,
                                    ),
                              ),
                              Text(
                                'Doctors',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 11,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 30,
                              icon: FaIcon(
                                FontAwesomeIcons.instagram,
                                color: Color(0xFFC04C73),
                                size: 20,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 30,
                              icon: FaIcon(
                                FontAwesomeIcons.facebookSquare,
                                color: Color(0xFF0D82BE),
                                size: 20,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 30,
                              icon: FaIcon(
                                FontAwesomeIcons.twitter,
                                color: Color(0xFF0077F8),
                                size: 20,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                        Text(
                          'EVE |  2023 All rights reserved',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future waitForApiRequestCompleter1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleter2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

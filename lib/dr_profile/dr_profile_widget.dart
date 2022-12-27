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

class DrProfileWidget extends StatefulWidget {
  const DrProfileWidget({
    Key? key,
    this.drID,
  }) : super(key: key);

  final String? drID;

  @override
  _DrProfileWidgetState createState() => _DrProfileWidgetState();
}

class _DrProfileWidgetState extends State<DrProfileWidget> {
  Completer<ApiCallResponse>? _apiRequestCompleter;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: DoctorDetailViewCall.call(
        id: widget.drID,
      ),
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
        final drProfileDoctorDetailViewResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF1F4F8),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 240,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width,
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.08,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF57E6C3),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 50,
                                  icon: Icon(
                                    Icons.arrow_back_outlined,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('SearchList');
                                  },
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  context.pushNamed('HomePage');
                                },
                                child: Text(
                                  'EVE',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 25,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 160,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 2, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                'https://picsum.photos/seed/18/600',
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.15, 0.85),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        5,
                                                                        0),
                                                            child: Text(
                                                              getJsonField(
                                                                drProfileDoctorDetailViewResponse
                                                                    .jsonBody,
                                                                r'''$.data.First_Name''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                              drProfileDoctorDetailViewResponse
                                                                  .jsonBody,
                                                              r'''$.data.Last_Name''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 18,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, -0.2),
                                                        child: Text(
                                                          getJsonField(
                                                            drProfileDoctorDetailViewResponse
                                                                .jsonBody,
                                                            r'''$.data.speciality''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              drProfileDoctorDetailViewResponse
                                                                  .jsonBody,
                                                              r'''$.data.about''',
                                                            )
                                                                .toString()
                                                                .maybeHandleOverflow(
                                                                    maxChars:
                                                                        25),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 11,
                                                                ),
                                                          ),
                                                          Text(
                                                            '...',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ],
                                                      ),
                                                      AutoSizeText(
                                                        getJsonField(
                                                          drProfileDoctorDetailViewResponse
                                                              .jsonBody,
                                                          r'''$.data.timing''',
                                                        ).toString(),
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 13,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Address:- ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          getJsonField(
                                                            drProfileDoctorDetailViewResponse
                                                                .jsonBody,
                                                            r'''$.data.home_address''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Fees:- ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Text(
                                                          getJsonField(
                                                            drProfileDoctorDetailViewResponse
                                                                .jsonBody,
                                                            r'''$.data.fee''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: Divider(
                                            thickness: 1,
                                            color: Color(0xFF848484),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 35,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.95, 0),
                                    child: Text(
                                      'Appointments :-',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 24,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    dateTimeFormat(
                                        'MMMEd', getCurrentTimestamp),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.62,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 1,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: AlignmentDirectional(-0.050000000000000044, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FutureBuilder<ApiCallResponse>(
                                  future: (_apiRequestCompleter ??= Completer<
                                          ApiCallResponse>()
                                        ..complete(DoctorAppointmentsCall.call(
                                          id: widget.drID,
                                        )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final listViewDoctorAppointmentsResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final appointmentListChild =
                                            getJsonField(
                                          listViewDoctorAppointmentsResponse
                                              .jsonBody,
                                          r'''$.data''',
                                        ).toList();
                                        if (appointmentListChild.isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/No_Appointments.png',
                                              width: 100,
                                              height: 100,
                                            ),
                                          );
                                        }
                                        return RefreshIndicator(
                                          onRefresh: () async {
                                            setState(() =>
                                                _apiRequestCompleter = null);
                                            await waitForApiRequestCompleter();
                                          },
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                appointmentListChild.length,
                                            itemBuilder: (context,
                                                appointmentListChildIndex) {
                                              final appointmentListChildItem =
                                                  appointmentListChild[
                                                      appointmentListChildIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 4, 16, 8),
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 420),
                                                  curve: Curves.elasticOut,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  height: 65,
                                                  decoration: BoxDecoration(
                                                    color: colorFromCssString(
                                                      () {
                                                        if (getJsonField(
                                                              appointmentListChildItem,
                                                              r'''$.status''',
                                                            ) ==
                                                            'Pending') {
                                                          return '#E7E820';
                                                        } else if (getJsonField(
                                                              appointmentListChildItem,
                                                              r'''$.status''',
                                                            ) ==
                                                            'In Cabin') {
                                                          return '#F1601C';
                                                        } else if (getJsonField(
                                                              appointmentListChildItem,
                                                              r'''$.status''',
                                                            ) ==
                                                            'Delayed') {
                                                          return '#9D9D9D';
                                                        } else if (getJsonField(
                                                              appointmentListChildItem,
                                                              r'''$.status''',
                                                            ) ==
                                                            'Canceled') {
                                                          return '#E94444';
                                                        } else if (getJsonField(
                                                              appointmentListChildItem,
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
                                                                .fromSTEB(
                                                                    8, 0, 8, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              getJsonField(
                                                                appointmentListChildItem,
                                                                r'''$.no''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          getJsonField(
                                                                            appointmentListChildItem,
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
                                                                              appointmentListChildItem,
                                                                              r'''$.Last_Name''',
                                                                            ).toString(),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    if (() {
                                                                      if (getJsonField(
                                                                            appointmentListChildItem,
                                                                            r'''$.status''',
                                                                          ) ==
                                                                          'In Cabin') {
                                                                        return true;
                                                                      } else if (getJsonField(
                                                                            appointmentListChildItem,
                                                                            r'''$.status''',
                                                                          ) ==
                                                                          'Delayed') {
                                                                        return true;
                                                                      } else {
                                                                        return true;
                                                                      }
                                                                    }())
                                                                      Text(
                                                                        getJsonField(
                                                                          appointmentListChildItem,
                                                                          r'''$.status''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          getJsonField(
                                                                            appointmentListChildItem,
                                                                            r'''$.start_time''',
                                                                          ).toString(),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                        AutoSizeText(
                                                                          getJsonField(
                                                                            appointmentListChildItem,
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
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FutureBuilder<ApiCallResponse>(
                                  future: DoctorsTimeslotListCall.call(
                                    id: widget.drID,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final timeslotListDoctorsTimeslotListResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final timeSlotListChild = getJsonField(
                                          timeslotListDoctorsTimeslotListResponse
                                              .jsonBody,
                                          r'''$.data''',
                                        ).toList();
                                        if (timeSlotListChild.isEmpty) {
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
                                          scrollDirection: Axis.vertical,
                                          itemCount: timeSlotListChild.length,
                                          itemBuilder: (context,
                                              timeSlotListChildIndex) {
                                            final timeSlotListChildItem =
                                                timeSlotListChild[
                                                    timeSlotListChildIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 4, 16, 8),
                                              child: InkWell(
                                                onTap: () async {
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1));
                                                  if (FFAppState().Token !=
                                                          null &&
                                                      FFAppState().Token !=
                                                          '') {
                                                    context.pushNamed(
                                                      'AppointmentBookingPage',
                                                      queryParams: {
                                                        'timeslotID':
                                                            serializeParam(
                                                          getJsonField(
                                                            timeSlotListChildItem,
                                                            r'''$''',
                                                          ),
                                                          ParamType.JSON,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    context
                                                        .pushNamed('LoginIn');
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 420),
                                                  curve: Curves.linear,
                                                  width: double.infinity,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4,
                                                        color:
                                                            Color(0x32000000),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xCA1CD721),
                                                        Color(0xCC19D34C)
                                                      ],
                                                      stops: [0, 1],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0, -1),
                                                      end: AlignmentDirectional(
                                                          0, 1),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 3, 8, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              getJsonField(
                                                                timeSlotListChildItem,
                                                                r'''$.no''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Available',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          getJsonField(
                                                                            timeSlotListChildItem,
                                                                            r'''$.start_time''',
                                                                          ).toString(),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                        AutoSizeText(
                                                                          getJsonField(
                                                                            timeSlotListChildItem,
                                                                            r'''$.end_time''',
                                                                          ).toString().maybeHandleOverflow(
                                                                              maxChars: 20),
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
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFFCFCFCF),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'About Us',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 11,
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppointmentBookingPageWidget extends StatefulWidget {
  const AppointmentBookingPageWidget({
    Key? key,
    this.status,
    this.mode,
    this.amount,
    this.bookedthrough,
    this.paymentMode,
    this.timeslotID,
  }) : super(key: key);

  final String? status;
  final String? mode;
  final String? amount;
  final String? bookedthrough;
  final String? paymentMode;
  final dynamic timeslotID;

  @override
  _AppointmentBookingPageWidgetState createState() =>
      _AppointmentBookingPageWidgetState();
}

class _AppointmentBookingPageWidgetState
    extends State<AppointmentBookingPageWidget> {
  ApiCallResponse? apiResulti8s;
  String? modeValue;
  String? paymentValue;
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF95A1AC),
            size: 24,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Booking',
          style: FlutterFlowTheme.of(context).subtitle1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0x3600000F),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 0,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 4, 16, 4),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Date :- ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                                Text(
                                                  getJsonField(
                                                    widget.timeslotID,
                                                    r'''$.appointment_date''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 4, 16, 4),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'No. ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                                Text(
                                                  getJsonField(
                                                    widget.timeslotID,
                                                    r'''$.no''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Payment Mode',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 0),
                                      child: FlutterFlowDropDown<String>(
                                        initialOption: paymentValue ??= 'Cash',
                                        options: ['Cash', 'Online', 'Team 3'],
                                        onChanged: (val) =>
                                            setState(() => paymentValue = val),
                                        width: 150,
                                        height: 60,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 15,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        borderWidth: 2,
                                        borderRadius: 8,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            24, 4, 12, 4),
                                        hidesUnderline: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Text(
                                      'Mode',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: FlutterFlowDropDown<String>(
                                      initialOption: modeValue ??= 'In Clinic',
                                      options: [
                                        'In Clinic',
                                        'online(Video Calling)',
                                        'Team 3'
                                      ],
                                      onChanged: (val) =>
                                          setState(() => modeValue = val),
                                      width: 150,
                                      height: 60,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 15,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderWidth: 2,
                                      borderRadius: 8,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          24, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Timing - ',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: Text(
                          getJsonField(
                            widget.timeslotID,
                            r'''$.start_time''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: Text(
                          '-',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Text(
                        getJsonField(
                          widget.timeslotID,
                          r'''$.end_time''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF696969),
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                      Text(
                        getJsonField(
                          widget.timeslotID,
                          r'''$.dr.fee''',
                        ).toString(),
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tax',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Total',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                      Text(
                        getJsonField(
                          widget.timeslotID,
                          r'''$.dr.fee''',
                        ).toString(),
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                      Text(
                        getJsonField(
                          widget.timeslotID,
                          r'''$.dr.fee''',
                        ).toString(),
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ],
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    apiResulti8s = await CreateAppointmentCall.call(
                      startTime: getJsonField(
                        widget.timeslotID,
                        r'''$.start_time''',
                      ).toString(),
                      endTime: getJsonField(
                        widget.timeslotID,
                        r'''$.end_time''',
                      ).toString(),
                      no: getJsonField(
                        widget.timeslotID,
                        r'''$.no''',
                      ).toString(),
                      appointmentDate: getJsonField(
                        widget.timeslotID,
                        r'''$.appointment_date''',
                      ).toString(),
                      patientName: getJsonField(
                        FFAppState().LoggedInUserData,
                        r'''$.id''',
                      ).toString(),
                      doctorsProfile: getJsonField(
                        widget.timeslotID,
                        r'''$.dr.id''',
                      ).toString(),
                      timeslots: getJsonField(
                        widget.timeslotID,
                        r'''$.id''',
                      ).toString(),
                      firstName: getJsonField(
                        FFAppState().LoggedInUserData,
                        r'''$.first_name''',
                      ).toString(),
                      lastName: getJsonField(
                        FFAppState().LoggedInUserData,
                        r'''$.last_name''',
                      ).toString(),
                      bookedThrough: 'Self',
                      status: 'Pending',
                      mode: modeValue,
                      paymentMode: paymentValue,
                      amount: getJsonField(
                        widget.timeslotID,
                        r'''$.dr.fee''',
                      ).toString(),
                      careCenter: getJsonField(
                        widget.timeslotID,
                        r'''$.dr.CareCenter''',
                      ).toString(),
                    );

                    context.pushNamed(
                      'BookingConfirm',
                      queryParams: {
                        'doctorId': serializeParam(
                          getJsonField(
                            widget.timeslotID,
                            r'''$.dr.id''',
                          ).toString(),
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 10),
                        ),
                      },
                    );

                    setState(() {});
                  },
                  text: 'Book Appointment',
                  options: FFButtonOptions(
                    width: 320,
                    height: 60,
                    color: Color(0xFF3726D7),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
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

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchListWidget extends StatefulWidget {
  const SearchListWidget({
    Key? key,
    this.searchedText,
  }) : super(key: key);

  final String? searchedText;

  @override
  _SearchListWidgetState createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final textFieldKey = GlobalKey();
  TextEditingController? textController;
  String? textFieldSelectedOption;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().SearchActive = false;
      });
    });

    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: AllDoctorsListCall.call(),
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
        final searchListAllDoctorsListResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 54,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Align(
              alignment: AlignmentDirectional(-1, 0),
              child: InkWell(
                onTap: () async {
                  context.pushNamed(
                    'HomePage',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Text(
                  'EVE',
                  style: FlutterFlowTheme.of(context).title3,
                ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Autocomplete<String>(
                                initialValue: TextEditingValue(),
                                optionsBuilder: (textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<String>.empty();
                                  }
                                  return ['Option 1'].where((option) {
                                    final lowercaseOption =
                                        option.toLowerCase();
                                    return lowercaseOption.contains(
                                        textEditingValue.text.toLowerCase());
                                  });
                                },
                                optionsViewBuilder:
                                    (context, onSelected, options) {
                                  return AutocompleteOptionsList(
                                    textFieldKey: textFieldKey,
                                    textController: textController!,
                                    options: options.toList(),
                                    onSelected: onSelected,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    textHighlightStyle: TextStyle(),
                                    elevation: 4,
                                    optionBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    optionHighlightColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    maxHeight: 200,
                                  );
                                },
                                onSelected: (String selection) {
                                  setState(() =>
                                      textFieldSelectedOption = selection);
                                  FocusScope.of(context).unfocus();
                                },
                                fieldViewBuilder: (
                                  context,
                                  textEditingController,
                                  focusNode,
                                  onEditingComplete,
                                ) {
                                  textController = textEditingController;
                                  return TextFormField(
                                    key: textFieldKey,
                                    controller: textEditingController,
                                    focusNode: focusNode,
                                    onEditingComplete: onEditingComplete,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'textController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        setState(() {
                                          FFAppState().SearchActive = true;
                                        });
                                      },
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: widget.searchedText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    maxLines: null,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 44,
                                icon: Icon(
                                  Icons.search_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: Text(
                          'Your Search Results :-',
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                          maxHeight: MediaQuery.of(context).size.height * 1,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (FFAppState().SearchActive == false)
                              Builder(
                                builder: (context) {
                                  final drListVerticalChild = getJsonField(
                                    searchListAllDoctorsListResponse.jsonBody,
                                    r'''$.data''',
                                  ).toList();
                                  if (drListVerticalChild.isEmpty) {
                                    return Image.network(
                                      '',
                                      height: 200,
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: drListVerticalChild.length,
                                    itemBuilder:
                                        (context, drListVerticalChildIndex) {
                                      final drListVerticalChildItem =
                                          drListVerticalChild[
                                              drListVerticalChildIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 12, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'DrProfile',
                                              queryParams: {
                                                'drID': serializeParam(
                                                  getJsonField(
                                                    drListVerticalChildItem,
                                                    r'''$.id''',
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
                                          child: Container(
                                            width: 200,
                                            height: 110,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  color: Color(0x34090F13),
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Image.network(
                                                        getJsonField(
                                                          drListVerticalChildItem,
                                                          r'''$.image''',
                                                        ),
                                                        width: 90,
                                                        height: 75,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  getJsonField(
                                                                    drListVerticalChildItem,
                                                                    r'''$.First_Name''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      drListVerticalChildItem,
                                                                      r'''$.Last_Name''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              getJsonField(
                                                                drListVerticalChildItem,
                                                                r'''$.speciality''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Text(
                                                              getJsonField(
                                                                drListVerticalChildItem,
                                                                r'''$.timing''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                            Text(
                                                              getJsonField(
                                                                drListVerticalChildItem,
                                                                r'''$.home_address''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        10,
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
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            if (FFAppState().SearchActive == true)
                              Builder(
                                builder: (context) {
                                  final drListSearchResultChild = getJsonField(
                                    searchListAllDoctorsListResponse.jsonBody,
                                    r'''$.data''',
                                  ).toList();
                                  if (drListSearchResultChild.isEmpty) {
                                    return Image.network(
                                      '',
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: drListSearchResultChild.length,
                                    itemBuilder: (context,
                                        drListSearchResultChildIndex) {
                                      final drListSearchResultChildItem =
                                          drListSearchResultChild[
                                              drListSearchResultChildIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 12, 12),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'DrProfile',
                                              queryParams: {
                                                'drID': serializeParam(
                                                  getJsonField(
                                                    drListSearchResultChildItem,
                                                    r'''$.id''',
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
                                          child: Container(
                                            width: 200,
                                            height: 110,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  color: Color(0x34090F13),
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Image.network(
                                                        'https://picsum.photos/seed/877/600',
                                                        width: 100,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    getJsonField(
                                                                      drListSearchResultChildItem,
                                                                      r'''$.First_Name''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                  Text(
                                                                    getJsonField(
                                                                      drListSearchResultChildItem,
                                                                      r'''$.Last_Name''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                getJsonField(
                                                                  drListSearchResultChildItem,
                                                                  r'''$.speciality''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                              Text(
                                                                getJsonField(
                                                                  drListSearchResultChildItem,
                                                                  r'''$.timing''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                              Text(
                                                                getJsonField(
                                                                  drListSearchResultChildItem,
                                                                  r'''$.home_address''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          11,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

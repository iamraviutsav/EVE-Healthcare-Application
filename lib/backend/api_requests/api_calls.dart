import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LogInCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) {
    final body = '''
{
  "username": "${username}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LogIn',
      apiUrl: 'https://evehealthcarecenter.com/RestFrameWork_login/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class AllDoctorsListCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'AllDoctorsList',
      apiUrl: 'https://evehealthcarecenter.com/Doctor_Views/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class DoctorDetailViewCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DoctorDetailView',
      apiUrl: 'https://evehealthcarecenter.com/Doctor_Views/${id}/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class DoctorAppointmentsCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DoctorAppointments',
      apiUrl: 'https://evehealthcarecenter.com/DrsAppointments_Views/${id}/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class SignUpCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? firstName = '',
    String? lastName = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}",
  "First_Name": "${firstName}",
  "Last_Name": "${lastName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignUp',
      apiUrl: 'https://evehealthcarecenter.com/RestFrameWork_Signup/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class UsersAppointmentListCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'UsersAppointmentList',
      apiUrl:
          'https://evehealthcarecenter.com/Appointments_of_Users_Views/${id}/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class DoctorsTimeslotListCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DoctorsTimeslotList',
      apiUrl: 'https://evehealthcarecenter.com/DrsTimeslots_Views/${id}/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class CreateAppointmentCall {
  static Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? no = '',
    String? status = '',
    String? mode = '',
    String? amount = '',
    String? bookedThrough = '',
    String? paymentMode = '',
    String? startTime = '',
    String? endTime = '',
    String? appointmentDate = '',
    String? patientName = '',
    String? doctorsProfile = '',
    String? careCenter = '',
    String? timeslots = '',
  }) {
    final body = '''
{
  "First_Name": "${firstName}",
  "Last_Name": "${lastName}",
  "no": "${no}",
  "status": "${status}",
  "mode": "${mode}",
  "Amount": "${amount}",
  "booked_through": "Self",
  "payment_mode": "${paymentMode}",
  "start_time": "${startTime}",
  "end_time": "${endTime}",
  "appointment_date": "${appointmentDate}",
  "patient_name": "${patientName}",
  "doctors_profile": "${doctorsProfile}",
  "CareCenter": "${careCenter}",
  "timeslots": "${timeslots}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateAppointment',
      apiUrl: 'https://evehealthcarecenter.com/AppointmentCreation_Views/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class UsersUpcommingAppointmentsCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'UsersUpcommingAppointments',
      apiUrl:
          'https://evehealthcarecenter.com/Upcomming_Appointments_of_Users_Views/${id}/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class AppointmentUpdateCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? status = '',
  }) {
    final body = '''
{
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AppointmentUpdate',
      apiUrl: 'https://evehealthcarecenter.com/Appointment_Views/${id}/',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}

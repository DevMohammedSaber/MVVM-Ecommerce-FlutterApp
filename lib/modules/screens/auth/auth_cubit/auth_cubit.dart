import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app_api_cubit/shared/network/sharedpreferences_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool? remember = false;
  final List<String?> errors = [];

  void errorAdd({String? error}) {
    if (!errors.contains(error)) {
      errors.add(error);
    }
  }

  void errorRemove({String? error}) {
    if (errors.contains(error)) {
      errors.remove(error);
    }
  }

  void register(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    emit(AuthRegisterLoadingState());
    http.Response response = await http
        .post(Uri.parse('https://student.valuxapps.com/api/register'), body: {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    }, headers: {
      'lang': 'en',
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['status'] == true) {
        debugPrint("Response is : $data");
        SharedpreferencesService.setData(
            key: 'token', value: data['data']['token']);
        emit(AuthRegisterSuccessState());
      } else {
        debugPrint("Response is : $data");
        emit(AuthRegisterFaliureState(message: data['message']));
      }
    }
  }

  void login({required String email, required String password}) async {
    emit(AuthLoginLoadingState());
    http.Response response = await http
        .post(Uri.parse('https://student.valuxapps.com/api/login'), body: {
      'email': email,
      'password': password,
    }, headers: {
      'lang': 'en',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['status'] == true) {
        debugPrint("Response is : $data");
        SharedpreferencesService.setData(
            key: 'token', value: data['data']['token']);
        emit(AuthLoginSuccessState());
      } else {
        debugPrint("Response is : $data");
        emit(AuthLoginFaliureState(message: data['message']));
      }
    }
  }
}

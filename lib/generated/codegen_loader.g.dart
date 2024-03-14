// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "registration": "Registration",
  "login": "Login",
  "register": "Register",
  "login_button": "Login",
  "email": "Email",
  "please_enter_your_email": "Please enter your email",
  "phone_Number": "Phone Number",
  "please_enter_your_phone_number": "Please enter your phone number",
  "username_email": "Username / Email",
  "password": "Password",
  "please_enter_your_password": "Please enter your password",
  "passwords_do_not_match": "Passwords do not match"
};
static const Map<String,dynamic> kz = {
  "registration": "Тіркеу",
  "login": "Кіру",
  "register": "Тіркелу",
  "login_button": "Кіру",
  "email": "Пошта",
  "please_enter_your_email": "Электрондық поштаңызды енгізіңіз",
  "phone_Number": "Телефон нөмірі ",
  "please_enter_your_phone_number": "Телефон нөміріңізді енгізіңіз",
  "username_email": "Пайдаланушы аты / Электрондық пошта",
  "password": "Құпия сөз",
  "please_enter_your_password": "Құпия сөзіңізді енгізіңіз",
  "passwords_do_not_match": "Құпия сөз сәйкес келмеді"
};
static const Map<String,dynamic> ru = {
  "registration": "Регистрация",
  "login": "Логин",
  "register": "Регистр",
  "login_button": "Логин",
  "email": "Почта",
  "please_enter_your_email": "Пожалуйста введите вашу почту",
  "phone_Number": "Номер телефона",
  "please_enter_your_phone_number": "Пожалуйста введите ваш номер телефона",
  "username_email": "Имя пользователя / Почта",
  "password": "Пароль",
  "please_enter_your_password": "Пожалуйста введите ваш пароль",
  "passwords_do_not_match": "Пароли не совпадают"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "kz": kz, "ru": ru};
}

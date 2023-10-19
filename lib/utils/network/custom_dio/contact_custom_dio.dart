import 'package:dio/dio.dart';
import 'package:flutter_desafio_contato_app/utils/network/interceptors/contact_dio_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ContactCustomDio {
  final _dio = Dio();

  Dio get dio => _dio;

  ContactCustomDio() {
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.baseUrl = dotenv.get('BASEURL');
    _dio.interceptors.add(ContactDioInterceptor());
  }
}

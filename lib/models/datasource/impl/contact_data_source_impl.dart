import 'package:flutter_desafio_contato_app/models/datasource/contact_data_source.dart';
import 'package:flutter_desafio_contato_app/models/exceptions/data_source_exception.dart';
import 'package:flutter_desafio_contato_app/utils/methods/convert_dynamic_to_map.dart';
import 'package:flutter_desafio_contato_app/utils/network/custom_dio/contact_custom_dio.dart';

import '../../../utils/constants/api.dart';

class ContactDataSourceImpl implements ContactDataSource {
  final ContactCustomDio customDio;

  const ContactDataSourceImpl({required this.customDio});

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    try {
      final result = await customDio.dio.get(url);
      final list = result.data['results'] as List;
      return list.map((e) => convertDynamicToMap(e)).toList();
    } catch (e) {
      throw DataSourceException(message: e.toString());
    }
  }

  @override
  Future<void> remove(String id) async {
    try {
      await customDio.dio.delete('$url/$id');
    } catch (e) {
      throw DataSourceException(message: e.toString());
    }
  }

  @override
  Future<void> save(Map<String, dynamic> data) async {
    try {
      await customDio.dio.post(url, data: data);
    } catch (e) {
      throw DataSourceException(message: e.toString());
    }
  }

  @override
  Future<void> update(String id, Map<String, dynamic> data) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

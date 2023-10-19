import 'package:flutter_desafio_contato_app/models/datasource/impl/contact_data_source_impl.dart';
import 'package:flutter_desafio_contato_app/utils/network/custom_dio/contact_custom_dio.dart';
import 'package:get_it/get_it.dart';

import 'models/datasource/contact_data_source.dart';

final sl = GetIt.instance;

init() {
  //* DATASOURCE
  sl.registerLazySingleton<ContactDataSource>(
    () => ContactDataSourceImpl(
      customDio: sl(),
    ),
  );

  //* HTTP
  sl.registerLazySingleton(
    () => ContactCustomDio(),
  );
}

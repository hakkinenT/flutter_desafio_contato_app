import 'package:flutter_desafio_contato_app/controllers/contact_controller.dart';
import 'package:flutter_desafio_contato_app/models/datasource/impl/contact_data_source_impl.dart';
import 'package:flutter_desafio_contato_app/models/repositories/impl/contact_repository_impl.dart';
import 'package:flutter_desafio_contato_app/utils/network/custom_dio/contact_custom_dio.dart';
import 'package:get_it/get_it.dart';

import 'models/datasource/contact_data_source.dart';
import 'models/repositories/contact_repository.dart';

final sl = GetIt.instance;

init() {
  //* CONTROLLER
  sl.registerFactory(
    () => ContactController(
      repository: sl(),
    ),
  );

  //* REPOSITORY
  sl.registerLazySingleton<ContactRepository>(
    () => ContactRepositoryImpl(
      contactDataSource: sl(),
    ),
  );

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

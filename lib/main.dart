import 'package:flutter/material.dart';
import 'package:flutter_desafio_contato_app/controllers/contact_controller.dart';
import 'package:flutter_desafio_contato_app/views/pages/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'injection_container.dart';
import 'themes/contact_app_color_scheme.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<ContactController>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        home: const HomePage(),
      ),
    );
  }
}

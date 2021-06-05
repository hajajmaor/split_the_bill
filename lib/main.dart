import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:split_the_bill/constants.dart' show kAppName;
import 'package:split_the_bill/models/check.dart' show CheckAdapter;
import 'package:split_the_bill/models/participant.dart';
import 'package:split_the_bill/pages/main_page.dart' show MainPage;
import 'package:split_the_bill/providers/participants_provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ParticipantAdapter());
  Hive.registerAdapter(CheckAdapter());

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

final participantProvider =
    ChangeNotifierProvider((ref) => ParticipantProvider());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.cyan,
      ),
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MainPage(),
    );
  }
}

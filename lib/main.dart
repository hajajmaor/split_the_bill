import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:split_the_bill/constants.dart' show kAppName;
import 'package:split_the_bill/models/check.dart' show CheckAdapter;
import 'package:split_the_bill/models/participant.dart'
    show Participant, ParticipantAdapter;
import 'package:split_the_bill/pages/main_page.dart' show MainPage;

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

final participantsProvider = Provider<List<Participant>>(
  (ref) => [],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MainPage(),
    );
  }
}

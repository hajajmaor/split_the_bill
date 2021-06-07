import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:split_the_bill/constants.dart' show kAppName, kTempParticipants;
import 'package:split_the_bill/models/check.dart' show CheckAdapter;
import 'package:split_the_bill/models/participant.dart';
import 'package:split_the_bill/pages/main_page.dart' show MainPage;
import 'package:split_the_bill/providers/participants_provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ParticipantAdapter());
  Hive.registerAdapter(CheckAdapter());
  await Hive.openBox<Participant>(kTempParticipants);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final themeMode = StateProvider<ThemeMode>(
  (ref) => kIsWeb ? ThemeMode.light : ThemeMode.system,
);
final participantsProvider =
    ChangeNotifierProvider<ParticipantProvider>((_) => ParticipantProvider());
// late Provider<List<Participant>> participantsProvider;
//     Provider<List<Participant>>(
//   (ref)
//       // final participantsFunctions = ref.read(participantFunctions).state
//       //   ..addListener((state) {
//       //     print(state.length);
//       //   });
//       // return participantsFunctions.currentList;
//       =>
//       ref.read(participantFunctions).state.state,
// );

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      themeMode: watch(themeMode).state,
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

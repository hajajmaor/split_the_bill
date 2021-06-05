import 'package:flutter/material.dart';
import 'package:split_the_bill/constants.dart' show kAppName;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:split_the_bill/main.dart';
import 'package:split_the_bill/models/participant.dart';
import 'package:split_the_bill/views/app_drawer.dart' show AppDrawer;
import 'package:split_the_bill/views/new_bill_body.dart' show NewBillBody;

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(kAppName),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: "Save current bill",
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          watch(participantsProvider).add(Participant());
        },
        tooltip: "add new participant",
        child: const Icon(Icons.add),
      ),
      body: const NewBillBody(),
    );
  }
}

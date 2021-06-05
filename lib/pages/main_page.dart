import 'package:flutter/material.dart';
import 'package:split_the_bill/constants.dart' show kAppName;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:split_the_bill/main.dart';
import 'package:split_the_bill/models/participant.dart';
import 'package:split_the_bill/views/app_drawer.dart' show AppDrawer;
import 'package:split_the_bill/views/main_page/new_bill_body.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(
          kAppName,
          // style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: "Save current bill",
            icon: const Icon(Icons.save),
          ),
          IconButton(
            tooltip: "delete current participants",
            onPressed: () => context.read(pro).reset(),
            icon: const Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          context.read(pro).add(Participant());
        },
        tooltip: "add new participant",
        child: const Icon(Icons.add),
      ),
      body: const NewBillBody(),
    );
  }
}

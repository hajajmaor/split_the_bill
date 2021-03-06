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
      resizeToAvoidBottomInset: true,
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(
          kAppName,
          // style: TextStyle(color: Colors.white),
        ),
        actions: [
          if (context.read(themeMode).state == ThemeMode.system)
            Container()
          else
            IconButton(
              tooltip:
                  'Switch to ${context.read(themeMode).state == ThemeMode.light ? 'dark' : 'light'} mode',
              onPressed: () {
                context.read(themeMode).state =
                    context.read(themeMode).state == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              },
              icon: Icon(context.read(themeMode).state == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
            ),
          IconButton(
            onPressed: () {},
            tooltip: "Save current bill",
            icon: const Icon(Icons.save),
          ),
          IconButton(
            tooltip: "delete current participants",
            onPressed: () => context.read(participantsProvider).reset(),
            icon: const Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          context.read(participantsProvider).add(Participant());
        },
        tooltip: "add new participant",
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const Expanded(
            child: NewBillBody(),
          ),

          ///total bill
          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.all(16),
            height: 70,
            child: Center(
              child: Consumer(
                builder: (_, watch, __) {
                  final _part = watch(participantsProvider);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('Total bill'),
                          Text('${_part.getTotalBill}')
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Total bill+Tip'),
                          Text(
                            (_part.getTotalBill * 1.1).toStringAsFixed(1),
                          )
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

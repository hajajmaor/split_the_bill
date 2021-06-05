import 'package:flutter/material.dart';
import 'package:split_the_bill/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Text(
                  kAppName,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

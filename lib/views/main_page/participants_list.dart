import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:split_the_bill/main.dart';
import 'package:split_the_bill/views/participant_row.dart';

class ParticipantsList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _participants = watch(pro);
    return ListView.builder(
      itemCount: _participants.currentList.length,
      itemBuilder: (BuildContext _, int index) => ParticipantRow(
        part: _participants.currentList[index],
      ),
    );
  }
}

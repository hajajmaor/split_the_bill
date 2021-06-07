import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:split_the_bill/main.dart';
import 'package:split_the_bill/models/participant.dart';
import 'package:split_the_bill/views/participant_row.dart';

class ParticipantsList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // return ValueListenableBuilder<Box<Participant>>(
    //   valueListenable: Hive.box<Participant>(kTempParticipants).listenable(),
    //   builder: (_, box, __) {
    //     final items = box.toMap();
    //     final keys = box.keys.toList();
    //     return ListView.builder(
    //       itemCount: keys.length,
    //       itemBuilder: (BuildContext _, int index) => ParticipantRow(
    //         part: items[keys[index]]!,
    //         // index: keys[index] as int,
    //       ),
    //     );
    //   },
    // );
    final List<Participant> _participants =
        watch(participantsProvider).currentList;
    // print(_participants.length);

    return ListView.builder(
      itemCount: _participants.length,
      itemBuilder: (context, index) =>
          ParticipantRow(part: _participants[index]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:split_the_bill/main.dart';
import 'package:split_the_bill/models/participant.dart';

class ParticipantsList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _participants = watch(participantsProvider) as List<Participant>;
    return ListView.builder(
      itemCount: _participants.length,
      itemBuilder: (BuildContext _, int index) => Container(
        height: 50,
        color: Colors.red,
      ),
    );
  }
}

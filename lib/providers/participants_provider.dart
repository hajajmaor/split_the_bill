import 'package:riverpod/riverpod.dart';
import 'package:split_the_bill/models/participant.dart';

class ParticipantProvider extends StateNotifier<List<Participant>> {
  ParticipantProvider() : super([]);
  void add(Participant p) {
    state = [...state, p];
  }
}

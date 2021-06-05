import 'package:flutter/foundation.dart';
import 'package:split_the_bill/models/participant.dart';

class ParticipantProvider extends ChangeNotifier {
  late final List<Participant> _participants;
  ParticipantProvider() {
    _participants = <Participant>[];
  }
  void add(Participant p) {
    _participants.add(p);
    notifyListeners();
  }

  void reset() {
    _participants.clear();
    notifyListeners();
  }

  List<Participant> get currentList => _participants;
}

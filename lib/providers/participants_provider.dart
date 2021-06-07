import 'package:flutter/foundation.dart';
import 'package:split_the_bill/models/participant.dart';

// class ParticipantStateProvider extends StateNotifier<List<Participant>> {
//   ParticipantStateProvider({List<Participant>? init}) : super(init ?? []);
//   void add(Participant p) {
//     // print("before change: ${state.length}");
//     state = [p, ...state];
//     // print("after change: ${state.length}");
//   }

//   void remove(Participant p) {
//     state = state.where((part) => part != p).toList();
//   }

//   double get getTotalBill {
//     double sum = 0.0;
//     for (final p in state) {
//       sum += p.howMuch ?? 0;
//     }
//     return sum;
//   }

//   void reset() {
//     state = [];
//   }

//   List<Participant> get currentList => state;
// }

class ParticipantProvider extends ChangeNotifier {
  List<Participant> _participants = <Participant>[];
  void add(Participant p) {
    _participants.add(p);
    notifyListeners();
  }

  void reset() {
    _participants.clear();
    notifyListeners();
  }

  void remove(Participant p) {
    _participants =
        _participants.where((element) => element.id != p.id).toList();
    notifyListeners();

    notifyListeners();
  }

  double get getTotalBill {
    double sum = 0.0;
    for (final p in _participants) {
      sum += p.howMuch ?? 0;
    }
    return sum;
  }

  void removeIndex(int index) {
    _participants.removeAt(index);
    notifyListeners();
  }

  List<Participant> get currentList => _participants;
}

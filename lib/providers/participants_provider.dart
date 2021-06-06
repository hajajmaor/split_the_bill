import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:split_the_bill/models/participant.dart';

class ParticipantStateProvider extends StateNotifier<List<Participant>> {
  ParticipantStateProvider() : super(<Participant>[]);
  void add(Participant p) {
    state = [...state, p];
  }

  void remove(Participant p) {
    state = state.where((part) => part != p).toList();
  }

  double get getTotalBill {
    double sum = 0.0;
    for (final p in state) {
      sum += p.howMuch ?? 0;
    }
    return sum;
  }

  void reset() {
    state = [];
  }

  List<Participant> get currentList => state;
}

// class ParticipantProvider extends ChangeNotifier {
//   late final List<Participant> _participants;
//   ParticipantProvider() {
//     _participants = <Participant>[];
//   }
//   void add(Participant p) {
//     _participants.add(p);
//     notifyListeners();
//   }

//   void reset() {
//     _participants.clear();
//     notifyListeners();
//   }

//   void remove(Participant p) {
//     final index = _participants.indexOf(p);
//     if (index > -1) {
//       _participants.removeAt(index);
//       notifyListeners();
//     }

//     notifyListeners();
//   }

//   double get getTotalBill {
//     double sum = 0.0;
//     for (final p in _participants) {
//       sum += p.howMuch ?? 0;
//     }
//     return sum;
//   }

//   void removeIndex(int index) {
//     _participants.removeAt(index);
//     notifyListeners();
//   }

//   List<Participant> get currentList => _participants;
// }

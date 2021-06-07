import 'dart:convert';

import 'package:hive/hive.dart';

part 'participant.g.dart';

@HiveType(typeId: 1)
class Participant extends HiveObject {
  static int _runIds = 0;
  @HiveField(0)
  String? name;
  @HiveField(1)
  double? howMuch;
  @HiveField(2)
  bool? payed;
  @HiveField(3)
  late final int id;

  Participant({
    this.name,
    this.howMuch,
    this.payed,
  }) : id = ++_runIds;

  Participant copyWith({
    String? name,
    double? howMuch,
    bool? payed,
    int? id,
  }) {
    return Participant(
      name: name ?? this.name,
      howMuch: howMuch ?? this.howMuch,
      payed: payed ?? this.payed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'howMuch': howMuch,
      'payed': payed,
      'id': id,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Participant(name: $name, howMuch: $howMuch, payed: $payed, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Participant &&
        other.name == name &&
        other.howMuch == howMuch &&
        other.payed == payed &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^ howMuch.hashCode ^ payed.hashCode ^ id.hashCode;
  }
}

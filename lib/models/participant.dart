import 'dart:convert';

import 'package:hive/hive.dart';

part 'participant.g.dart';

@HiveType(typeId: 1)
class Participant extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  double? howMuch;
  @HiveField(2)
  bool? payed;

  Participant({
    this.name,
    this.howMuch,
    this.payed,
  });

  Participant copyWith({
    String? name,
    double? howMuch,
    bool? payed,
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
    };
  }

  factory Participant.fromMap(Map<String, dynamic> map) {
    return Participant(
      name: map['name'] as String,
      howMuch: map['howMuch'] as double,
      payed: map['payed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Participant.fromJson(String source) => Participant.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'Participant(name: $name, howMuch: $howMuch, payed: $payed)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Participant &&
        other.name == name &&
        other.howMuch == howMuch &&
        other.payed == payed;
  }

  @override
  int get hashCode => name.hashCode ^ howMuch.hashCode ^ payed.hashCode;
}

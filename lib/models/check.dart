import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:split_the_bill/models/participant.dart';

part 'check.g.dart';

@HiveType(typeId: 2)
class Check extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final List<Participant> participants;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  String? place;
  Check({
    required this.name,
    required this.participants,
    required this.date,
    this.place,
  });

  Check copyWith({
    String? name,
    List<Participant>? participants,
    DateTime? date,
    String? place,
  }) {
    return Check(
      name: name ?? this.name,
      participants: participants ?? this.participants,
      date: date ?? this.date,
      place: place ?? this.place,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'participants': participants.isEmpty
          ? []
          : participants.map((x) => x.toMap()).toList(),
      'date': date.millisecondsSinceEpoch,
      'place': place,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Check(name: $name, participants: $participants, date: $date, place: $place)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Check &&
        other.name == name &&
        listEquals(other.participants, participants) &&
        other.date == date &&
        other.place == place;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        participants.hashCode ^
        date.hashCode ^
        place.hashCode;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParticipantAdapter extends TypeAdapter<Participant> {
  @override
  final int typeId = 1;

  @override
  Participant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Participant(
      name: fields[0] as String?,
      howMuch: fields[1] as double?,
      payed: fields[2] as bool?,
    )..id = fields[3] as int;
  }

  @override
  void write(BinaryWriter writer, Participant obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.howMuch)
      ..writeByte(2)
      ..write(obj.payed)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParticipantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

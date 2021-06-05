// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckAdapter extends TypeAdapter<Check> {
  @override
  final int typeId = 2;

  @override
  Check read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Check(
      name: fields[0] as String,
      participants: (fields[1] as List).cast<Participant>(),
      date: fields[2] as DateTime,
      place: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Check obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.participants)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.place);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

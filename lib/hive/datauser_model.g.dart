part of 'datauser_model.dart';

class DataUserModelAdapter extends TypeAdapter<DataUserModel> {
  @override
  final int typeId = 1;

  @override
  DataUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataUserModel(
      username: fields[1] as String,
      password: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DataUserModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama = GeneratedColumn<String>(
      'nama', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _tipetransaksiMeta =
      const VerificationMeta('tipetransaksi');
  @override
  late final GeneratedColumn<String> tipetransaksi = GeneratedColumn<String>(
      'tipetransaksi', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nominalMeta =
      const VerificationMeta('nominal');
  @override
  late final GeneratedColumn<int> nominal = GeneratedColumn<int>(
      'nominal', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, nama, tipetransaksi, nominal];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama')) {
      context.handle(
          _namaMeta, nama.isAcceptableOrUnknown(data['nama']!, _namaMeta));
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('tipetransaksi')) {
      context.handle(
          _tipetransaksiMeta,
          tipetransaksi.isAcceptableOrUnknown(
              data['tipetransaksi']!, _tipetransaksiMeta));
    } else if (isInserting) {
      context.missing(_tipetransaksiMeta);
    }
    if (data.containsKey('nominal')) {
      context.handle(_nominalMeta,
          nominal.isAcceptableOrUnknown(data['nominal']!, _nominalMeta));
    } else if (isInserting) {
      context.missing(_nominalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Todo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nama: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama'])!,
      tipetransaksi: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tipetransaksi'])!,
      nominal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}nominal'])!,
    );
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(attachedDatabase, alias);
  }
}

class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String nama;
  final String tipetransaksi;
  final int nominal;
  const Todo(
      {required this.id,
      required this.nama,
      required this.tipetransaksi,
      required this.nominal});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama'] = Variable<String>(nama);
    map['tipetransaksi'] = Variable<String>(tipetransaksi);
    map['nominal'] = Variable<int>(nominal);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: Value(id),
      nama: Value(nama),
      tipetransaksi: Value(tipetransaksi),
      nominal: Value(nominal),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      nama: serializer.fromJson<String>(json['nama']),
      tipetransaksi: serializer.fromJson<String>(json['tipetransaksi']),
      nominal: serializer.fromJson<int>(json['nominal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nama': serializer.toJson<String>(nama),
      'tipetransaksi': serializer.toJson<String>(tipetransaksi),
      'nominal': serializer.toJson<int>(nominal),
    };
  }

  Todo copyWith({int? id, String? nama, String? tipetransaksi, int? nominal}) =>
      Todo(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        tipetransaksi: tipetransaksi ?? this.tipetransaksi,
        nominal: nominal ?? this.nominal,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('tipetransaksi: $tipetransaksi, ')
          ..write('nominal: $nominal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nama, tipetransaksi, nominal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.nama == this.nama &&
          other.tipetransaksi == this.tipetransaksi &&
          other.nominal == this.nominal);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> nama;
  final Value<String> tipetransaksi;
  final Value<int> nominal;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.nama = const Value.absent(),
    this.tipetransaksi = const Value.absent(),
    this.nominal = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    required String nama,
    required String tipetransaksi,
    required int nominal,
  })  : nama = Value(nama),
        tipetransaksi = Value(tipetransaksi),
        nominal = Value(nominal);
  static Insertable<Todo> custom({
    Expression<int>? id,
    Expression<String>? nama,
    Expression<String>? tipetransaksi,
    Expression<int>? nominal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nama != null) 'nama': nama,
      if (tipetransaksi != null) 'tipetransaksi': tipetransaksi,
      if (nominal != null) 'nominal': nominal,
    });
  }

  TodosCompanion copyWith(
      {Value<int>? id,
      Value<String>? nama,
      Value<String>? tipetransaksi,
      Value<int>? nominal}) {
    return TodosCompanion(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      tipetransaksi: tipetransaksi ?? this.tipetransaksi,
      nominal: nominal ?? this.nominal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (tipetransaksi.present) {
      map['tipetransaksi'] = Variable<String>(tipetransaksi.value);
    }
    if (nominal.present) {
      map['nominal'] = Variable<int>(nominal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('tipetransaksi: $tipetransaksi, ')
          ..write('nominal: $nominal')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $TodosTable todos = $TodosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todos];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AlbumTable extends Album with TableInfo<$AlbumTable, AlbumData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlbumTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameInEnglishMeta = const VerificationMeta(
    'nameInEnglish',
  );
  @override
  late final GeneratedColumn<String> nameInEnglish = GeneratedColumn<String>(
    'name_in_english',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seqNumMeta = const VerificationMeta('seqNum');
  @override
  late final GeneratedColumn<int> seqNum = GeneratedColumn<int>(
    'seq_num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _publishedMeta = const VerificationMeta(
    'published',
  );
  @override
  late final GeneratedColumn<bool> published = GeneratedColumn<bool>(
    'published',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("published" IN (0, 1))',
    ),
  );
  static const VerificationMeta _lockedMeta = const VerificationMeta('locked');
  @override
  late final GeneratedColumn<bool> locked = GeneratedColumn<bool>(
    'locked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("locked" IN (0, 1))',
    ),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 250,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publishedSongCountMeta =
      const VerificationMeta('publishedSongCount');
  @override
  late final GeneratedColumn<int> publishedSongCount = GeneratedColumn<int>(
    'published_song_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalSongCountMeta = const VerificationMeta(
    'totalSongCount',
  );
  @override
  late final GeneratedColumn<int> totalSongCount = GeneratedColumn<int>(
    'total_song_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 1024,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    nameInEnglish,
    seqNum,
    published,
    locked,
    imagePath,
    publishedSongCount,
    totalSongCount,
    description,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'album';
  @override
  VerificationContext validateIntegrity(
    Insertable<AlbumData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_in_english')) {
      context.handle(
        _nameInEnglishMeta,
        nameInEnglish.isAcceptableOrUnknown(
          data['name_in_english']!,
          _nameInEnglishMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nameInEnglishMeta);
    }
    if (data.containsKey('seq_num')) {
      context.handle(
        _seqNumMeta,
        seqNum.isAcceptableOrUnknown(data['seq_num']!, _seqNumMeta),
      );
    } else if (isInserting) {
      context.missing(_seqNumMeta);
    }
    if (data.containsKey('published')) {
      context.handle(
        _publishedMeta,
        published.isAcceptableOrUnknown(data['published']!, _publishedMeta),
      );
    } else if (isInserting) {
      context.missing(_publishedMeta);
    }
    if (data.containsKey('locked')) {
      context.handle(
        _lockedMeta,
        locked.isAcceptableOrUnknown(data['locked']!, _lockedMeta),
      );
    } else if (isInserting) {
      context.missing(_lockedMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('published_song_count')) {
      context.handle(
        _publishedSongCountMeta,
        publishedSongCount.isAcceptableOrUnknown(
          data['published_song_count']!,
          _publishedSongCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_publishedSongCountMeta);
    }
    if (data.containsKey('total_song_count')) {
      context.handle(
        _totalSongCountMeta,
        totalSongCount.isAcceptableOrUnknown(
          data['total_song_count']!,
          _totalSongCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalSongCountMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AlbumData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlbumData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameInEnglish: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_in_english'],
      )!,
      seqNum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seq_num'],
      )!,
      published: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}published'],
      )!,
      locked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}locked'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      publishedSongCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}published_song_count'],
      )!,
      totalSongCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_song_count'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $AlbumTable createAlias(String alias) {
    return $AlbumTable(attachedDatabase, alias);
  }
}

class AlbumData extends DataClass implements Insertable<AlbumData> {
  final int id;
  final String code;
  final String name;
  final String nameInEnglish;
  final int seqNum;
  final bool published;
  final bool locked;
  final String? imagePath;
  final int publishedSongCount;
  final int totalSongCount;
  final String? description;
  final String? note;
  const AlbumData({
    required this.id,
    required this.code,
    required this.name,
    required this.nameInEnglish,
    required this.seqNum,
    required this.published,
    required this.locked,
    this.imagePath,
    required this.publishedSongCount,
    required this.totalSongCount,
    this.description,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['name_in_english'] = Variable<String>(nameInEnglish);
    map['seq_num'] = Variable<int>(seqNum);
    map['published'] = Variable<bool>(published);
    map['locked'] = Variable<bool>(locked);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['published_song_count'] = Variable<int>(publishedSongCount);
    map['total_song_count'] = Variable<int>(totalSongCount);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  AlbumCompanion toCompanion(bool nullToAbsent) {
    return AlbumCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      nameInEnglish: Value(nameInEnglish),
      seqNum: Value(seqNum),
      published: Value(published),
      locked: Value(locked),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      publishedSongCount: Value(publishedSongCount),
      totalSongCount: Value(totalSongCount),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory AlbumData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlbumData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      nameInEnglish: serializer.fromJson<String>(json['nameInEnglish']),
      seqNum: serializer.fromJson<int>(json['seqNum']),
      published: serializer.fromJson<bool>(json['published']),
      locked: serializer.fromJson<bool>(json['locked']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      publishedSongCount: serializer.fromJson<int>(json['publishedSongCount']),
      totalSongCount: serializer.fromJson<int>(json['totalSongCount']),
      description: serializer.fromJson<String?>(json['description']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'nameInEnglish': serializer.toJson<String>(nameInEnglish),
      'seqNum': serializer.toJson<int>(seqNum),
      'published': serializer.toJson<bool>(published),
      'locked': serializer.toJson<bool>(locked),
      'imagePath': serializer.toJson<String?>(imagePath),
      'publishedSongCount': serializer.toJson<int>(publishedSongCount),
      'totalSongCount': serializer.toJson<int>(totalSongCount),
      'description': serializer.toJson<String?>(description),
      'note': serializer.toJson<String?>(note),
    };
  }

  AlbumData copyWith({
    int? id,
    String? code,
    String? name,
    String? nameInEnglish,
    int? seqNum,
    bool? published,
    bool? locked,
    Value<String?> imagePath = const Value.absent(),
    int? publishedSongCount,
    int? totalSongCount,
    Value<String?> description = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => AlbumData(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    nameInEnglish: nameInEnglish ?? this.nameInEnglish,
    seqNum: seqNum ?? this.seqNum,
    published: published ?? this.published,
    locked: locked ?? this.locked,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    publishedSongCount: publishedSongCount ?? this.publishedSongCount,
    totalSongCount: totalSongCount ?? this.totalSongCount,
    description: description.present ? description.value : this.description,
    note: note.present ? note.value : this.note,
  );
  AlbumData copyWithCompanion(AlbumCompanion data) {
    return AlbumData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      nameInEnglish: data.nameInEnglish.present
          ? data.nameInEnglish.value
          : this.nameInEnglish,
      seqNum: data.seqNum.present ? data.seqNum.value : this.seqNum,
      published: data.published.present ? data.published.value : this.published,
      locked: data.locked.present ? data.locked.value : this.locked,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      publishedSongCount: data.publishedSongCount.present
          ? data.publishedSongCount.value
          : this.publishedSongCount,
      totalSongCount: data.totalSongCount.present
          ? data.totalSongCount.value
          : this.totalSongCount,
      description: data.description.present
          ? data.description.value
          : this.description,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlbumData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('nameInEnglish: $nameInEnglish, ')
          ..write('seqNum: $seqNum, ')
          ..write('published: $published, ')
          ..write('locked: $locked, ')
          ..write('imagePath: $imagePath, ')
          ..write('publishedSongCount: $publishedSongCount, ')
          ..write('totalSongCount: $totalSongCount, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    name,
    nameInEnglish,
    seqNum,
    published,
    locked,
    imagePath,
    publishedSongCount,
    totalSongCount,
    description,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlbumData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.nameInEnglish == this.nameInEnglish &&
          other.seqNum == this.seqNum &&
          other.published == this.published &&
          other.locked == this.locked &&
          other.imagePath == this.imagePath &&
          other.publishedSongCount == this.publishedSongCount &&
          other.totalSongCount == this.totalSongCount &&
          other.description == this.description &&
          other.note == this.note);
}

class AlbumCompanion extends UpdateCompanion<AlbumData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> nameInEnglish;
  final Value<int> seqNum;
  final Value<bool> published;
  final Value<bool> locked;
  final Value<String?> imagePath;
  final Value<int> publishedSongCount;
  final Value<int> totalSongCount;
  final Value<String?> description;
  final Value<String?> note;
  const AlbumCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.nameInEnglish = const Value.absent(),
    this.seqNum = const Value.absent(),
    this.published = const Value.absent(),
    this.locked = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.publishedSongCount = const Value.absent(),
    this.totalSongCount = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
  });
  AlbumCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required String nameInEnglish,
    required int seqNum,
    required bool published,
    required bool locked,
    this.imagePath = const Value.absent(),
    required int publishedSongCount,
    required int totalSongCount,
    this.description = const Value.absent(),
    this.note = const Value.absent(),
  }) : code = Value(code),
       name = Value(name),
       nameInEnglish = Value(nameInEnglish),
       seqNum = Value(seqNum),
       published = Value(published),
       locked = Value(locked),
       publishedSongCount = Value(publishedSongCount),
       totalSongCount = Value(totalSongCount);
  static Insertable<AlbumData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? nameInEnglish,
    Expression<int>? seqNum,
    Expression<bool>? published,
    Expression<bool>? locked,
    Expression<String>? imagePath,
    Expression<int>? publishedSongCount,
    Expression<int>? totalSongCount,
    Expression<String>? description,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (nameInEnglish != null) 'name_in_english': nameInEnglish,
      if (seqNum != null) 'seq_num': seqNum,
      if (published != null) 'published': published,
      if (locked != null) 'locked': locked,
      if (imagePath != null) 'image_path': imagePath,
      if (publishedSongCount != null)
        'published_song_count': publishedSongCount,
      if (totalSongCount != null) 'total_song_count': totalSongCount,
      if (description != null) 'description': description,
      if (note != null) 'note': note,
    });
  }

  AlbumCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String>? nameInEnglish,
    Value<int>? seqNum,
    Value<bool>? published,
    Value<bool>? locked,
    Value<String?>? imagePath,
    Value<int>? publishedSongCount,
    Value<int>? totalSongCount,
    Value<String?>? description,
    Value<String?>? note,
  }) {
    return AlbumCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      nameInEnglish: nameInEnglish ?? this.nameInEnglish,
      seqNum: seqNum ?? this.seqNum,
      published: published ?? this.published,
      locked: locked ?? this.locked,
      imagePath: imagePath ?? this.imagePath,
      publishedSongCount: publishedSongCount ?? this.publishedSongCount,
      totalSongCount: totalSongCount ?? this.totalSongCount,
      description: description ?? this.description,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameInEnglish.present) {
      map['name_in_english'] = Variable<String>(nameInEnglish.value);
    }
    if (seqNum.present) {
      map['seq_num'] = Variable<int>(seqNum.value);
    }
    if (published.present) {
      map['published'] = Variable<bool>(published.value);
    }
    if (locked.present) {
      map['locked'] = Variable<bool>(locked.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (publishedSongCount.present) {
      map['published_song_count'] = Variable<int>(publishedSongCount.value);
    }
    if (totalSongCount.present) {
      map['total_song_count'] = Variable<int>(totalSongCount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlbumCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('nameInEnglish: $nameInEnglish, ')
          ..write('seqNum: $seqNum, ')
          ..write('published: $published, ')
          ..write('locked: $locked, ')
          ..write('imagePath: $imagePath, ')
          ..write('publishedSongCount: $publishedSongCount, ')
          ..write('totalSongCount: $totalSongCount, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $EmployeePositionTable extends EmployeePosition
    with TableInfo<$EmployeePositionTable, EmployeePositionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeePositionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, code, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employee_position';
  @override
  VerificationContext validateIntegrity(
    Insertable<EmployeePositionData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmployeePositionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeePositionData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $EmployeePositionTable createAlias(String alias) {
    return $EmployeePositionTable(attachedDatabase, alias);
  }
}

class EmployeePositionData extends DataClass
    implements Insertable<EmployeePositionData> {
  final int id;
  final String code;
  final String name;
  const EmployeePositionData({
    required this.id,
    required this.code,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    return map;
  }

  EmployeePositionCompanion toCompanion(bool nullToAbsent) {
    return EmployeePositionCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
    );
  }

  factory EmployeePositionData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeePositionData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
    };
  }

  EmployeePositionData copyWith({int? id, String? code, String? name}) =>
      EmployeePositionData(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
      );
  EmployeePositionData copyWithCompanion(EmployeePositionCompanion data) {
    return EmployeePositionData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmployeePositionData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeePositionData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name);
}

class EmployeePositionCompanion extends UpdateCompanion<EmployeePositionData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  const EmployeePositionCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
  });
  EmployeePositionCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
  }) : code = Value(code),
       name = Value(name);
  static Insertable<EmployeePositionData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
    });
  }

  EmployeePositionCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
  }) {
    return EmployeePositionCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeePositionCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CompanyTable extends Company with TableInfo<$CompanyTable, CompanyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompanyTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _companyIdParentMeta = const VerificationMeta(
    'companyIdParent',
  );
  @override
  late final GeneratedColumn<int> companyIdParent = GeneratedColumn<int>(
    'company_id_parent',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES company (id)',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 1024,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    companyIdParent,
    code,
    name,
    imagePath,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'company';
  @override
  VerificationContext validateIntegrity(
    Insertable<CompanyData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_id_parent')) {
      context.handle(
        _companyIdParentMeta,
        companyIdParent.isAcceptableOrUnknown(
          data['company_id_parent']!,
          _companyIdParentMeta,
        ),
      );
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CompanyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompanyData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      companyIdParent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}company_id_parent'],
      ),
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $CompanyTable createAlias(String alias) {
    return $CompanyTable(attachedDatabase, alias);
  }
}

class CompanyData extends DataClass implements Insertable<CompanyData> {
  final int id;
  final int? companyIdParent;
  final String code;
  final String name;
  final String? imagePath;
  final String? description;
  const CompanyData({
    required this.id,
    this.companyIdParent,
    required this.code,
    required this.name,
    this.imagePath,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || companyIdParent != null) {
      map['company_id_parent'] = Variable<int>(companyIdParent);
    }
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  CompanyCompanion toCompanion(bool nullToAbsent) {
    return CompanyCompanion(
      id: Value(id),
      companyIdParent: companyIdParent == null && nullToAbsent
          ? const Value.absent()
          : Value(companyIdParent),
      code: Value(code),
      name: Value(name),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory CompanyData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompanyData(
      id: serializer.fromJson<int>(json['id']),
      companyIdParent: serializer.fromJson<int?>(json['companyIdParent']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'companyIdParent': serializer.toJson<int?>(companyIdParent),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'imagePath': serializer.toJson<String?>(imagePath),
      'description': serializer.toJson<String?>(description),
    };
  }

  CompanyData copyWith({
    int? id,
    Value<int?> companyIdParent = const Value.absent(),
    String? code,
    String? name,
    Value<String?> imagePath = const Value.absent(),
    Value<String?> description = const Value.absent(),
  }) => CompanyData(
    id: id ?? this.id,
    companyIdParent: companyIdParent.present
        ? companyIdParent.value
        : this.companyIdParent,
    code: code ?? this.code,
    name: name ?? this.name,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    description: description.present ? description.value : this.description,
  );
  CompanyData copyWithCompanion(CompanyCompanion data) {
    return CompanyData(
      id: data.id.present ? data.id.value : this.id,
      companyIdParent: data.companyIdParent.present
          ? data.companyIdParent.value
          : this.companyIdParent,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CompanyData(')
          ..write('id: $id, ')
          ..write('companyIdParent: $companyIdParent, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, companyIdParent, code, name, imagePath, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompanyData &&
          other.id == this.id &&
          other.companyIdParent == this.companyIdParent &&
          other.code == this.code &&
          other.name == this.name &&
          other.imagePath == this.imagePath &&
          other.description == this.description);
}

class CompanyCompanion extends UpdateCompanion<CompanyData> {
  final Value<int> id;
  final Value<int?> companyIdParent;
  final Value<String> code;
  final Value<String> name;
  final Value<String?> imagePath;
  final Value<String?> description;
  const CompanyCompanion({
    this.id = const Value.absent(),
    this.companyIdParent = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
  });
  CompanyCompanion.insert({
    this.id = const Value.absent(),
    this.companyIdParent = const Value.absent(),
    required String code,
    required String name,
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
  }) : code = Value(code),
       name = Value(name);
  static Insertable<CompanyData> custom({
    Expression<int>? id,
    Expression<int>? companyIdParent,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? imagePath,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyIdParent != null) 'company_id_parent': companyIdParent,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (imagePath != null) 'image_path': imagePath,
      if (description != null) 'description': description,
    });
  }

  CompanyCompanion copyWith({
    Value<int>? id,
    Value<int?>? companyIdParent,
    Value<String>? code,
    Value<String>? name,
    Value<String?>? imagePath,
    Value<String?>? description,
  }) {
    return CompanyCompanion(
      id: id ?? this.id,
      companyIdParent: companyIdParent ?? this.companyIdParent,
      code: code ?? this.code,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyIdParent.present) {
      map['company_id_parent'] = Variable<int>(companyIdParent.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanyCompanion(')
          ..write('id: $id, ')
          ..write('companyIdParent: $companyIdParent, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $DepartmentTable extends Department
    with TableInfo<$DepartmentTable, DepartmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DepartmentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
    'company_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES company (id)',
    ),
  );
  static const VerificationMeta _managerIdMeta = const VerificationMeta(
    'managerId',
  );
  @override
  late final GeneratedColumn<int> managerId = GeneratedColumn<int>(
    'manager_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 1024,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    companyId,
    managerId,
    imagePath,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'department';
  @override
  VerificationContext validateIntegrity(
    Insertable<DepartmentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('manager_id')) {
      context.handle(
        _managerIdMeta,
        managerId.isAcceptableOrUnknown(data['manager_id']!, _managerIdMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DepartmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DepartmentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}company_id'],
      )!,
      managerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}manager_id'],
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $DepartmentTable createAlias(String alias) {
    return $DepartmentTable(attachedDatabase, alias);
  }
}

class DepartmentData extends DataClass implements Insertable<DepartmentData> {
  final int id;
  final String code;
  final String name;
  final int companyId;
  final int? managerId;
  final String? imagePath;
  final String? description;
  const DepartmentData({
    required this.id,
    required this.code,
    required this.name,
    required this.companyId,
    this.managerId,
    this.imagePath,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['company_id'] = Variable<int>(companyId);
    if (!nullToAbsent || managerId != null) {
      map['manager_id'] = Variable<int>(managerId);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  DepartmentCompanion toCompanion(bool nullToAbsent) {
    return DepartmentCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      companyId: Value(companyId),
      managerId: managerId == null && nullToAbsent
          ? const Value.absent()
          : Value(managerId),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory DepartmentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DepartmentData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      companyId: serializer.fromJson<int>(json['companyId']),
      managerId: serializer.fromJson<int?>(json['managerId']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'companyId': serializer.toJson<int>(companyId),
      'managerId': serializer.toJson<int?>(managerId),
      'imagePath': serializer.toJson<String?>(imagePath),
      'description': serializer.toJson<String?>(description),
    };
  }

  DepartmentData copyWith({
    int? id,
    String? code,
    String? name,
    int? companyId,
    Value<int?> managerId = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
    Value<String?> description = const Value.absent(),
  }) => DepartmentData(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    companyId: companyId ?? this.companyId,
    managerId: managerId.present ? managerId.value : this.managerId,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    description: description.present ? description.value : this.description,
  );
  DepartmentData copyWithCompanion(DepartmentCompanion data) {
    return DepartmentData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      managerId: data.managerId.present ? data.managerId.value : this.managerId,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DepartmentData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('companyId: $companyId, ')
          ..write('managerId: $managerId, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, code, name, companyId, managerId, imagePath, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DepartmentData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.companyId == this.companyId &&
          other.managerId == this.managerId &&
          other.imagePath == this.imagePath &&
          other.description == this.description);
}

class DepartmentCompanion extends UpdateCompanion<DepartmentData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<int> companyId;
  final Value<int?> managerId;
  final Value<String?> imagePath;
  final Value<String?> description;
  const DepartmentCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.companyId = const Value.absent(),
    this.managerId = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
  });
  DepartmentCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required int companyId,
    this.managerId = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
  }) : code = Value(code),
       name = Value(name),
       companyId = Value(companyId);
  static Insertable<DepartmentData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<int>? companyId,
    Expression<int>? managerId,
    Expression<String>? imagePath,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (companyId != null) 'company_id': companyId,
      if (managerId != null) 'manager_id': managerId,
      if (imagePath != null) 'image_path': imagePath,
      if (description != null) 'description': description,
    });
  }

  DepartmentCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<int>? companyId,
    Value<int?>? managerId,
    Value<String?>? imagePath,
    Value<String?>? description,
  }) {
    return DepartmentCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      companyId: companyId ?? this.companyId,
      managerId: managerId ?? this.managerId,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (managerId.present) {
      map['manager_id'] = Variable<int>(managerId.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DepartmentCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('companyId: $companyId, ')
          ..write('managerId: $managerId, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $EmployeeTable extends Employee
    with TableInfo<$EmployeeTable, EmployeeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _empNumberMeta = const VerificationMeta(
    'empNumber',
  );
  @override
  late final GeneratedColumn<String> empNumber = GeneratedColumn<String>(
    'emp_number',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _employeePositionIdMeta =
      const VerificationMeta('employeePositionId');
  @override
  late final GeneratedColumn<int> employeePositionId = GeneratedColumn<int>(
    'employee_position_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES employee_position (id)',
    ),
  );
  static const VerificationMeta _departmentIdMeta = const VerificationMeta(
    'departmentId',
  );
  @override
  late final GeneratedColumn<int> departmentId = GeneratedColumn<int>(
    'department_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES department (id)',
    ),
  );
  static const VerificationMeta _birthdayMeta = const VerificationMeta(
    'birthday',
  );
  @override
  late final GeneratedColumn<DateTime> birthday = GeneratedColumn<DateTime>(
    'birthday',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hireDateMeta = const VerificationMeta(
    'hireDate',
  );
  @override
  late final GeneratedColumn<DateTime> hireDate = GeneratedColumn<DateTime>(
    'hire_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    empNumber,
    name,
    email,
    employeePositionId,
    departmentId,
    birthday,
    hireDate,
    imagePath,
    address,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employee';
  @override
  VerificationContext validateIntegrity(
    Insertable<EmployeeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('emp_number')) {
      context.handle(
        _empNumberMeta,
        empNumber.isAcceptableOrUnknown(data['emp_number']!, _empNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_empNumberMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('employee_position_id')) {
      context.handle(
        _employeePositionIdMeta,
        employeePositionId.isAcceptableOrUnknown(
          data['employee_position_id']!,
          _employeePositionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_employeePositionIdMeta);
    }
    if (data.containsKey('department_id')) {
      context.handle(
        _departmentIdMeta,
        departmentId.isAcceptableOrUnknown(
          data['department_id']!,
          _departmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_departmentIdMeta);
    }
    if (data.containsKey('birthday')) {
      context.handle(
        _birthdayMeta,
        birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta),
      );
    } else if (isInserting) {
      context.missing(_birthdayMeta);
    }
    if (data.containsKey('hire_date')) {
      context.handle(
        _hireDateMeta,
        hireDate.isAcceptableOrUnknown(data['hire_date']!, _hireDateMeta),
      );
    } else if (isInserting) {
      context.missing(_hireDateMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmployeeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeeData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      empNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emp_number'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      employeePositionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}employee_position_id'],
      )!,
      departmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}department_id'],
      )!,
      birthday: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birthday'],
      )!,
      hireDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}hire_date'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
    );
  }

  @override
  $EmployeeTable createAlias(String alias) {
    return $EmployeeTable(attachedDatabase, alias);
  }
}

class EmployeeData extends DataClass implements Insertable<EmployeeData> {
  final int id;
  final String empNumber;
  final String name;
  final String email;
  final int employeePositionId;
  final int departmentId;
  final DateTime birthday;
  final DateTime hireDate;
  final String? imagePath;
  final String? address;
  const EmployeeData({
    required this.id,
    required this.empNumber,
    required this.name,
    required this.email,
    required this.employeePositionId,
    required this.departmentId,
    required this.birthday,
    required this.hireDate,
    this.imagePath,
    this.address,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['emp_number'] = Variable<String>(empNumber);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['employee_position_id'] = Variable<int>(employeePositionId);
    map['department_id'] = Variable<int>(departmentId);
    map['birthday'] = Variable<DateTime>(birthday);
    map['hire_date'] = Variable<DateTime>(hireDate);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    return map;
  }

  EmployeeCompanion toCompanion(bool nullToAbsent) {
    return EmployeeCompanion(
      id: Value(id),
      empNumber: Value(empNumber),
      name: Value(name),
      email: Value(email),
      employeePositionId: Value(employeePositionId),
      departmentId: Value(departmentId),
      birthday: Value(birthday),
      hireDate: Value(hireDate),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
    );
  }

  factory EmployeeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeeData(
      id: serializer.fromJson<int>(json['id']),
      empNumber: serializer.fromJson<String>(json['empNumber']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      employeePositionId: serializer.fromJson<int>(json['employeePositionId']),
      departmentId: serializer.fromJson<int>(json['departmentId']),
      birthday: serializer.fromJson<DateTime>(json['birthday']),
      hireDate: serializer.fromJson<DateTime>(json['hireDate']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      address: serializer.fromJson<String?>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'empNumber': serializer.toJson<String>(empNumber),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'employeePositionId': serializer.toJson<int>(employeePositionId),
      'departmentId': serializer.toJson<int>(departmentId),
      'birthday': serializer.toJson<DateTime>(birthday),
      'hireDate': serializer.toJson<DateTime>(hireDate),
      'imagePath': serializer.toJson<String?>(imagePath),
      'address': serializer.toJson<String?>(address),
    };
  }

  EmployeeData copyWith({
    int? id,
    String? empNumber,
    String? name,
    String? email,
    int? employeePositionId,
    int? departmentId,
    DateTime? birthday,
    DateTime? hireDate,
    Value<String?> imagePath = const Value.absent(),
    Value<String?> address = const Value.absent(),
  }) => EmployeeData(
    id: id ?? this.id,
    empNumber: empNumber ?? this.empNumber,
    name: name ?? this.name,
    email: email ?? this.email,
    employeePositionId: employeePositionId ?? this.employeePositionId,
    departmentId: departmentId ?? this.departmentId,
    birthday: birthday ?? this.birthday,
    hireDate: hireDate ?? this.hireDate,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    address: address.present ? address.value : this.address,
  );
  EmployeeData copyWithCompanion(EmployeeCompanion data) {
    return EmployeeData(
      id: data.id.present ? data.id.value : this.id,
      empNumber: data.empNumber.present ? data.empNumber.value : this.empNumber,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      employeePositionId: data.employeePositionId.present
          ? data.employeePositionId.value
          : this.employeePositionId,
      departmentId: data.departmentId.present
          ? data.departmentId.value
          : this.departmentId,
      birthday: data.birthday.present ? data.birthday.value : this.birthday,
      hireDate: data.hireDate.present ? data.hireDate.value : this.hireDate,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      address: data.address.present ? data.address.value : this.address,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeData(')
          ..write('id: $id, ')
          ..write('empNumber: $empNumber, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('employeePositionId: $employeePositionId, ')
          ..write('departmentId: $departmentId, ')
          ..write('birthday: $birthday, ')
          ..write('hireDate: $hireDate, ')
          ..write('imagePath: $imagePath, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    empNumber,
    name,
    email,
    employeePositionId,
    departmentId,
    birthday,
    hireDate,
    imagePath,
    address,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeData &&
          other.id == this.id &&
          other.empNumber == this.empNumber &&
          other.name == this.name &&
          other.email == this.email &&
          other.employeePositionId == this.employeePositionId &&
          other.departmentId == this.departmentId &&
          other.birthday == this.birthday &&
          other.hireDate == this.hireDate &&
          other.imagePath == this.imagePath &&
          other.address == this.address);
}

class EmployeeCompanion extends UpdateCompanion<EmployeeData> {
  final Value<int> id;
  final Value<String> empNumber;
  final Value<String> name;
  final Value<String> email;
  final Value<int> employeePositionId;
  final Value<int> departmentId;
  final Value<DateTime> birthday;
  final Value<DateTime> hireDate;
  final Value<String?> imagePath;
  final Value<String?> address;
  const EmployeeCompanion({
    this.id = const Value.absent(),
    this.empNumber = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.employeePositionId = const Value.absent(),
    this.departmentId = const Value.absent(),
    this.birthday = const Value.absent(),
    this.hireDate = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.address = const Value.absent(),
  });
  EmployeeCompanion.insert({
    this.id = const Value.absent(),
    required String empNumber,
    required String name,
    required String email,
    required int employeePositionId,
    required int departmentId,
    required DateTime birthday,
    required DateTime hireDate,
    this.imagePath = const Value.absent(),
    this.address = const Value.absent(),
  }) : empNumber = Value(empNumber),
       name = Value(name),
       email = Value(email),
       employeePositionId = Value(employeePositionId),
       departmentId = Value(departmentId),
       birthday = Value(birthday),
       hireDate = Value(hireDate);
  static Insertable<EmployeeData> custom({
    Expression<int>? id,
    Expression<String>? empNumber,
    Expression<String>? name,
    Expression<String>? email,
    Expression<int>? employeePositionId,
    Expression<int>? departmentId,
    Expression<DateTime>? birthday,
    Expression<DateTime>? hireDate,
    Expression<String>? imagePath,
    Expression<String>? address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (empNumber != null) 'emp_number': empNumber,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (employeePositionId != null)
        'employee_position_id': employeePositionId,
      if (departmentId != null) 'department_id': departmentId,
      if (birthday != null) 'birthday': birthday,
      if (hireDate != null) 'hire_date': hireDate,
      if (imagePath != null) 'image_path': imagePath,
      if (address != null) 'address': address,
    });
  }

  EmployeeCompanion copyWith({
    Value<int>? id,
    Value<String>? empNumber,
    Value<String>? name,
    Value<String>? email,
    Value<int>? employeePositionId,
    Value<int>? departmentId,
    Value<DateTime>? birthday,
    Value<DateTime>? hireDate,
    Value<String?>? imagePath,
    Value<String?>? address,
  }) {
    return EmployeeCompanion(
      id: id ?? this.id,
      empNumber: empNumber ?? this.empNumber,
      name: name ?? this.name,
      email: email ?? this.email,
      employeePositionId: employeePositionId ?? this.employeePositionId,
      departmentId: departmentId ?? this.departmentId,
      birthday: birthday ?? this.birthday,
      hireDate: hireDate ?? this.hireDate,
      imagePath: imagePath ?? this.imagePath,
      address: address ?? this.address,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (empNumber.present) {
      map['emp_number'] = Variable<String>(empNumber.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (employeePositionId.present) {
      map['employee_position_id'] = Variable<int>(employeePositionId.value);
    }
    if (departmentId.present) {
      map['department_id'] = Variable<int>(departmentId.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<DateTime>(birthday.value);
    }
    if (hireDate.present) {
      map['hire_date'] = Variable<DateTime>(hireDate.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeCompanion(')
          ..write('id: $id, ')
          ..write('empNumber: $empNumber, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('employeePositionId: $employeePositionId, ')
          ..write('departmentId: $departmentId, ')
          ..write('birthday: $birthday, ')
          ..write('hireDate: $hireDate, ')
          ..write('imagePath: $imagePath, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

class $AppUserTable extends AppUser with TableInfo<$AppUserTable, AppUserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppUserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userNameMeta = const VerificationMeta(
    'userName',
  );
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
    'user_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _encryptedPasswordMeta = const VerificationMeta(
    'encryptedPassword',
  );
  @override
  late final GeneratedColumn<String> encryptedPassword =
      GeneratedColumn<String>(
        'encrypted_password',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1,
          maxTextLength: 255,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
  );
  static const VerificationMeta _activatedMeta = const VerificationMeta(
    'activated',
  );
  @override
  late final GeneratedColumn<bool> activated = GeneratedColumn<bool>(
    'activated',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("activated" IN (0, 1))',
    ),
  );
  static const VerificationMeta _accessTokenMeta = const VerificationMeta(
    'accessToken',
  );
  @override
  late final GeneratedColumn<String> accessToken = GeneratedColumn<String>(
    'access_token',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _employeeIdMeta = const VerificationMeta(
    'employeeId',
  );
  @override
  late final GeneratedColumn<int> employeeId = GeneratedColumn<int>(
    'employee_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES employee (id)',
    ),
  );
  static const VerificationMeta _lastActiveDatetimeMeta =
      const VerificationMeta('lastActiveDatetime');
  @override
  late final GeneratedColumn<DateTime> lastActiveDatetime =
      GeneratedColumn<DateTime>(
        'last_active_datetime',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _isSystemUserMeta = const VerificationMeta(
    'isSystemUser',
  );
  @override
  late final GeneratedColumn<bool> isSystemUser = GeneratedColumn<bool>(
    'is_system_user',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_system_user" IN (0, 1))',
    ),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userName,
    email,
    fullName,
    encryptedPassword,
    enabled,
    activated,
    accessToken,
    employeeId,
    lastActiveDatetime,
    isSystemUser,
    imagePath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_user';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppUserData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(
        _userNameMeta,
        userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta),
      );
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('encrypted_password')) {
      context.handle(
        _encryptedPasswordMeta,
        encryptedPassword.isAcceptableOrUnknown(
          data['encrypted_password']!,
          _encryptedPasswordMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_encryptedPasswordMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    } else if (isInserting) {
      context.missing(_enabledMeta);
    }
    if (data.containsKey('activated')) {
      context.handle(
        _activatedMeta,
        activated.isAcceptableOrUnknown(data['activated']!, _activatedMeta),
      );
    } else if (isInserting) {
      context.missing(_activatedMeta);
    }
    if (data.containsKey('access_token')) {
      context.handle(
        _accessTokenMeta,
        accessToken.isAcceptableOrUnknown(
          data['access_token']!,
          _accessTokenMeta,
        ),
      );
    }
    if (data.containsKey('employee_id')) {
      context.handle(
        _employeeIdMeta,
        employeeId.isAcceptableOrUnknown(data['employee_id']!, _employeeIdMeta),
      );
    }
    if (data.containsKey('last_active_datetime')) {
      context.handle(
        _lastActiveDatetimeMeta,
        lastActiveDatetime.isAcceptableOrUnknown(
          data['last_active_datetime']!,
          _lastActiveDatetimeMeta,
        ),
      );
    }
    if (data.containsKey('is_system_user')) {
      context.handle(
        _isSystemUserMeta,
        isSystemUser.isAcceptableOrUnknown(
          data['is_system_user']!,
          _isSystemUserMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isSystemUserMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppUserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppUserData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      encryptedPassword: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}encrypted_password'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      activated: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}activated'],
      )!,
      accessToken: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}access_token'],
      ),
      employeeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}employee_id'],
      ),
      lastActiveDatetime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_active_datetime'],
      ),
      isSystemUser: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_system_user'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
    );
  }

  @override
  $AppUserTable createAlias(String alias) {
    return $AppUserTable(attachedDatabase, alias);
  }
}

class AppUserData extends DataClass implements Insertable<AppUserData> {
  final int id;
  final String userName;
  final String email;
  final String fullName;
  final String encryptedPassword;
  final bool enabled;
  final bool activated;
  final String? accessToken;
  final int? employeeId;
  final DateTime? lastActiveDatetime;
  final bool isSystemUser;
  final String? imagePath;
  const AppUserData({
    required this.id,
    required this.userName,
    required this.email,
    required this.fullName,
    required this.encryptedPassword,
    required this.enabled,
    required this.activated,
    this.accessToken,
    this.employeeId,
    this.lastActiveDatetime,
    required this.isSystemUser,
    this.imagePath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_name'] = Variable<String>(userName);
    map['email'] = Variable<String>(email);
    map['full_name'] = Variable<String>(fullName);
    map['encrypted_password'] = Variable<String>(encryptedPassword);
    map['enabled'] = Variable<bool>(enabled);
    map['activated'] = Variable<bool>(activated);
    if (!nullToAbsent || accessToken != null) {
      map['access_token'] = Variable<String>(accessToken);
    }
    if (!nullToAbsent || employeeId != null) {
      map['employee_id'] = Variable<int>(employeeId);
    }
    if (!nullToAbsent || lastActiveDatetime != null) {
      map['last_active_datetime'] = Variable<DateTime>(lastActiveDatetime);
    }
    map['is_system_user'] = Variable<bool>(isSystemUser);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    return map;
  }

  AppUserCompanion toCompanion(bool nullToAbsent) {
    return AppUserCompanion(
      id: Value(id),
      userName: Value(userName),
      email: Value(email),
      fullName: Value(fullName),
      encryptedPassword: Value(encryptedPassword),
      enabled: Value(enabled),
      activated: Value(activated),
      accessToken: accessToken == null && nullToAbsent
          ? const Value.absent()
          : Value(accessToken),
      employeeId: employeeId == null && nullToAbsent
          ? const Value.absent()
          : Value(employeeId),
      lastActiveDatetime: lastActiveDatetime == null && nullToAbsent
          ? const Value.absent()
          : Value(lastActiveDatetime),
      isSystemUser: Value(isSystemUser),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
    );
  }

  factory AppUserData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppUserData(
      id: serializer.fromJson<int>(json['id']),
      userName: serializer.fromJson<String>(json['userName']),
      email: serializer.fromJson<String>(json['email']),
      fullName: serializer.fromJson<String>(json['fullName']),
      encryptedPassword: serializer.fromJson<String>(json['encryptedPassword']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      activated: serializer.fromJson<bool>(json['activated']),
      accessToken: serializer.fromJson<String?>(json['accessToken']),
      employeeId: serializer.fromJson<int?>(json['employeeId']),
      lastActiveDatetime: serializer.fromJson<DateTime?>(
        json['lastActiveDatetime'],
      ),
      isSystemUser: serializer.fromJson<bool>(json['isSystemUser']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userName': serializer.toJson<String>(userName),
      'email': serializer.toJson<String>(email),
      'fullName': serializer.toJson<String>(fullName),
      'encryptedPassword': serializer.toJson<String>(encryptedPassword),
      'enabled': serializer.toJson<bool>(enabled),
      'activated': serializer.toJson<bool>(activated),
      'accessToken': serializer.toJson<String?>(accessToken),
      'employeeId': serializer.toJson<int?>(employeeId),
      'lastActiveDatetime': serializer.toJson<DateTime?>(lastActiveDatetime),
      'isSystemUser': serializer.toJson<bool>(isSystemUser),
      'imagePath': serializer.toJson<String?>(imagePath),
    };
  }

  AppUserData copyWith({
    int? id,
    String? userName,
    String? email,
    String? fullName,
    String? encryptedPassword,
    bool? enabled,
    bool? activated,
    Value<String?> accessToken = const Value.absent(),
    Value<int?> employeeId = const Value.absent(),
    Value<DateTime?> lastActiveDatetime = const Value.absent(),
    bool? isSystemUser,
    Value<String?> imagePath = const Value.absent(),
  }) => AppUserData(
    id: id ?? this.id,
    userName: userName ?? this.userName,
    email: email ?? this.email,
    fullName: fullName ?? this.fullName,
    encryptedPassword: encryptedPassword ?? this.encryptedPassword,
    enabled: enabled ?? this.enabled,
    activated: activated ?? this.activated,
    accessToken: accessToken.present ? accessToken.value : this.accessToken,
    employeeId: employeeId.present ? employeeId.value : this.employeeId,
    lastActiveDatetime: lastActiveDatetime.present
        ? lastActiveDatetime.value
        : this.lastActiveDatetime,
    isSystemUser: isSystemUser ?? this.isSystemUser,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
  );
  AppUserData copyWithCompanion(AppUserCompanion data) {
    return AppUserData(
      id: data.id.present ? data.id.value : this.id,
      userName: data.userName.present ? data.userName.value : this.userName,
      email: data.email.present ? data.email.value : this.email,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      encryptedPassword: data.encryptedPassword.present
          ? data.encryptedPassword.value
          : this.encryptedPassword,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      activated: data.activated.present ? data.activated.value : this.activated,
      accessToken: data.accessToken.present
          ? data.accessToken.value
          : this.accessToken,
      employeeId: data.employeeId.present
          ? data.employeeId.value
          : this.employeeId,
      lastActiveDatetime: data.lastActiveDatetime.present
          ? data.lastActiveDatetime.value
          : this.lastActiveDatetime,
      isSystemUser: data.isSystemUser.present
          ? data.isSystemUser.value
          : this.isSystemUser,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppUserData(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('email: $email, ')
          ..write('fullName: $fullName, ')
          ..write('encryptedPassword: $encryptedPassword, ')
          ..write('enabled: $enabled, ')
          ..write('activated: $activated, ')
          ..write('accessToken: $accessToken, ')
          ..write('employeeId: $employeeId, ')
          ..write('lastActiveDatetime: $lastActiveDatetime, ')
          ..write('isSystemUser: $isSystemUser, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userName,
    email,
    fullName,
    encryptedPassword,
    enabled,
    activated,
    accessToken,
    employeeId,
    lastActiveDatetime,
    isSystemUser,
    imagePath,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppUserData &&
          other.id == this.id &&
          other.userName == this.userName &&
          other.email == this.email &&
          other.fullName == this.fullName &&
          other.encryptedPassword == this.encryptedPassword &&
          other.enabled == this.enabled &&
          other.activated == this.activated &&
          other.accessToken == this.accessToken &&
          other.employeeId == this.employeeId &&
          other.lastActiveDatetime == this.lastActiveDatetime &&
          other.isSystemUser == this.isSystemUser &&
          other.imagePath == this.imagePath);
}

class AppUserCompanion extends UpdateCompanion<AppUserData> {
  final Value<int> id;
  final Value<String> userName;
  final Value<String> email;
  final Value<String> fullName;
  final Value<String> encryptedPassword;
  final Value<bool> enabled;
  final Value<bool> activated;
  final Value<String?> accessToken;
  final Value<int?> employeeId;
  final Value<DateTime?> lastActiveDatetime;
  final Value<bool> isSystemUser;
  final Value<String?> imagePath;
  const AppUserCompanion({
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.email = const Value.absent(),
    this.fullName = const Value.absent(),
    this.encryptedPassword = const Value.absent(),
    this.enabled = const Value.absent(),
    this.activated = const Value.absent(),
    this.accessToken = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.lastActiveDatetime = const Value.absent(),
    this.isSystemUser = const Value.absent(),
    this.imagePath = const Value.absent(),
  });
  AppUserCompanion.insert({
    this.id = const Value.absent(),
    required String userName,
    required String email,
    required String fullName,
    required String encryptedPassword,
    required bool enabled,
    required bool activated,
    this.accessToken = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.lastActiveDatetime = const Value.absent(),
    required bool isSystemUser,
    this.imagePath = const Value.absent(),
  }) : userName = Value(userName),
       email = Value(email),
       fullName = Value(fullName),
       encryptedPassword = Value(encryptedPassword),
       enabled = Value(enabled),
       activated = Value(activated),
       isSystemUser = Value(isSystemUser);
  static Insertable<AppUserData> custom({
    Expression<int>? id,
    Expression<String>? userName,
    Expression<String>? email,
    Expression<String>? fullName,
    Expression<String>? encryptedPassword,
    Expression<bool>? enabled,
    Expression<bool>? activated,
    Expression<String>? accessToken,
    Expression<int>? employeeId,
    Expression<DateTime>? lastActiveDatetime,
    Expression<bool>? isSystemUser,
    Expression<String>? imagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userName != null) 'user_name': userName,
      if (email != null) 'email': email,
      if (fullName != null) 'full_name': fullName,
      if (encryptedPassword != null) 'encrypted_password': encryptedPassword,
      if (enabled != null) 'enabled': enabled,
      if (activated != null) 'activated': activated,
      if (accessToken != null) 'access_token': accessToken,
      if (employeeId != null) 'employee_id': employeeId,
      if (lastActiveDatetime != null)
        'last_active_datetime': lastActiveDatetime,
      if (isSystemUser != null) 'is_system_user': isSystemUser,
      if (imagePath != null) 'image_path': imagePath,
    });
  }

  AppUserCompanion copyWith({
    Value<int>? id,
    Value<String>? userName,
    Value<String>? email,
    Value<String>? fullName,
    Value<String>? encryptedPassword,
    Value<bool>? enabled,
    Value<bool>? activated,
    Value<String?>? accessToken,
    Value<int?>? employeeId,
    Value<DateTime?>? lastActiveDatetime,
    Value<bool>? isSystemUser,
    Value<String?>? imagePath,
  }) {
    return AppUserCompanion(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      encryptedPassword: encryptedPassword ?? this.encryptedPassword,
      enabled: enabled ?? this.enabled,
      activated: activated ?? this.activated,
      accessToken: accessToken ?? this.accessToken,
      employeeId: employeeId ?? this.employeeId,
      lastActiveDatetime: lastActiveDatetime ?? this.lastActiveDatetime,
      isSystemUser: isSystemUser ?? this.isSystemUser,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (encryptedPassword.present) {
      map['encrypted_password'] = Variable<String>(encryptedPassword.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (activated.present) {
      map['activated'] = Variable<bool>(activated.value);
    }
    if (accessToken.present) {
      map['access_token'] = Variable<String>(accessToken.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<int>(employeeId.value);
    }
    if (lastActiveDatetime.present) {
      map['last_active_datetime'] = Variable<DateTime>(
        lastActiveDatetime.value,
      );
    }
    if (isSystemUser.present) {
      map['is_system_user'] = Variable<bool>(isSystemUser.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppUserCompanion(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('email: $email, ')
          ..write('fullName: $fullName, ')
          ..write('encryptedPassword: $encryptedPassword, ')
          ..write('enabled: $enabled, ')
          ..write('activated: $activated, ')
          ..write('accessToken: $accessToken, ')
          ..write('employeeId: $employeeId, ')
          ..write('lastActiveDatetime: $lastActiveDatetime, ')
          ..write('isSystemUser: $isSystemUser, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }
}

class $BookTable extends Book with TableInfo<$BookTable, BookData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seqNumMeta = const VerificationMeta('seqNum');
  @override
  late final GeneratedColumn<int> seqNum = GeneratedColumn<int>(
    'seq_num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _publishedMeta = const VerificationMeta(
    'published',
  );
  @override
  late final GeneratedColumn<bool> published = GeneratedColumn<bool>(
    'published',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("published" IN (0, 1))',
    ),
  );
  static const VerificationMeta _lockedMeta = const VerificationMeta('locked');
  @override
  late final GeneratedColumn<bool> locked = GeneratedColumn<bool>(
    'locked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("locked" IN (0, 1))',
    ),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 1024,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    title,
    seqNum,
    published,
    locked,
    imagePath,
    description,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'book';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('seq_num')) {
      context.handle(
        _seqNumMeta,
        seqNum.isAcceptableOrUnknown(data['seq_num']!, _seqNumMeta),
      );
    } else if (isInserting) {
      context.missing(_seqNumMeta);
    }
    if (data.containsKey('published')) {
      context.handle(
        _publishedMeta,
        published.isAcceptableOrUnknown(data['published']!, _publishedMeta),
      );
    } else if (isInserting) {
      context.missing(_publishedMeta);
    }
    if (data.containsKey('locked')) {
      context.handle(
        _lockedMeta,
        locked.isAcceptableOrUnknown(data['locked']!, _lockedMeta),
      );
    } else if (isInserting) {
      context.missing(_lockedMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      seqNum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seq_num'],
      )!,
      published: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}published'],
      )!,
      locked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}locked'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $BookTable createAlias(String alias) {
    return $BookTable(attachedDatabase, alias);
  }
}

class BookData extends DataClass implements Insertable<BookData> {
  final int id;
  final String code;
  final String title;
  final int seqNum;
  final bool published;
  final bool locked;
  final String? imagePath;
  final String? description;
  final String? note;
  const BookData({
    required this.id,
    required this.code,
    required this.title,
    required this.seqNum,
    required this.published,
    required this.locked,
    this.imagePath,
    this.description,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['title'] = Variable<String>(title);
    map['seq_num'] = Variable<int>(seqNum);
    map['published'] = Variable<bool>(published);
    map['locked'] = Variable<bool>(locked);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  BookCompanion toCompanion(bool nullToAbsent) {
    return BookCompanion(
      id: Value(id),
      code: Value(code),
      title: Value(title),
      seqNum: Value(seqNum),
      published: Value(published),
      locked: Value(locked),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory BookData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      title: serializer.fromJson<String>(json['title']),
      seqNum: serializer.fromJson<int>(json['seqNum']),
      published: serializer.fromJson<bool>(json['published']),
      locked: serializer.fromJson<bool>(json['locked']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      description: serializer.fromJson<String?>(json['description']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'title': serializer.toJson<String>(title),
      'seqNum': serializer.toJson<int>(seqNum),
      'published': serializer.toJson<bool>(published),
      'locked': serializer.toJson<bool>(locked),
      'imagePath': serializer.toJson<String?>(imagePath),
      'description': serializer.toJson<String?>(description),
      'note': serializer.toJson<String?>(note),
    };
  }

  BookData copyWith({
    int? id,
    String? code,
    String? title,
    int? seqNum,
    bool? published,
    bool? locked,
    Value<String?> imagePath = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => BookData(
    id: id ?? this.id,
    code: code ?? this.code,
    title: title ?? this.title,
    seqNum: seqNum ?? this.seqNum,
    published: published ?? this.published,
    locked: locked ?? this.locked,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    description: description.present ? description.value : this.description,
    note: note.present ? note.value : this.note,
  );
  BookData copyWithCompanion(BookCompanion data) {
    return BookData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      title: data.title.present ? data.title.value : this.title,
      seqNum: data.seqNum.present ? data.seqNum.value : this.seqNum,
      published: data.published.present ? data.published.value : this.published,
      locked: data.locked.present ? data.locked.value : this.locked,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      description: data.description.present
          ? data.description.value
          : this.description,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('title: $title, ')
          ..write('seqNum: $seqNum, ')
          ..write('published: $published, ')
          ..write('locked: $locked, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    title,
    seqNum,
    published,
    locked,
    imagePath,
    description,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookData &&
          other.id == this.id &&
          other.code == this.code &&
          other.title == this.title &&
          other.seqNum == this.seqNum &&
          other.published == this.published &&
          other.locked == this.locked &&
          other.imagePath == this.imagePath &&
          other.description == this.description &&
          other.note == this.note);
}

class BookCompanion extends UpdateCompanion<BookData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> title;
  final Value<int> seqNum;
  final Value<bool> published;
  final Value<bool> locked;
  final Value<String?> imagePath;
  final Value<String?> description;
  final Value<String?> note;
  const BookCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.title = const Value.absent(),
    this.seqNum = const Value.absent(),
    this.published = const Value.absent(),
    this.locked = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
  });
  BookCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String title,
    required int seqNum,
    required bool published,
    required bool locked,
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
  }) : code = Value(code),
       title = Value(title),
       seqNum = Value(seqNum),
       published = Value(published),
       locked = Value(locked);
  static Insertable<BookData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? title,
    Expression<int>? seqNum,
    Expression<bool>? published,
    Expression<bool>? locked,
    Expression<String>? imagePath,
    Expression<String>? description,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (title != null) 'title': title,
      if (seqNum != null) 'seq_num': seqNum,
      if (published != null) 'published': published,
      if (locked != null) 'locked': locked,
      if (imagePath != null) 'image_path': imagePath,
      if (description != null) 'description': description,
      if (note != null) 'note': note,
    });
  }

  BookCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? title,
    Value<int>? seqNum,
    Value<bool>? published,
    Value<bool>? locked,
    Value<String?>? imagePath,
    Value<String?>? description,
    Value<String?>? note,
  }) {
    return BookCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      title: title ?? this.title,
      seqNum: seqNum ?? this.seqNum,
      published: published ?? this.published,
      locked: locked ?? this.locked,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (seqNum.present) {
      map['seq_num'] = Variable<int>(seqNum.value);
    }
    if (published.present) {
      map['published'] = Variable<bool>(published.value);
    }
    if (locked.present) {
      map['locked'] = Variable<bool>(locked.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('title: $title, ')
          ..write('seqNum: $seqNum, ')
          ..write('published: $published, ')
          ..write('locked: $locked, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 1024,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    imagePath,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(attachedDatabase, alias);
  }
}

class CategoryData extends DataClass implements Insertable<CategoryData> {
  final int id;
  final String code;
  final String name;
  final String? imagePath;
  final String? description;
  const CategoryData({
    required this.id,
    required this.code,
    required this.name,
    this.imagePath,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory CategoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'imagePath': serializer.toJson<String?>(imagePath),
      'description': serializer.toJson<String?>(description),
    };
  }

  CategoryData copyWith({
    int? id,
    String? code,
    String? name,
    Value<String?> imagePath = const Value.absent(),
    Value<String?> description = const Value.absent(),
  }) => CategoryData(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    description: description.present ? description.value : this.description,
  );
  CategoryData copyWithCompanion(CategoryCompanion data) {
    return CategoryData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name, imagePath, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.imagePath == this.imagePath &&
          other.description == this.description);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String?> imagePath;
  final Value<String?> description;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
  }) : code = Value(code),
       name = Value(name);
  static Insertable<CategoryData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? imagePath,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (imagePath != null) 'image_path': imagePath,
      if (description != null) 'description': description,
    });
  }

  CategoryCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String?>? imagePath,
    Value<String?>? description,
  }) {
    return CategoryCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $CountryTable extends Country with TableInfo<$CountryTable, CountryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 2,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameInEnglishMeta = const VerificationMeta(
    'nameInEnglish',
  );
  @override
  late final GeneratedColumn<String> nameInEnglish = GeneratedColumn<String>(
    'name_in_english',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryCodeMeta = const VerificationMeta(
    'countryCode',
  );
  @override
  late final GeneratedColumn<String> countryCode = GeneratedColumn<String>(
    'country_code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isoCode2Meta = const VerificationMeta(
    'isoCode2',
  );
  @override
  late final GeneratedColumn<String> isoCode2 = GeneratedColumn<String>(
    'iso_code2',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isoCode3Meta = const VerificationMeta(
    'isoCode3',
  );
  @override
  late final GeneratedColumn<String> isoCode3 = GeneratedColumn<String>(
    'iso_code3',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _populationMeta = const VerificationMeta(
    'population',
  );
  @override
  late final GeneratedColumn<int> population = GeneratedColumn<int>(
    'population',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<int> area = GeneratedColumn<int>(
    'area',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gdpMeta = const VerificationMeta('gdp');
  @override
  late final GeneratedColumn<double> gdp = GeneratedColumn<double>(
    'gdp',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 1024,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    nameInEnglish,
    countryCode,
    isoCode2,
    isoCode3,
    population,
    area,
    gdp,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'country';
  @override
  VerificationContext validateIntegrity(
    Insertable<CountryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_in_english')) {
      context.handle(
        _nameInEnglishMeta,
        nameInEnglish.isAcceptableOrUnknown(
          data['name_in_english']!,
          _nameInEnglishMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nameInEnglishMeta);
    }
    if (data.containsKey('country_code')) {
      context.handle(
        _countryCodeMeta,
        countryCode.isAcceptableOrUnknown(
          data['country_code']!,
          _countryCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_countryCodeMeta);
    }
    if (data.containsKey('iso_code2')) {
      context.handle(
        _isoCode2Meta,
        isoCode2.isAcceptableOrUnknown(data['iso_code2']!, _isoCode2Meta),
      );
    } else if (isInserting) {
      context.missing(_isoCode2Meta);
    }
    if (data.containsKey('iso_code3')) {
      context.handle(
        _isoCode3Meta,
        isoCode3.isAcceptableOrUnknown(data['iso_code3']!, _isoCode3Meta),
      );
    } else if (isInserting) {
      context.missing(_isoCode3Meta);
    }
    if (data.containsKey('population')) {
      context.handle(
        _populationMeta,
        population.isAcceptableOrUnknown(data['population']!, _populationMeta),
      );
    } else if (isInserting) {
      context.missing(_populationMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    if (data.containsKey('gdp')) {
      context.handle(
        _gdpMeta,
        gdp.isAcceptableOrUnknown(data['gdp']!, _gdpMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CountryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameInEnglish: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_in_english'],
      )!,
      countryCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_code'],
      )!,
      isoCode2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}iso_code2'],
      )!,
      isoCode3: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}iso_code3'],
      )!,
      population: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}population'],
      )!,
      area: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}area'],
      )!,
      gdp: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gdp'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $CountryTable createAlias(String alias) {
    return $CountryTable(attachedDatabase, alias);
  }
}

class CountryData extends DataClass implements Insertable<CountryData> {
  final String id;
  final String code;
  final String name;
  final String nameInEnglish;
  final String countryCode;
  final String isoCode2;
  final String isoCode3;
  final int population;
  final int area;
  final double? gdp;
  final String? description;
  const CountryData({
    required this.id,
    required this.code,
    required this.name,
    required this.nameInEnglish,
    required this.countryCode,
    required this.isoCode2,
    required this.isoCode3,
    required this.population,
    required this.area,
    this.gdp,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['name_in_english'] = Variable<String>(nameInEnglish);
    map['country_code'] = Variable<String>(countryCode);
    map['iso_code2'] = Variable<String>(isoCode2);
    map['iso_code3'] = Variable<String>(isoCode3);
    map['population'] = Variable<int>(population);
    map['area'] = Variable<int>(area);
    if (!nullToAbsent || gdp != null) {
      map['gdp'] = Variable<double>(gdp);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  CountryCompanion toCompanion(bool nullToAbsent) {
    return CountryCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      nameInEnglish: Value(nameInEnglish),
      countryCode: Value(countryCode),
      isoCode2: Value(isoCode2),
      isoCode3: Value(isoCode3),
      population: Value(population),
      area: Value(area),
      gdp: gdp == null && nullToAbsent ? const Value.absent() : Value(gdp),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory CountryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountryData(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      nameInEnglish: serializer.fromJson<String>(json['nameInEnglish']),
      countryCode: serializer.fromJson<String>(json['countryCode']),
      isoCode2: serializer.fromJson<String>(json['isoCode2']),
      isoCode3: serializer.fromJson<String>(json['isoCode3']),
      population: serializer.fromJson<int>(json['population']),
      area: serializer.fromJson<int>(json['area']),
      gdp: serializer.fromJson<double?>(json['gdp']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'nameInEnglish': serializer.toJson<String>(nameInEnglish),
      'countryCode': serializer.toJson<String>(countryCode),
      'isoCode2': serializer.toJson<String>(isoCode2),
      'isoCode3': serializer.toJson<String>(isoCode3),
      'population': serializer.toJson<int>(population),
      'area': serializer.toJson<int>(area),
      'gdp': serializer.toJson<double?>(gdp),
      'description': serializer.toJson<String?>(description),
    };
  }

  CountryData copyWith({
    String? id,
    String? code,
    String? name,
    String? nameInEnglish,
    String? countryCode,
    String? isoCode2,
    String? isoCode3,
    int? population,
    int? area,
    Value<double?> gdp = const Value.absent(),
    Value<String?> description = const Value.absent(),
  }) => CountryData(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    nameInEnglish: nameInEnglish ?? this.nameInEnglish,
    countryCode: countryCode ?? this.countryCode,
    isoCode2: isoCode2 ?? this.isoCode2,
    isoCode3: isoCode3 ?? this.isoCode3,
    population: population ?? this.population,
    area: area ?? this.area,
    gdp: gdp.present ? gdp.value : this.gdp,
    description: description.present ? description.value : this.description,
  );
  CountryData copyWithCompanion(CountryCompanion data) {
    return CountryData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      nameInEnglish: data.nameInEnglish.present
          ? data.nameInEnglish.value
          : this.nameInEnglish,
      countryCode: data.countryCode.present
          ? data.countryCode.value
          : this.countryCode,
      isoCode2: data.isoCode2.present ? data.isoCode2.value : this.isoCode2,
      isoCode3: data.isoCode3.present ? data.isoCode3.value : this.isoCode3,
      population: data.population.present
          ? data.population.value
          : this.population,
      area: data.area.present ? data.area.value : this.area,
      gdp: data.gdp.present ? data.gdp.value : this.gdp,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountryData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('nameInEnglish: $nameInEnglish, ')
          ..write('countryCode: $countryCode, ')
          ..write('isoCode2: $isoCode2, ')
          ..write('isoCode3: $isoCode3, ')
          ..write('population: $population, ')
          ..write('area: $area, ')
          ..write('gdp: $gdp, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    name,
    nameInEnglish,
    countryCode,
    isoCode2,
    isoCode3,
    population,
    area,
    gdp,
    description,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountryData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.nameInEnglish == this.nameInEnglish &&
          other.countryCode == this.countryCode &&
          other.isoCode2 == this.isoCode2 &&
          other.isoCode3 == this.isoCode3 &&
          other.population == this.population &&
          other.area == this.area &&
          other.gdp == this.gdp &&
          other.description == this.description);
}

class CountryCompanion extends UpdateCompanion<CountryData> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> nameInEnglish;
  final Value<String> countryCode;
  final Value<String> isoCode2;
  final Value<String> isoCode3;
  final Value<int> population;
  final Value<int> area;
  final Value<double?> gdp;
  final Value<String?> description;
  final Value<int> rowid;
  const CountryCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.nameInEnglish = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.isoCode2 = const Value.absent(),
    this.isoCode3 = const Value.absent(),
    this.population = const Value.absent(),
    this.area = const Value.absent(),
    this.gdp = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CountryCompanion.insert({
    required String id,
    required String code,
    required String name,
    required String nameInEnglish,
    required String countryCode,
    required String isoCode2,
    required String isoCode3,
    required int population,
    required int area,
    this.gdp = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       name = Value(name),
       nameInEnglish = Value(nameInEnglish),
       countryCode = Value(countryCode),
       isoCode2 = Value(isoCode2),
       isoCode3 = Value(isoCode3),
       population = Value(population),
       area = Value(area);
  static Insertable<CountryData> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? nameInEnglish,
    Expression<String>? countryCode,
    Expression<String>? isoCode2,
    Expression<String>? isoCode3,
    Expression<int>? population,
    Expression<int>? area,
    Expression<double>? gdp,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (nameInEnglish != null) 'name_in_english': nameInEnglish,
      if (countryCode != null) 'country_code': countryCode,
      if (isoCode2 != null) 'iso_code2': isoCode2,
      if (isoCode3 != null) 'iso_code3': isoCode3,
      if (population != null) 'population': population,
      if (area != null) 'area': area,
      if (gdp != null) 'gdp': gdp,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CountryCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String>? nameInEnglish,
    Value<String>? countryCode,
    Value<String>? isoCode2,
    Value<String>? isoCode3,
    Value<int>? population,
    Value<int>? area,
    Value<double?>? gdp,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return CountryCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      nameInEnglish: nameInEnglish ?? this.nameInEnglish,
      countryCode: countryCode ?? this.countryCode,
      isoCode2: isoCode2 ?? this.isoCode2,
      isoCode3: isoCode3 ?? this.isoCode3,
      population: population ?? this.population,
      area: area ?? this.area,
      gdp: gdp ?? this.gdp,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameInEnglish.present) {
      map['name_in_english'] = Variable<String>(nameInEnglish.value);
    }
    if (countryCode.present) {
      map['country_code'] = Variable<String>(countryCode.value);
    }
    if (isoCode2.present) {
      map['iso_code2'] = Variable<String>(isoCode2.value);
    }
    if (isoCode3.present) {
      map['iso_code3'] = Variable<String>(isoCode3.value);
    }
    if (population.present) {
      map['population'] = Variable<int>(population.value);
    }
    if (area.present) {
      map['area'] = Variable<int>(area.value);
    }
    if (gdp.present) {
      map['gdp'] = Variable<double>(gdp.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountryCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('nameInEnglish: $nameInEnglish, ')
          ..write('countryCode: $countryCode, ')
          ..write('isoCode2: $isoCode2, ')
          ..write('isoCode3: $isoCode3, ')
          ..write('population: $population, ')
          ..write('area: $area, ')
          ..write('gdp: $gdp, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CouponTypeTable extends CouponType
    with TableInfo<$CouponTypeTable, CouponTypeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CouponTypeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 5,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'coupon_type';
  @override
  VerificationContext validateIntegrity(
    Insertable<CouponTypeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CouponTypeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CouponTypeData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $CouponTypeTable createAlias(String alias) {
    return $CouponTypeTable(attachedDatabase, alias);
  }
}

class CouponTypeData extends DataClass implements Insertable<CouponTypeData> {
  final String id;
  final String name;
  const CouponTypeData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CouponTypeCompanion toCompanion(bool nullToAbsent) {
    return CouponTypeCompanion(id: Value(id), name: Value(name));
  }

  factory CouponTypeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CouponTypeData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  CouponTypeData copyWith({String? id, String? name}) =>
      CouponTypeData(id: id ?? this.id, name: name ?? this.name);
  CouponTypeData copyWithCompanion(CouponTypeCompanion data) {
    return CouponTypeData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CouponTypeData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CouponTypeData &&
          other.id == this.id &&
          other.name == this.name);
}

class CouponTypeCompanion extends UpdateCompanion<CouponTypeData> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const CouponTypeCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CouponTypeCompanion.insert({
    required String id,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<CouponTypeData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CouponTypeCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return CouponTypeCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CouponTypeCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CouponTable extends Coupon with TableInfo<$CouponTable, CouponData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CouponTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES coupon_type (id)',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 1024,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    active,
    type,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'coupon';
  @override
  VerificationContext validateIntegrity(
    Insertable<CouponData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CouponData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CouponData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $CouponTable createAlias(String alias) {
    return $CouponTable(attachedDatabase, alias);
  }
}

class CouponData extends DataClass implements Insertable<CouponData> {
  final int id;
  final String code;
  final String name;
  final bool active;
  final String type;
  final String? description;
  const CouponData({
    required this.id,
    required this.code,
    required this.name,
    required this.active,
    required this.type,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['active'] = Variable<bool>(active);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  CouponCompanion toCompanion(bool nullToAbsent) {
    return CouponCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      active: Value(active),
      type: Value(type),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory CouponData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CouponData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      active: serializer.fromJson<bool>(json['active']),
      type: serializer.fromJson<String>(json['type']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'active': serializer.toJson<bool>(active),
      'type': serializer.toJson<String>(type),
      'description': serializer.toJson<String?>(description),
    };
  }

  CouponData copyWith({
    int? id,
    String? code,
    String? name,
    bool? active,
    String? type,
    Value<String?> description = const Value.absent(),
  }) => CouponData(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    active: active ?? this.active,
    type: type ?? this.type,
    description: description.present ? description.value : this.description,
  );
  CouponData copyWithCompanion(CouponCompanion data) {
    return CouponData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      active: data.active.present ? data.active.value : this.active,
      type: data.type.present ? data.type.value : this.type,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CouponData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('active: $active, ')
          ..write('type: $type, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name, active, type, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CouponData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.active == this.active &&
          other.type == this.type &&
          other.description == this.description);
}

class CouponCompanion extends UpdateCompanion<CouponData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<bool> active;
  final Value<String> type;
  final Value<String?> description;
  const CouponCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.active = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
  });
  CouponCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required bool active,
    required String type,
    this.description = const Value.absent(),
  }) : code = Value(code),
       name = Value(name),
       active = Value(active),
       type = Value(type);
  static Insertable<CouponData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<bool>? active,
    Expression<String>? type,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (active != null) 'active': active,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
    });
  }

  CouponCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<bool>? active,
    Value<String>? type,
    Value<String?>? description,
  }) {
    return CouponCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      active: active ?? this.active,
      type: type ?? this.type,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CouponCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('active: $active, ')
          ..write('type: $type, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $CurrencyTable extends Currency
    with TableInfo<$CurrencyTable, CurrencyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrencyTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 3,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
    'symbol',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 1024,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, symbol, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currency';
  @override
  VerificationContext validateIntegrity(
    Insertable<CurrencyData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(
        _symbolMeta,
        symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta),
      );
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CurrencyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      symbol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symbol'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $CurrencyTable createAlias(String alias) {
    return $CurrencyTable(attachedDatabase, alias);
  }
}

class CurrencyData extends DataClass implements Insertable<CurrencyData> {
  final String id;
  final String symbol;
  final String name;
  final String? description;
  const CurrencyData({
    required this.id,
    required this.symbol,
    required this.name,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['symbol'] = Variable<String>(symbol);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  CurrencyCompanion toCompanion(bool nullToAbsent) {
    return CurrencyCompanion(
      id: Value(id),
      symbol: Value(symbol),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory CurrencyData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyData(
      id: serializer.fromJson<String>(json['id']),
      symbol: serializer.fromJson<String>(json['symbol']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'symbol': serializer.toJson<String>(symbol),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  CurrencyData copyWith({
    String? id,
    String? symbol,
    String? name,
    Value<String?> description = const Value.absent(),
  }) => CurrencyData(
    id: id ?? this.id,
    symbol: symbol ?? this.symbol,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
  );
  CurrencyData copyWithCompanion(CurrencyCompanion data) {
    return CurrencyData(
      id: data.id.present ? data.id.value : this.id,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyData(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, symbol, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyData &&
          other.id == this.id &&
          other.symbol == this.symbol &&
          other.name == this.name &&
          other.description == this.description);
}

class CurrencyCompanion extends UpdateCompanion<CurrencyData> {
  final Value<String> id;
  final Value<String> symbol;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> rowid;
  const CurrencyCompanion({
    this.id = const Value.absent(),
    this.symbol = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurrencyCompanion.insert({
    required String id,
    required String symbol,
    required String name,
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       symbol = Value(symbol),
       name = Value(name);
  static Insertable<CurrencyData> custom({
    Expression<String>? id,
    Expression<String>? symbol,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (symbol != null) 'symbol': symbol,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurrencyCompanion copyWith({
    Value<String>? id,
    Value<String>? symbol,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return CurrencyCompanion(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyCompanion(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomerTable extends Customer
    with TableInfo<$CustomerTable, CustomerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vipMeta = const VerificationMeta('vip');
  @override
  late final GeneratedColumn<bool> vip = GeneratedColumn<bool>(
    'vip',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("vip" IN (0, 1))',
    ),
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    vip,
    address,
    phone,
    email,
    imagePath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customer';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomerData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('vip')) {
      context.handle(
        _vipMeta,
        vip.isAcceptableOrUnknown(data['vip']!, _vipMeta),
      );
    } else if (isInserting) {
      context.missing(_vipMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      vip: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}vip'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
    );
  }

  @override
  $CustomerTable createAlias(String alias) {
    return $CustomerTable(attachedDatabase, alias);
  }
}

class CustomerData extends DataClass implements Insertable<CustomerData> {
  final int id;
  final String code;
  final String name;
  final bool vip;
  final String? address;
  final String? phone;
  final String email;
  final String? imagePath;
  const CustomerData({
    required this.id,
    required this.code,
    required this.name,
    required this.vip,
    this.address,
    this.phone,
    required this.email,
    this.imagePath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['vip'] = Variable<bool>(vip);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    return map;
  }

  CustomerCompanion toCompanion(bool nullToAbsent) {
    return CustomerCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      vip: Value(vip),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      email: Value(email),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
    );
  }

  factory CustomerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      vip: serializer.fromJson<bool>(json['vip']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String>(json['email']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'vip': serializer.toJson<bool>(vip),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String>(email),
      'imagePath': serializer.toJson<String?>(imagePath),
    };
  }

  CustomerData copyWith({
    int? id,
    String? code,
    String? name,
    bool? vip,
    Value<String?> address = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    String? email,
    Value<String?> imagePath = const Value.absent(),
  }) => CustomerData(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    vip: vip ?? this.vip,
    address: address.present ? address.value : this.address,
    phone: phone.present ? phone.value : this.phone,
    email: email ?? this.email,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
  );
  CustomerData copyWithCompanion(CustomerCompanion data) {
    return CustomerData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      vip: data.vip.present ? data.vip.value : this.vip,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('vip: $vip, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, code, name, vip, address, phone, email, imagePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.vip == this.vip &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.imagePath == this.imagePath);
}

class CustomerCompanion extends UpdateCompanion<CustomerData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<bool> vip;
  final Value<String?> address;
  final Value<String?> phone;
  final Value<String> email;
  final Value<String?> imagePath;
  const CustomerCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.vip = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.imagePath = const Value.absent(),
  });
  CustomerCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required bool vip,
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    required String email,
    this.imagePath = const Value.absent(),
  }) : code = Value(code),
       name = Value(name),
       vip = Value(vip),
       email = Value(email);
  static Insertable<CustomerData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<bool>? vip,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? imagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (vip != null) 'vip': vip,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (imagePath != null) 'image_path': imagePath,
    });
  }

  CustomerCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<bool>? vip,
    Value<String?>? address,
    Value<String?>? phone,
    Value<String>? email,
    Value<String?>? imagePath,
  }) {
    return CustomerCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      vip: vip ?? this.vip,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (vip.present) {
      map['vip'] = Variable<bool>(vip.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('vip: $vip, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }
}

class $EmploymentHistoryTable extends EmploymentHistory
    with TableInfo<$EmploymentHistoryTable, EmploymentHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmploymentHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _employeeIdMeta = const VerificationMeta(
    'employeeId',
  );
  @override
  late final GeneratedColumn<int> employeeId = GeneratedColumn<int>(
    'employee_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES employee (id)',
    ),
  );
  static const VerificationMeta _employeePositionIdMeta =
      const VerificationMeta('employeePositionId');
  @override
  late final GeneratedColumn<int> employeePositionId = GeneratedColumn<int>(
    'employee_position_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES employee_position (id)',
    ),
  );
  static const VerificationMeta _departmentIdMeta = const VerificationMeta(
    'departmentId',
  );
  @override
  late final GeneratedColumn<int> departmentId = GeneratedColumn<int>(
    'department_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES department (id)',
    ),
  );
  static const VerificationMeta _companyIdMeta = const VerificationMeta(
    'companyId',
  );
  @override
  late final GeneratedColumn<int> companyId = GeneratedColumn<int>(
    'company_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES company (id)',
    ),
  );
  static const VerificationMeta _fromDateMeta = const VerificationMeta(
    'fromDate',
  );
  @override
  late final GeneratedColumn<DateTime> fromDate = GeneratedColumn<DateTime>(
    'from_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toDateMeta = const VerificationMeta('toDate');
  @override
  late final GeneratedColumn<DateTime> toDate = GeneratedColumn<DateTime>(
    'to_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    employeeId,
    employeePositionId,
    departmentId,
    companyId,
    fromDate,
    toDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employment_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<EmploymentHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('employee_id')) {
      context.handle(
        _employeeIdMeta,
        employeeId.isAcceptableOrUnknown(data['employee_id']!, _employeeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('employee_position_id')) {
      context.handle(
        _employeePositionIdMeta,
        employeePositionId.isAcceptableOrUnknown(
          data['employee_position_id']!,
          _employeePositionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_employeePositionIdMeta);
    }
    if (data.containsKey('department_id')) {
      context.handle(
        _departmentIdMeta,
        departmentId.isAcceptableOrUnknown(
          data['department_id']!,
          _departmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_departmentIdMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(
        _companyIdMeta,
        companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('from_date')) {
      context.handle(
        _fromDateMeta,
        fromDate.isAcceptableOrUnknown(data['from_date']!, _fromDateMeta),
      );
    } else if (isInserting) {
      context.missing(_fromDateMeta);
    }
    if (data.containsKey('to_date')) {
      context.handle(
        _toDateMeta,
        toDate.isAcceptableOrUnknown(data['to_date']!, _toDateMeta),
      );
    } else if (isInserting) {
      context.missing(_toDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmploymentHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmploymentHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      employeeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}employee_id'],
      )!,
      employeePositionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}employee_position_id'],
      )!,
      departmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}department_id'],
      )!,
      companyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}company_id'],
      )!,
      fromDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}from_date'],
      )!,
      toDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}to_date'],
      )!,
    );
  }

  @override
  $EmploymentHistoryTable createAlias(String alias) {
    return $EmploymentHistoryTable(attachedDatabase, alias);
  }
}

class EmploymentHistoryData extends DataClass
    implements Insertable<EmploymentHistoryData> {
  final int id;
  final int employeeId;
  final int employeePositionId;
  final int departmentId;
  final int companyId;
  final DateTime fromDate;
  final DateTime toDate;
  const EmploymentHistoryData({
    required this.id,
    required this.employeeId,
    required this.employeePositionId,
    required this.departmentId,
    required this.companyId,
    required this.fromDate,
    required this.toDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['employee_id'] = Variable<int>(employeeId);
    map['employee_position_id'] = Variable<int>(employeePositionId);
    map['department_id'] = Variable<int>(departmentId);
    map['company_id'] = Variable<int>(companyId);
    map['from_date'] = Variable<DateTime>(fromDate);
    map['to_date'] = Variable<DateTime>(toDate);
    return map;
  }

  EmploymentHistoryCompanion toCompanion(bool nullToAbsent) {
    return EmploymentHistoryCompanion(
      id: Value(id),
      employeeId: Value(employeeId),
      employeePositionId: Value(employeePositionId),
      departmentId: Value(departmentId),
      companyId: Value(companyId),
      fromDate: Value(fromDate),
      toDate: Value(toDate),
    );
  }

  factory EmploymentHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmploymentHistoryData(
      id: serializer.fromJson<int>(json['id']),
      employeeId: serializer.fromJson<int>(json['employeeId']),
      employeePositionId: serializer.fromJson<int>(json['employeePositionId']),
      departmentId: serializer.fromJson<int>(json['departmentId']),
      companyId: serializer.fromJson<int>(json['companyId']),
      fromDate: serializer.fromJson<DateTime>(json['fromDate']),
      toDate: serializer.fromJson<DateTime>(json['toDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'employeeId': serializer.toJson<int>(employeeId),
      'employeePositionId': serializer.toJson<int>(employeePositionId),
      'departmentId': serializer.toJson<int>(departmentId),
      'companyId': serializer.toJson<int>(companyId),
      'fromDate': serializer.toJson<DateTime>(fromDate),
      'toDate': serializer.toJson<DateTime>(toDate),
    };
  }

  EmploymentHistoryData copyWith({
    int? id,
    int? employeeId,
    int? employeePositionId,
    int? departmentId,
    int? companyId,
    DateTime? fromDate,
    DateTime? toDate,
  }) => EmploymentHistoryData(
    id: id ?? this.id,
    employeeId: employeeId ?? this.employeeId,
    employeePositionId: employeePositionId ?? this.employeePositionId,
    departmentId: departmentId ?? this.departmentId,
    companyId: companyId ?? this.companyId,
    fromDate: fromDate ?? this.fromDate,
    toDate: toDate ?? this.toDate,
  );
  EmploymentHistoryData copyWithCompanion(EmploymentHistoryCompanion data) {
    return EmploymentHistoryData(
      id: data.id.present ? data.id.value : this.id,
      employeeId: data.employeeId.present
          ? data.employeeId.value
          : this.employeeId,
      employeePositionId: data.employeePositionId.present
          ? data.employeePositionId.value
          : this.employeePositionId,
      departmentId: data.departmentId.present
          ? data.departmentId.value
          : this.departmentId,
      companyId: data.companyId.present ? data.companyId.value : this.companyId,
      fromDate: data.fromDate.present ? data.fromDate.value : this.fromDate,
      toDate: data.toDate.present ? data.toDate.value : this.toDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmploymentHistoryData(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('employeePositionId: $employeePositionId, ')
          ..write('departmentId: $departmentId, ')
          ..write('companyId: $companyId, ')
          ..write('fromDate: $fromDate, ')
          ..write('toDate: $toDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    employeeId,
    employeePositionId,
    departmentId,
    companyId,
    fromDate,
    toDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmploymentHistoryData &&
          other.id == this.id &&
          other.employeeId == this.employeeId &&
          other.employeePositionId == this.employeePositionId &&
          other.departmentId == this.departmentId &&
          other.companyId == this.companyId &&
          other.fromDate == this.fromDate &&
          other.toDate == this.toDate);
}

class EmploymentHistoryCompanion
    extends UpdateCompanion<EmploymentHistoryData> {
  final Value<int> id;
  final Value<int> employeeId;
  final Value<int> employeePositionId;
  final Value<int> departmentId;
  final Value<int> companyId;
  final Value<DateTime> fromDate;
  final Value<DateTime> toDate;
  const EmploymentHistoryCompanion({
    this.id = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.employeePositionId = const Value.absent(),
    this.departmentId = const Value.absent(),
    this.companyId = const Value.absent(),
    this.fromDate = const Value.absent(),
    this.toDate = const Value.absent(),
  });
  EmploymentHistoryCompanion.insert({
    this.id = const Value.absent(),
    required int employeeId,
    required int employeePositionId,
    required int departmentId,
    required int companyId,
    required DateTime fromDate,
    required DateTime toDate,
  }) : employeeId = Value(employeeId),
       employeePositionId = Value(employeePositionId),
       departmentId = Value(departmentId),
       companyId = Value(companyId),
       fromDate = Value(fromDate),
       toDate = Value(toDate);
  static Insertable<EmploymentHistoryData> custom({
    Expression<int>? id,
    Expression<int>? employeeId,
    Expression<int>? employeePositionId,
    Expression<int>? departmentId,
    Expression<int>? companyId,
    Expression<DateTime>? fromDate,
    Expression<DateTime>? toDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (employeeId != null) 'employee_id': employeeId,
      if (employeePositionId != null)
        'employee_position_id': employeePositionId,
      if (departmentId != null) 'department_id': departmentId,
      if (companyId != null) 'company_id': companyId,
      if (fromDate != null) 'from_date': fromDate,
      if (toDate != null) 'to_date': toDate,
    });
  }

  EmploymentHistoryCompanion copyWith({
    Value<int>? id,
    Value<int>? employeeId,
    Value<int>? employeePositionId,
    Value<int>? departmentId,
    Value<int>? companyId,
    Value<DateTime>? fromDate,
    Value<DateTime>? toDate,
  }) {
    return EmploymentHistoryCompanion(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      employeePositionId: employeePositionId ?? this.employeePositionId,
      departmentId: departmentId ?? this.departmentId,
      companyId: companyId ?? this.companyId,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<int>(employeeId.value);
    }
    if (employeePositionId.present) {
      map['employee_position_id'] = Variable<int>(employeePositionId.value);
    }
    if (departmentId.present) {
      map['department_id'] = Variable<int>(departmentId.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (fromDate.present) {
      map['from_date'] = Variable<DateTime>(fromDate.value);
    }
    if (toDate.present) {
      map['to_date'] = Variable<DateTime>(toDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmploymentHistoryCompanion(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('employeePositionId: $employeePositionId, ')
          ..write('departmentId: $departmentId, ')
          ..write('companyId: $companyId, ')
          ..write('fromDate: $fromDate, ')
          ..write('toDate: $toDate')
          ..write(')'))
        .toString();
  }
}

class $FootballPlayerTable extends FootballPlayer
    with TableInfo<$FootballPlayerTable, FootballPlayerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FootballPlayerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _birthdayMeta = const VerificationMeta(
    'birthday',
  );
  @override
  late final GeneratedColumn<DateTime> birthday = GeneratedColumn<DateTime>(
    'birthday',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryIdMeta = const VerificationMeta(
    'countryId',
  );
  @override
  late final GeneratedColumn<String> countryId = GeneratedColumn<String>(
    'country_id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 2,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES country (id)',
    ),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 1024,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fullName,
    birthday,
    countryId,
    imagePath,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'football_player';
  @override
  VerificationContext validateIntegrity(
    Insertable<FootballPlayerData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('birthday')) {
      context.handle(
        _birthdayMeta,
        birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta),
      );
    } else if (isInserting) {
      context.missing(_birthdayMeta);
    }
    if (data.containsKey('country_id')) {
      context.handle(
        _countryIdMeta,
        countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_countryIdMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FootballPlayerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FootballPlayerData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      birthday: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birthday'],
      )!,
      countryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_id'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $FootballPlayerTable createAlias(String alias) {
    return $FootballPlayerTable(attachedDatabase, alias);
  }
}

class FootballPlayerData extends DataClass
    implements Insertable<FootballPlayerData> {
  final int id;
  final String fullName;
  final DateTime birthday;
  final String countryId;
  final String? imagePath;
  final String? description;
  const FootballPlayerData({
    required this.id,
    required this.fullName,
    required this.birthday,
    required this.countryId,
    this.imagePath,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['birthday'] = Variable<DateTime>(birthday);
    map['country_id'] = Variable<String>(countryId);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  FootballPlayerCompanion toCompanion(bool nullToAbsent) {
    return FootballPlayerCompanion(
      id: Value(id),
      fullName: Value(fullName),
      birthday: Value(birthday),
      countryId: Value(countryId),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory FootballPlayerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FootballPlayerData(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      birthday: serializer.fromJson<DateTime>(json['birthday']),
      countryId: serializer.fromJson<String>(json['countryId']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'birthday': serializer.toJson<DateTime>(birthday),
      'countryId': serializer.toJson<String>(countryId),
      'imagePath': serializer.toJson<String?>(imagePath),
      'description': serializer.toJson<String?>(description),
    };
  }

  FootballPlayerData copyWith({
    int? id,
    String? fullName,
    DateTime? birthday,
    String? countryId,
    Value<String?> imagePath = const Value.absent(),
    Value<String?> description = const Value.absent(),
  }) => FootballPlayerData(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    birthday: birthday ?? this.birthday,
    countryId: countryId ?? this.countryId,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    description: description.present ? description.value : this.description,
  );
  FootballPlayerData copyWithCompanion(FootballPlayerCompanion data) {
    return FootballPlayerData(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      birthday: data.birthday.present ? data.birthday.value : this.birthday,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FootballPlayerData(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('birthday: $birthday, ')
          ..write('countryId: $countryId, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, fullName, birthday, countryId, imagePath, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FootballPlayerData &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.birthday == this.birthday &&
          other.countryId == this.countryId &&
          other.imagePath == this.imagePath &&
          other.description == this.description);
}

class FootballPlayerCompanion extends UpdateCompanion<FootballPlayerData> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<DateTime> birthday;
  final Value<String> countryId;
  final Value<String?> imagePath;
  final Value<String?> description;
  const FootballPlayerCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.birthday = const Value.absent(),
    this.countryId = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
  });
  FootballPlayerCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required DateTime birthday,
    required String countryId,
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
  }) : fullName = Value(fullName),
       birthday = Value(birthday),
       countryId = Value(countryId);
  static Insertable<FootballPlayerData> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<DateTime>? birthday,
    Expression<String>? countryId,
    Expression<String>? imagePath,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (birthday != null) 'birthday': birthday,
      if (countryId != null) 'country_id': countryId,
      if (imagePath != null) 'image_path': imagePath,
      if (description != null) 'description': description,
    });
  }

  FootballPlayerCompanion copyWith({
    Value<int>? id,
    Value<String>? fullName,
    Value<DateTime>? birthday,
    Value<String>? countryId,
    Value<String?>? imagePath,
    Value<String?>? description,
  }) {
    return FootballPlayerCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      birthday: birthday ?? this.birthday,
      countryId: countryId ?? this.countryId,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<DateTime>(birthday.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String>(countryId.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FootballPlayerCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('birthday: $birthday, ')
          ..write('countryId: $countryId, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $GenderTable extends Gender with TableInfo<$GenderTable, GenderData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenderTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 8,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gender';
  @override
  VerificationContext validateIntegrity(
    Insertable<GenderData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  GenderData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GenderData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $GenderTable createAlias(String alias) {
    return $GenderTable(attachedDatabase, alias);
  }
}

class GenderData extends DataClass implements Insertable<GenderData> {
  final String id;
  final String name;
  const GenderData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  GenderCompanion toCompanion(bool nullToAbsent) {
    return GenderCompanion(id: Value(id), name: Value(name));
  }

  factory GenderData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GenderData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  GenderData copyWith({String? id, String? name}) =>
      GenderData(id: id ?? this.id, name: name ?? this.name);
  GenderData copyWithCompanion(GenderCompanion data) {
    return GenderData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GenderData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GenderData && other.id == this.id && other.name == this.name);
}

class GenderCompanion extends UpdateCompanion<GenderData> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const GenderCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GenderCompanion.insert({
    required String id,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<GenderData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GenderCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return GenderCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenderCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LanguageTable extends Language
    with TableInfo<$LanguageTable, LanguageData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LanguageTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 8,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameInEnglishMeta = const VerificationMeta(
    'nameInEnglish',
  );
  @override
  late final GeneratedColumn<String> nameInEnglish = GeneratedColumn<String>(
    'name_in_english',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seqNumMeta = const VerificationMeta('seqNum');
  @override
  late final GeneratedColumn<int> seqNum = GeneratedColumn<int>(
    'seq_num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, nameInEnglish, seqNum];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'language';
  @override
  VerificationContext validateIntegrity(
    Insertable<LanguageData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_in_english')) {
      context.handle(
        _nameInEnglishMeta,
        nameInEnglish.isAcceptableOrUnknown(
          data['name_in_english']!,
          _nameInEnglishMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nameInEnglishMeta);
    }
    if (data.containsKey('seq_num')) {
      context.handle(
        _seqNumMeta,
        seqNum.isAcceptableOrUnknown(data['seq_num']!, _seqNumMeta),
      );
    } else if (isInserting) {
      context.missing(_seqNumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LanguageData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LanguageData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameInEnglish: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_in_english'],
      )!,
      seqNum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seq_num'],
      )!,
    );
  }

  @override
  $LanguageTable createAlias(String alias) {
    return $LanguageTable(attachedDatabase, alias);
  }
}

class LanguageData extends DataClass implements Insertable<LanguageData> {
  final String id;
  final String name;
  final String nameInEnglish;
  final int seqNum;
  const LanguageData({
    required this.id,
    required this.name,
    required this.nameInEnglish,
    required this.seqNum,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['name_in_english'] = Variable<String>(nameInEnglish);
    map['seq_num'] = Variable<int>(seqNum);
    return map;
  }

  LanguageCompanion toCompanion(bool nullToAbsent) {
    return LanguageCompanion(
      id: Value(id),
      name: Value(name),
      nameInEnglish: Value(nameInEnglish),
      seqNum: Value(seqNum),
    );
  }

  factory LanguageData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LanguageData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nameInEnglish: serializer.fromJson<String>(json['nameInEnglish']),
      seqNum: serializer.fromJson<int>(json['seqNum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nameInEnglish': serializer.toJson<String>(nameInEnglish),
      'seqNum': serializer.toJson<int>(seqNum),
    };
  }

  LanguageData copyWith({
    String? id,
    String? name,
    String? nameInEnglish,
    int? seqNum,
  }) => LanguageData(
    id: id ?? this.id,
    name: name ?? this.name,
    nameInEnglish: nameInEnglish ?? this.nameInEnglish,
    seqNum: seqNum ?? this.seqNum,
  );
  LanguageData copyWithCompanion(LanguageCompanion data) {
    return LanguageData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nameInEnglish: data.nameInEnglish.present
          ? data.nameInEnglish.value
          : this.nameInEnglish,
      seqNum: data.seqNum.present ? data.seqNum.value : this.seqNum,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LanguageData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameInEnglish: $nameInEnglish, ')
          ..write('seqNum: $seqNum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nameInEnglish, seqNum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LanguageData &&
          other.id == this.id &&
          other.name == this.name &&
          other.nameInEnglish == this.nameInEnglish &&
          other.seqNum == this.seqNum);
}

class LanguageCompanion extends UpdateCompanion<LanguageData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nameInEnglish;
  final Value<int> seqNum;
  final Value<int> rowid;
  const LanguageCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nameInEnglish = const Value.absent(),
    this.seqNum = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LanguageCompanion.insert({
    required String id,
    required String name,
    required String nameInEnglish,
    required int seqNum,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       nameInEnglish = Value(nameInEnglish),
       seqNum = Value(seqNum);
  static Insertable<LanguageData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? nameInEnglish,
    Expression<int>? seqNum,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nameInEnglish != null) 'name_in_english': nameInEnglish,
      if (seqNum != null) 'seq_num': seqNum,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LanguageCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? nameInEnglish,
    Value<int>? seqNum,
    Value<int>? rowid,
  }) {
    return LanguageCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nameInEnglish: nameInEnglish ?? this.nameInEnglish,
      seqNum: seqNum ?? this.seqNum,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameInEnglish.present) {
      map['name_in_english'] = Variable<String>(nameInEnglish.value);
    }
    if (seqNum.present) {
      map['seq_num'] = Variable<int>(seqNum.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LanguageCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nameInEnglish: $nameInEnglish, ')
          ..write('seqNum: $seqNum, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LessonTable extends Lesson with TableInfo<$LessonTable, LessonData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LessonTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleInEnglishMeta = const VerificationMeta(
    'titleInEnglish',
  );
  @override
  late final GeneratedColumn<String> titleInEnglish = GeneratedColumn<String>(
    'title_in_english',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seqNumMeta = const VerificationMeta('seqNum');
  @override
  late final GeneratedColumn<int> seqNum = GeneratedColumn<int>(
    'seq_num',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lockedMeta = const VerificationMeta('locked');
  @override
  late final GeneratedColumn<bool> locked = GeneratedColumn<bool>(
    'locked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("locked" IN (0, 1))',
    ),
  );
  static const VerificationMeta _publishedMeta = const VerificationMeta(
    'published',
  );
  @override
  late final GeneratedColumn<bool> published = GeneratedColumn<bool>(
    'published',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("published" IN (0, 1))',
    ),
  );
  static const VerificationMeta _publishDateMeta = const VerificationMeta(
    'publishDate',
  );
  @override
  late final GeneratedColumn<DateTime> publishDate = GeneratedColumn<DateTime>(
    'publish_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bookIdMeta = const VerificationMeta('bookId');
  @override
  late final GeneratedColumn<int> bookId = GeneratedColumn<int>(
    'book_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES book (id)',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    titleInEnglish,
    seqNum,
    locked,
    published,
    publishDate,
    imagePath,
    bookId,
    description,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lesson';
  @override
  VerificationContext validateIntegrity(
    Insertable<LessonData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('title_in_english')) {
      context.handle(
        _titleInEnglishMeta,
        titleInEnglish.isAcceptableOrUnknown(
          data['title_in_english']!,
          _titleInEnglishMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_titleInEnglishMeta);
    }
    if (data.containsKey('seq_num')) {
      context.handle(
        _seqNumMeta,
        seqNum.isAcceptableOrUnknown(data['seq_num']!, _seqNumMeta),
      );
    } else if (isInserting) {
      context.missing(_seqNumMeta);
    }
    if (data.containsKey('locked')) {
      context.handle(
        _lockedMeta,
        locked.isAcceptableOrUnknown(data['locked']!, _lockedMeta),
      );
    } else if (isInserting) {
      context.missing(_lockedMeta);
    }
    if (data.containsKey('published')) {
      context.handle(
        _publishedMeta,
        published.isAcceptableOrUnknown(data['published']!, _publishedMeta),
      );
    } else if (isInserting) {
      context.missing(_publishedMeta);
    }
    if (data.containsKey('publish_date')) {
      context.handle(
        _publishDateMeta,
        publishDate.isAcceptableOrUnknown(
          data['publish_date']!,
          _publishDateMeta,
        ),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('book_id')) {
      context.handle(
        _bookIdMeta,
        bookId.isAcceptableOrUnknown(data['book_id']!, _bookIdMeta),
      );
    } else if (isInserting) {
      context.missing(_bookIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LessonData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LessonData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      titleInEnglish: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_in_english'],
      )!,
      seqNum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seq_num'],
      )!,
      locked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}locked'],
      )!,
      published: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}published'],
      )!,
      publishDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}publish_date'],
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      bookId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}book_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $LessonTable createAlias(String alias) {
    return $LessonTable(attachedDatabase, alias);
  }
}

class LessonData extends DataClass implements Insertable<LessonData> {
  final int id;
  final String title;
  final String titleInEnglish;
  final int seqNum;
  final bool locked;
  final bool published;
  final DateTime? publishDate;
  final String? imagePath;
  final int bookId;
  final String? description;
  final String? note;
  const LessonData({
    required this.id,
    required this.title,
    required this.titleInEnglish,
    required this.seqNum,
    required this.locked,
    required this.published,
    this.publishDate,
    this.imagePath,
    required this.bookId,
    this.description,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['title_in_english'] = Variable<String>(titleInEnglish);
    map['seq_num'] = Variable<int>(seqNum);
    map['locked'] = Variable<bool>(locked);
    map['published'] = Variable<bool>(published);
    if (!nullToAbsent || publishDate != null) {
      map['publish_date'] = Variable<DateTime>(publishDate);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['book_id'] = Variable<int>(bookId);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  LessonCompanion toCompanion(bool nullToAbsent) {
    return LessonCompanion(
      id: Value(id),
      title: Value(title),
      titleInEnglish: Value(titleInEnglish),
      seqNum: Value(seqNum),
      locked: Value(locked),
      published: Value(published),
      publishDate: publishDate == null && nullToAbsent
          ? const Value.absent()
          : Value(publishDate),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      bookId: Value(bookId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory LessonData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LessonData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      titleInEnglish: serializer.fromJson<String>(json['titleInEnglish']),
      seqNum: serializer.fromJson<int>(json['seqNum']),
      locked: serializer.fromJson<bool>(json['locked']),
      published: serializer.fromJson<bool>(json['published']),
      publishDate: serializer.fromJson<DateTime?>(json['publishDate']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      bookId: serializer.fromJson<int>(json['bookId']),
      description: serializer.fromJson<String?>(json['description']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'titleInEnglish': serializer.toJson<String>(titleInEnglish),
      'seqNum': serializer.toJson<int>(seqNum),
      'locked': serializer.toJson<bool>(locked),
      'published': serializer.toJson<bool>(published),
      'publishDate': serializer.toJson<DateTime?>(publishDate),
      'imagePath': serializer.toJson<String?>(imagePath),
      'bookId': serializer.toJson<int>(bookId),
      'description': serializer.toJson<String?>(description),
      'note': serializer.toJson<String?>(note),
    };
  }

  LessonData copyWith({
    int? id,
    String? title,
    String? titleInEnglish,
    int? seqNum,
    bool? locked,
    bool? published,
    Value<DateTime?> publishDate = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
    int? bookId,
    Value<String?> description = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => LessonData(
    id: id ?? this.id,
    title: title ?? this.title,
    titleInEnglish: titleInEnglish ?? this.titleInEnglish,
    seqNum: seqNum ?? this.seqNum,
    locked: locked ?? this.locked,
    published: published ?? this.published,
    publishDate: publishDate.present ? publishDate.value : this.publishDate,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    bookId: bookId ?? this.bookId,
    description: description.present ? description.value : this.description,
    note: note.present ? note.value : this.note,
  );
  LessonData copyWithCompanion(LessonCompanion data) {
    return LessonData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      titleInEnglish: data.titleInEnglish.present
          ? data.titleInEnglish.value
          : this.titleInEnglish,
      seqNum: data.seqNum.present ? data.seqNum.value : this.seqNum,
      locked: data.locked.present ? data.locked.value : this.locked,
      published: data.published.present ? data.published.value : this.published,
      publishDate: data.publishDate.present
          ? data.publishDate.value
          : this.publishDate,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      bookId: data.bookId.present ? data.bookId.value : this.bookId,
      description: data.description.present
          ? data.description.value
          : this.description,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LessonData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('titleInEnglish: $titleInEnglish, ')
          ..write('seqNum: $seqNum, ')
          ..write('locked: $locked, ')
          ..write('published: $published, ')
          ..write('publishDate: $publishDate, ')
          ..write('imagePath: $imagePath, ')
          ..write('bookId: $bookId, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    titleInEnglish,
    seqNum,
    locked,
    published,
    publishDate,
    imagePath,
    bookId,
    description,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LessonData &&
          other.id == this.id &&
          other.title == this.title &&
          other.titleInEnglish == this.titleInEnglish &&
          other.seqNum == this.seqNum &&
          other.locked == this.locked &&
          other.published == this.published &&
          other.publishDate == this.publishDate &&
          other.imagePath == this.imagePath &&
          other.bookId == this.bookId &&
          other.description == this.description &&
          other.note == this.note);
}

class LessonCompanion extends UpdateCompanion<LessonData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> titleInEnglish;
  final Value<int> seqNum;
  final Value<bool> locked;
  final Value<bool> published;
  final Value<DateTime?> publishDate;
  final Value<String?> imagePath;
  final Value<int> bookId;
  final Value<String?> description;
  final Value<String?> note;
  const LessonCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.titleInEnglish = const Value.absent(),
    this.seqNum = const Value.absent(),
    this.locked = const Value.absent(),
    this.published = const Value.absent(),
    this.publishDate = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.bookId = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
  });
  LessonCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String titleInEnglish,
    required int seqNum,
    required bool locked,
    required bool published,
    this.publishDate = const Value.absent(),
    this.imagePath = const Value.absent(),
    required int bookId,
    this.description = const Value.absent(),
    this.note = const Value.absent(),
  }) : title = Value(title),
       titleInEnglish = Value(titleInEnglish),
       seqNum = Value(seqNum),
       locked = Value(locked),
       published = Value(published),
       bookId = Value(bookId);
  static Insertable<LessonData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? titleInEnglish,
    Expression<int>? seqNum,
    Expression<bool>? locked,
    Expression<bool>? published,
    Expression<DateTime>? publishDate,
    Expression<String>? imagePath,
    Expression<int>? bookId,
    Expression<String>? description,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (titleInEnglish != null) 'title_in_english': titleInEnglish,
      if (seqNum != null) 'seq_num': seqNum,
      if (locked != null) 'locked': locked,
      if (published != null) 'published': published,
      if (publishDate != null) 'publish_date': publishDate,
      if (imagePath != null) 'image_path': imagePath,
      if (bookId != null) 'book_id': bookId,
      if (description != null) 'description': description,
      if (note != null) 'note': note,
    });
  }

  LessonCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? titleInEnglish,
    Value<int>? seqNum,
    Value<bool>? locked,
    Value<bool>? published,
    Value<DateTime?>? publishDate,
    Value<String?>? imagePath,
    Value<int>? bookId,
    Value<String?>? description,
    Value<String?>? note,
  }) {
    return LessonCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      titleInEnglish: titleInEnglish ?? this.titleInEnglish,
      seqNum: seqNum ?? this.seqNum,
      locked: locked ?? this.locked,
      published: published ?? this.published,
      publishDate: publishDate ?? this.publishDate,
      imagePath: imagePath ?? this.imagePath,
      bookId: bookId ?? this.bookId,
      description: description ?? this.description,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (titleInEnglish.present) {
      map['title_in_english'] = Variable<String>(titleInEnglish.value);
    }
    if (seqNum.present) {
      map['seq_num'] = Variable<int>(seqNum.value);
    }
    if (locked.present) {
      map['locked'] = Variable<bool>(locked.value);
    }
    if (published.present) {
      map['published'] = Variable<bool>(published.value);
    }
    if (publishDate.present) {
      map['publish_date'] = Variable<DateTime>(publishDate.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (bookId.present) {
      map['book_id'] = Variable<int>(bookId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LessonCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('titleInEnglish: $titleInEnglish, ')
          ..write('seqNum: $seqNum, ')
          ..write('locked: $locked, ')
          ..write('published: $published, ')
          ..write('publishDate: $publishDate, ')
          ..write('imagePath: $imagePath, ')
          ..write('bookId: $bookId, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $NoteTable extends Note with TableInfo<$NoteTable, NoteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 1024,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createDateTimeMeta = const VerificationMeta(
    'createDateTime',
  );
  @override
  late final GeneratedColumn<DateTime> createDateTime =
      GeneratedColumn<DateTime>(
        'create_date_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _colorCodeMeta = const VerificationMeta(
    'colorCode',
  );
  @override
  late final GeneratedColumn<String> colorCode = GeneratedColumn<String>(
    'color_code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 7,
      maxTextLength: 8,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    content,
    createDateTime,
    colorCode,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note';
  @override
  VerificationContext validateIntegrity(
    Insertable<NoteData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('create_date_time')) {
      context.handle(
        _createDateTimeMeta,
        createDateTime.isAcceptableOrUnknown(
          data['create_date_time']!,
          _createDateTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createDateTimeMeta);
    }
    if (data.containsKey('color_code')) {
      context.handle(
        _colorCodeMeta,
        colorCode.isAcceptableOrUnknown(data['color_code']!, _colorCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_colorCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      createDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}create_date_time'],
      )!,
      colorCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_code'],
      )!,
    );
  }

  @override
  $NoteTable createAlias(String alias) {
    return $NoteTable(attachedDatabase, alias);
  }
}

class NoteData extends DataClass implements Insertable<NoteData> {
  final int id;
  final String title;
  final String content;
  final DateTime createDateTime;
  final String colorCode;
  const NoteData({
    required this.id,
    required this.title,
    required this.content,
    required this.createDateTime,
    required this.colorCode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['create_date_time'] = Variable<DateTime>(createDateTime);
    map['color_code'] = Variable<String>(colorCode);
    return map;
  }

  NoteCompanion toCompanion(bool nullToAbsent) {
    return NoteCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      createDateTime: Value(createDateTime),
      colorCode: Value(colorCode),
    );
  }

  factory NoteData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      createDateTime: serializer.fromJson<DateTime>(json['createDateTime']),
      colorCode: serializer.fromJson<String>(json['colorCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'createDateTime': serializer.toJson<DateTime>(createDateTime),
      'colorCode': serializer.toJson<String>(colorCode),
    };
  }

  NoteData copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? createDateTime,
    String? colorCode,
  }) => NoteData(
    id: id ?? this.id,
    title: title ?? this.title,
    content: content ?? this.content,
    createDateTime: createDateTime ?? this.createDateTime,
    colorCode: colorCode ?? this.colorCode,
  );
  NoteData copyWithCompanion(NoteCompanion data) {
    return NoteData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      createDateTime: data.createDateTime.present
          ? data.createDateTime.value
          : this.createDateTime,
      colorCode: data.colorCode.present ? data.colorCode.value : this.colorCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createDateTime: $createDateTime, ')
          ..write('colorCode: $colorCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, content, createDateTime, colorCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.createDateTime == this.createDateTime &&
          other.colorCode == this.colorCode);
}

class NoteCompanion extends UpdateCompanion<NoteData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime> createDateTime;
  final Value<String> colorCode;
  const NoteCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createDateTime = const Value.absent(),
    this.colorCode = const Value.absent(),
  });
  NoteCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    required DateTime createDateTime,
    required String colorCode,
  }) : title = Value(title),
       content = Value(content),
       createDateTime = Value(createDateTime),
       colorCode = Value(colorCode);
  static Insertable<NoteData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? createDateTime,
    Expression<String>? colorCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (createDateTime != null) 'create_date_time': createDateTime,
      if (colorCode != null) 'color_code': colorCode,
    });
  }

  NoteCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? content,
    Value<DateTime>? createDateTime,
    Value<String>? colorCode,
  }) {
    return NoteCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createDateTime: createDateTime ?? this.createDateTime,
      colorCode: colorCode ?? this.colorCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createDateTime.present) {
      map['create_date_time'] = Variable<DateTime>(createDateTime.value);
    }
    if (colorCode.present) {
      map['color_code'] = Variable<String>(colorCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createDateTime: $createDateTime, ')
          ..write('colorCode: $colorCode')
          ..write(')'))
        .toString();
  }
}

class $NotificationMessageTable extends NotificationMessage
    with TableInfo<$NotificationMessageTable, NotificationMessageData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationMessageTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createDateTimeMeta = const VerificationMeta(
    'createDateTime',
  );
  @override
  late final GeneratedColumn<DateTime> createDateTime =
      GeneratedColumn<DateTime>(
        'create_date_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _readMeta = const VerificationMeta('read');
  @override
  late final GeneratedColumn<bool> read = GeneratedColumn<bool>(
    'read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("read" IN (0, 1))',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    message,
    createDateTime,
    read,
    type,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_message';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotificationMessageData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('create_date_time')) {
      context.handle(
        _createDateTimeMeta,
        createDateTime.isAcceptableOrUnknown(
          data['create_date_time']!,
          _createDateTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createDateTimeMeta);
    }
    if (data.containsKey('read')) {
      context.handle(
        _readMeta,
        read.isAcceptableOrUnknown(data['read']!, _readMeta),
      );
    } else if (isInserting) {
      context.missing(_readMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationMessageData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationMessageData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      createDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}create_date_time'],
      )!,
      read: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}read'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
    );
  }

  @override
  $NotificationMessageTable createAlias(String alias) {
    return $NotificationMessageTable(attachedDatabase, alias);
  }
}

class NotificationMessageData extends DataClass
    implements Insertable<NotificationMessageData> {
  final int id;
  final String title;
  final String message;
  final DateTime createDateTime;
  final bool read;
  final String type;
  const NotificationMessageData({
    required this.id,
    required this.title,
    required this.message,
    required this.createDateTime,
    required this.read,
    required this.type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['message'] = Variable<String>(message);
    map['create_date_time'] = Variable<DateTime>(createDateTime);
    map['read'] = Variable<bool>(read);
    map['type'] = Variable<String>(type);
    return map;
  }

  NotificationMessageCompanion toCompanion(bool nullToAbsent) {
    return NotificationMessageCompanion(
      id: Value(id),
      title: Value(title),
      message: Value(message),
      createDateTime: Value(createDateTime),
      read: Value(read),
      type: Value(type),
    );
  }

  factory NotificationMessageData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationMessageData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      message: serializer.fromJson<String>(json['message']),
      createDateTime: serializer.fromJson<DateTime>(json['createDateTime']),
      read: serializer.fromJson<bool>(json['read']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'message': serializer.toJson<String>(message),
      'createDateTime': serializer.toJson<DateTime>(createDateTime),
      'read': serializer.toJson<bool>(read),
      'type': serializer.toJson<String>(type),
    };
  }

  NotificationMessageData copyWith({
    int? id,
    String? title,
    String? message,
    DateTime? createDateTime,
    bool? read,
    String? type,
  }) => NotificationMessageData(
    id: id ?? this.id,
    title: title ?? this.title,
    message: message ?? this.message,
    createDateTime: createDateTime ?? this.createDateTime,
    read: read ?? this.read,
    type: type ?? this.type,
  );
  NotificationMessageData copyWithCompanion(NotificationMessageCompanion data) {
    return NotificationMessageData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      message: data.message.present ? data.message.value : this.message,
      createDateTime: data.createDateTime.present
          ? data.createDateTime.value
          : this.createDateTime,
      read: data.read.present ? data.read.value : this.read,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationMessageData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('createDateTime: $createDateTime, ')
          ..write('read: $read, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, message, createDateTime, read, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationMessageData &&
          other.id == this.id &&
          other.title == this.title &&
          other.message == this.message &&
          other.createDateTime == this.createDateTime &&
          other.read == this.read &&
          other.type == this.type);
}

class NotificationMessageCompanion
    extends UpdateCompanion<NotificationMessageData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> message;
  final Value<DateTime> createDateTime;
  final Value<bool> read;
  final Value<String> type;
  const NotificationMessageCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.message = const Value.absent(),
    this.createDateTime = const Value.absent(),
    this.read = const Value.absent(),
    this.type = const Value.absent(),
  });
  NotificationMessageCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String message,
    required DateTime createDateTime,
    required bool read,
    required String type,
  }) : title = Value(title),
       message = Value(message),
       createDateTime = Value(createDateTime),
       read = Value(read),
       type = Value(type);
  static Insertable<NotificationMessageData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? message,
    Expression<DateTime>? createDateTime,
    Expression<bool>? read,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (message != null) 'message': message,
      if (createDateTime != null) 'create_date_time': createDateTime,
      if (read != null) 'read': read,
      if (type != null) 'type': type,
    });
  }

  NotificationMessageCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? message,
    Value<DateTime>? createDateTime,
    Value<bool>? read,
    Value<String>? type,
  }) {
    return NotificationMessageCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      createDateTime: createDateTime ?? this.createDateTime,
      read: read ?? this.read,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (createDateTime.present) {
      map['create_date_time'] = Variable<DateTime>(createDateTime.value);
    }
    if (read.present) {
      map['read'] = Variable<bool>(read.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationMessageCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('createDateTime: $createDateTime, ')
          ..write('read: $read, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $PaymentGatewayTable extends PaymentGateway
    with TableInfo<$PaymentGatewayTable, PaymentGatewayData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentGatewayTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 8,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, active];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_gateway';
  @override
  VerificationContext validateIntegrity(
    Insertable<PaymentGatewayData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PaymentGatewayData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentGatewayData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $PaymentGatewayTable createAlias(String alias) {
    return $PaymentGatewayTable(attachedDatabase, alias);
  }
}

class PaymentGatewayData extends DataClass
    implements Insertable<PaymentGatewayData> {
  final String id;
  final String name;
  final bool active;
  const PaymentGatewayData({
    required this.id,
    required this.name,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['active'] = Variable<bool>(active);
    return map;
  }

  PaymentGatewayCompanion toCompanion(bool nullToAbsent) {
    return PaymentGatewayCompanion(
      id: Value(id),
      name: Value(name),
      active: Value(active),
    );
  }

  factory PaymentGatewayData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentGatewayData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'active': serializer.toJson<bool>(active),
    };
  }

  PaymentGatewayData copyWith({String? id, String? name, bool? active}) =>
      PaymentGatewayData(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active,
      );
  PaymentGatewayData copyWithCompanion(PaymentGatewayCompanion data) {
    return PaymentGatewayData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentGatewayData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentGatewayData &&
          other.id == this.id &&
          other.name == this.name &&
          other.active == this.active);
}

class PaymentGatewayCompanion extends UpdateCompanion<PaymentGatewayData> {
  final Value<String> id;
  final Value<String> name;
  final Value<bool> active;
  final Value<int> rowid;
  const PaymentGatewayCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentGatewayCompanion.insert({
    required String id,
    required String name,
    required bool active,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       active = Value(active);
  static Insertable<PaymentGatewayData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<bool>? active,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (active != null) 'active': active,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentGatewayCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<bool>? active,
    Value<int>? rowid,
  }) {
    return PaymentGatewayCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentGatewayCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductTable extends Product with TableInfo<$ProductTable, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES category (id)',
    ),
  );
  static const VerificationMeta _estimatedInputPriceMeta =
      const VerificationMeta('estimatedInputPrice');
  @override
  late final GeneratedColumn<double> estimatedInputPrice =
      GeneratedColumn<double>(
        'estimated_input_price',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _taxRateMeta = const VerificationMeta(
    'taxRate',
  );
  @override
  late final GeneratedColumn<double> taxRate = GeneratedColumn<double>(
    'tax_rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 4096,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    price,
    active,
    imagePath,
    categoryId,
    estimatedInputPrice,
    taxRate,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('estimated_input_price')) {
      context.handle(
        _estimatedInputPriceMeta,
        estimatedInputPrice.isAcceptableOrUnknown(
          data['estimated_input_price']!,
          _estimatedInputPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_estimatedInputPriceMeta);
    }
    if (data.containsKey('tax_rate')) {
      context.handle(
        _taxRateMeta,
        taxRate.isAcceptableOrUnknown(data['tax_rate']!, _taxRateMeta),
      );
    } else if (isInserting) {
      context.missing(_taxRateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      estimatedInputPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}estimated_input_price'],
      )!,
      taxRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tax_rate'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $ProductTable createAlias(String alias) {
    return $ProductTable(attachedDatabase, alias);
  }
}

class ProductData extends DataClass implements Insertable<ProductData> {
  final int id;
  final String name;
  final double price;
  final bool active;
  final String? imagePath;
  final int categoryId;
  final double estimatedInputPrice;
  final double taxRate;
  final String? description;
  const ProductData({
    required this.id,
    required this.name,
    required this.price,
    required this.active,
    this.imagePath,
    required this.categoryId,
    required this.estimatedInputPrice,
    required this.taxRate,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    map['active'] = Variable<bool>(active);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['category_id'] = Variable<int>(categoryId);
    map['estimated_input_price'] = Variable<double>(estimatedInputPrice);
    map['tax_rate'] = Variable<double>(taxRate);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  ProductCompanion toCompanion(bool nullToAbsent) {
    return ProductCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      active: Value(active),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      categoryId: Value(categoryId),
      estimatedInputPrice: Value(estimatedInputPrice),
      taxRate: Value(taxRate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory ProductData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      active: serializer.fromJson<bool>(json['active']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      estimatedInputPrice: serializer.fromJson<double>(
        json['estimatedInputPrice'],
      ),
      taxRate: serializer.fromJson<double>(json['taxRate']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'active': serializer.toJson<bool>(active),
      'imagePath': serializer.toJson<String?>(imagePath),
      'categoryId': serializer.toJson<int>(categoryId),
      'estimatedInputPrice': serializer.toJson<double>(estimatedInputPrice),
      'taxRate': serializer.toJson<double>(taxRate),
      'description': serializer.toJson<String?>(description),
    };
  }

  ProductData copyWith({
    int? id,
    String? name,
    double? price,
    bool? active,
    Value<String?> imagePath = const Value.absent(),
    int? categoryId,
    double? estimatedInputPrice,
    double? taxRate,
    Value<String?> description = const Value.absent(),
  }) => ProductData(
    id: id ?? this.id,
    name: name ?? this.name,
    price: price ?? this.price,
    active: active ?? this.active,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    categoryId: categoryId ?? this.categoryId,
    estimatedInputPrice: estimatedInputPrice ?? this.estimatedInputPrice,
    taxRate: taxRate ?? this.taxRate,
    description: description.present ? description.value : this.description,
  );
  ProductData copyWithCompanion(ProductCompanion data) {
    return ProductData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      active: data.active.present ? data.active.value : this.active,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      estimatedInputPrice: data.estimatedInputPrice.present
          ? data.estimatedInputPrice.value
          : this.estimatedInputPrice,
      taxRate: data.taxRate.present ? data.taxRate.value : this.taxRate,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('active: $active, ')
          ..write('imagePath: $imagePath, ')
          ..write('categoryId: $categoryId, ')
          ..write('estimatedInputPrice: $estimatedInputPrice, ')
          ..write('taxRate: $taxRate, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    price,
    active,
    imagePath,
    categoryId,
    estimatedInputPrice,
    taxRate,
    description,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.active == this.active &&
          other.imagePath == this.imagePath &&
          other.categoryId == this.categoryId &&
          other.estimatedInputPrice == this.estimatedInputPrice &&
          other.taxRate == this.taxRate &&
          other.description == this.description);
}

class ProductCompanion extends UpdateCompanion<ProductData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> price;
  final Value<bool> active;
  final Value<String?> imagePath;
  final Value<int> categoryId;
  final Value<double> estimatedInputPrice;
  final Value<double> taxRate;
  final Value<String?> description;
  const ProductCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.active = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.estimatedInputPrice = const Value.absent(),
    this.taxRate = const Value.absent(),
    this.description = const Value.absent(),
  });
  ProductCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double price,
    required bool active,
    this.imagePath = const Value.absent(),
    required int categoryId,
    required double estimatedInputPrice,
    required double taxRate,
    this.description = const Value.absent(),
  }) : name = Value(name),
       price = Value(price),
       active = Value(active),
       categoryId = Value(categoryId),
       estimatedInputPrice = Value(estimatedInputPrice),
       taxRate = Value(taxRate);
  static Insertable<ProductData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? price,
    Expression<bool>? active,
    Expression<String>? imagePath,
    Expression<int>? categoryId,
    Expression<double>? estimatedInputPrice,
    Expression<double>? taxRate,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (active != null) 'active': active,
      if (imagePath != null) 'image_path': imagePath,
      if (categoryId != null) 'category_id': categoryId,
      if (estimatedInputPrice != null)
        'estimated_input_price': estimatedInputPrice,
      if (taxRate != null) 'tax_rate': taxRate,
      if (description != null) 'description': description,
    });
  }

  ProductCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? price,
    Value<bool>? active,
    Value<String?>? imagePath,
    Value<int>? categoryId,
    Value<double>? estimatedInputPrice,
    Value<double>? taxRate,
    Value<String?>? description,
  }) {
    return ProductCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      active: active ?? this.active,
      imagePath: imagePath ?? this.imagePath,
      categoryId: categoryId ?? this.categoryId,
      estimatedInputPrice: estimatedInputPrice ?? this.estimatedInputPrice,
      taxRate: taxRate ?? this.taxRate,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (estimatedInputPrice.present) {
      map['estimated_input_price'] = Variable<double>(
        estimatedInputPrice.value,
      );
    }
    if (taxRate.present) {
      map['tax_rate'] = Variable<double>(taxRate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('active: $active, ')
          ..write('imagePath: $imagePath, ')
          ..write('categoryId: $categoryId, ')
          ..write('estimatedInputPrice: $estimatedInputPrice, ')
          ..write('taxRate: $taxRate, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $SalesOrderTable extends SalesOrder
    with TableInfo<$SalesOrderTable, SalesOrderData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesOrderTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _orderDateTimeMeta = const VerificationMeta(
    'orderDateTime',
  );
  @override
  late final GeneratedColumn<DateTime> orderDateTime =
      GeneratedColumn<DateTime>(
        'order_date_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taxAmountMeta = const VerificationMeta(
    'taxAmount',
  );
  @override
  late final GeneratedColumn<double> taxAmount = GeneratedColumn<double>(
    'tax_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sellerIdMeta = const VerificationMeta(
    'sellerId',
  );
  @override
  late final GeneratedColumn<int> sellerId = GeneratedColumn<int>(
    'seller_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES employee (id)',
    ),
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES customer (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    orderDateTime,
    amount,
    taxAmount,
    status,
    sellerId,
    customerId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales_order';
  @override
  VerificationContext validateIntegrity(
    Insertable<SalesOrderData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_date_time')) {
      context.handle(
        _orderDateTimeMeta,
        orderDateTime.isAcceptableOrUnknown(
          data['order_date_time']!,
          _orderDateTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_orderDateTimeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('tax_amount')) {
      context.handle(
        _taxAmountMeta,
        taxAmount.isAcceptableOrUnknown(data['tax_amount']!, _taxAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_taxAmountMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('seller_id')) {
      context.handle(
        _sellerIdMeta,
        sellerId.isAcceptableOrUnknown(data['seller_id']!, _sellerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sellerIdMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesOrderData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesOrderData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      orderDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}order_date_time'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      taxAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tax_amount'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      sellerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}seller_id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}customer_id'],
      )!,
    );
  }

  @override
  $SalesOrderTable createAlias(String alias) {
    return $SalesOrderTable(attachedDatabase, alias);
  }
}

class SalesOrderData extends DataClass implements Insertable<SalesOrderData> {
  final int id;
  final DateTime orderDateTime;
  final double amount;
  final double taxAmount;
  final String status;
  final int sellerId;
  final int customerId;
  const SalesOrderData({
    required this.id,
    required this.orderDateTime,
    required this.amount,
    required this.taxAmount,
    required this.status,
    required this.sellerId,
    required this.customerId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_date_time'] = Variable<DateTime>(orderDateTime);
    map['amount'] = Variable<double>(amount);
    map['tax_amount'] = Variable<double>(taxAmount);
    map['status'] = Variable<String>(status);
    map['seller_id'] = Variable<int>(sellerId);
    map['customer_id'] = Variable<int>(customerId);
    return map;
  }

  SalesOrderCompanion toCompanion(bool nullToAbsent) {
    return SalesOrderCompanion(
      id: Value(id),
      orderDateTime: Value(orderDateTime),
      amount: Value(amount),
      taxAmount: Value(taxAmount),
      status: Value(status),
      sellerId: Value(sellerId),
      customerId: Value(customerId),
    );
  }

  factory SalesOrderData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesOrderData(
      id: serializer.fromJson<int>(json['id']),
      orderDateTime: serializer.fromJson<DateTime>(json['orderDateTime']),
      amount: serializer.fromJson<double>(json['amount']),
      taxAmount: serializer.fromJson<double>(json['taxAmount']),
      status: serializer.fromJson<String>(json['status']),
      sellerId: serializer.fromJson<int>(json['sellerId']),
      customerId: serializer.fromJson<int>(json['customerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderDateTime': serializer.toJson<DateTime>(orderDateTime),
      'amount': serializer.toJson<double>(amount),
      'taxAmount': serializer.toJson<double>(taxAmount),
      'status': serializer.toJson<String>(status),
      'sellerId': serializer.toJson<int>(sellerId),
      'customerId': serializer.toJson<int>(customerId),
    };
  }

  SalesOrderData copyWith({
    int? id,
    DateTime? orderDateTime,
    double? amount,
    double? taxAmount,
    String? status,
    int? sellerId,
    int? customerId,
  }) => SalesOrderData(
    id: id ?? this.id,
    orderDateTime: orderDateTime ?? this.orderDateTime,
    amount: amount ?? this.amount,
    taxAmount: taxAmount ?? this.taxAmount,
    status: status ?? this.status,
    sellerId: sellerId ?? this.sellerId,
    customerId: customerId ?? this.customerId,
  );
  SalesOrderData copyWithCompanion(SalesOrderCompanion data) {
    return SalesOrderData(
      id: data.id.present ? data.id.value : this.id,
      orderDateTime: data.orderDateTime.present
          ? data.orderDateTime.value
          : this.orderDateTime,
      amount: data.amount.present ? data.amount.value : this.amount,
      taxAmount: data.taxAmount.present ? data.taxAmount.value : this.taxAmount,
      status: data.status.present ? data.status.value : this.status,
      sellerId: data.sellerId.present ? data.sellerId.value : this.sellerId,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesOrderData(')
          ..write('id: $id, ')
          ..write('orderDateTime: $orderDateTime, ')
          ..write('amount: $amount, ')
          ..write('taxAmount: $taxAmount, ')
          ..write('status: $status, ')
          ..write('sellerId: $sellerId, ')
          ..write('customerId: $customerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    orderDateTime,
    amount,
    taxAmount,
    status,
    sellerId,
    customerId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesOrderData &&
          other.id == this.id &&
          other.orderDateTime == this.orderDateTime &&
          other.amount == this.amount &&
          other.taxAmount == this.taxAmount &&
          other.status == this.status &&
          other.sellerId == this.sellerId &&
          other.customerId == this.customerId);
}

class SalesOrderCompanion extends UpdateCompanion<SalesOrderData> {
  final Value<int> id;
  final Value<DateTime> orderDateTime;
  final Value<double> amount;
  final Value<double> taxAmount;
  final Value<String> status;
  final Value<int> sellerId;
  final Value<int> customerId;
  const SalesOrderCompanion({
    this.id = const Value.absent(),
    this.orderDateTime = const Value.absent(),
    this.amount = const Value.absent(),
    this.taxAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.sellerId = const Value.absent(),
    this.customerId = const Value.absent(),
  });
  SalesOrderCompanion.insert({
    this.id = const Value.absent(),
    required DateTime orderDateTime,
    required double amount,
    required double taxAmount,
    required String status,
    required int sellerId,
    required int customerId,
  }) : orderDateTime = Value(orderDateTime),
       amount = Value(amount),
       taxAmount = Value(taxAmount),
       status = Value(status),
       sellerId = Value(sellerId),
       customerId = Value(customerId);
  static Insertable<SalesOrderData> custom({
    Expression<int>? id,
    Expression<DateTime>? orderDateTime,
    Expression<double>? amount,
    Expression<double>? taxAmount,
    Expression<String>? status,
    Expression<int>? sellerId,
    Expression<int>? customerId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderDateTime != null) 'order_date_time': orderDateTime,
      if (amount != null) 'amount': amount,
      if (taxAmount != null) 'tax_amount': taxAmount,
      if (status != null) 'status': status,
      if (sellerId != null) 'seller_id': sellerId,
      if (customerId != null) 'customer_id': customerId,
    });
  }

  SalesOrderCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? orderDateTime,
    Value<double>? amount,
    Value<double>? taxAmount,
    Value<String>? status,
    Value<int>? sellerId,
    Value<int>? customerId,
  }) {
    return SalesOrderCompanion(
      id: id ?? this.id,
      orderDateTime: orderDateTime ?? this.orderDateTime,
      amount: amount ?? this.amount,
      taxAmount: taxAmount ?? this.taxAmount,
      status: status ?? this.status,
      sellerId: sellerId ?? this.sellerId,
      customerId: customerId ?? this.customerId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderDateTime.present) {
      map['order_date_time'] = Variable<DateTime>(orderDateTime.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (taxAmount.present) {
      map['tax_amount'] = Variable<double>(taxAmount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (sellerId.present) {
      map['seller_id'] = Variable<int>(sellerId.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesOrderCompanion(')
          ..write('id: $id, ')
          ..write('orderDateTime: $orderDateTime, ')
          ..write('amount: $amount, ')
          ..write('taxAmount: $taxAmount, ')
          ..write('status: $status, ')
          ..write('sellerId: $sellerId, ')
          ..write('customerId: $customerId')
          ..write(')'))
        .toString();
  }
}

class $SalesOrderLineTable extends SalesOrderLine
    with TableInfo<$SalesOrderLineTable, SalesOrderLineData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesOrderLineTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _salesOrderIdMeta = const VerificationMeta(
    'salesOrderId',
  );
  @override
  late final GeneratedColumn<int> salesOrderId = GeneratedColumn<int>(
    'sales_order_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sales_order (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES product (id)',
    ),
  );
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedColumn<double> units = GeneratedColumn<double>(
    'units',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taxAmountMeta = const VerificationMeta(
    'taxAmount',
  );
  @override
  late final GeneratedColumn<double> taxAmount = GeneratedColumn<double>(
    'tax_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    salesOrderId,
    productId,
    units,
    amount,
    taxAmount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales_order_line';
  @override
  VerificationContext validateIntegrity(
    Insertable<SalesOrderLineData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sales_order_id')) {
      context.handle(
        _salesOrderIdMeta,
        salesOrderId.isAcceptableOrUnknown(
          data['sales_order_id']!,
          _salesOrderIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_salesOrderIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('units')) {
      context.handle(
        _unitsMeta,
        units.isAcceptableOrUnknown(data['units']!, _unitsMeta),
      );
    } else if (isInserting) {
      context.missing(_unitsMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('tax_amount')) {
      context.handle(
        _taxAmountMeta,
        taxAmount.isAcceptableOrUnknown(data['tax_amount']!, _taxAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_taxAmountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesOrderLineData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesOrderLineData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      salesOrderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sales_order_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      units: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}units'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      taxAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tax_amount'],
      )!,
    );
  }

  @override
  $SalesOrderLineTable createAlias(String alias) {
    return $SalesOrderLineTable(attachedDatabase, alias);
  }
}

class SalesOrderLineData extends DataClass
    implements Insertable<SalesOrderLineData> {
  final int id;
  final int salesOrderId;
  final int productId;
  final double units;
  final double amount;
  final double taxAmount;
  const SalesOrderLineData({
    required this.id,
    required this.salesOrderId,
    required this.productId,
    required this.units,
    required this.amount,
    required this.taxAmount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sales_order_id'] = Variable<int>(salesOrderId);
    map['product_id'] = Variable<int>(productId);
    map['units'] = Variable<double>(units);
    map['amount'] = Variable<double>(amount);
    map['tax_amount'] = Variable<double>(taxAmount);
    return map;
  }

  SalesOrderLineCompanion toCompanion(bool nullToAbsent) {
    return SalesOrderLineCompanion(
      id: Value(id),
      salesOrderId: Value(salesOrderId),
      productId: Value(productId),
      units: Value(units),
      amount: Value(amount),
      taxAmount: Value(taxAmount),
    );
  }

  factory SalesOrderLineData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesOrderLineData(
      id: serializer.fromJson<int>(json['id']),
      salesOrderId: serializer.fromJson<int>(json['salesOrderId']),
      productId: serializer.fromJson<int>(json['productId']),
      units: serializer.fromJson<double>(json['units']),
      amount: serializer.fromJson<double>(json['amount']),
      taxAmount: serializer.fromJson<double>(json['taxAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'salesOrderId': serializer.toJson<int>(salesOrderId),
      'productId': serializer.toJson<int>(productId),
      'units': serializer.toJson<double>(units),
      'amount': serializer.toJson<double>(amount),
      'taxAmount': serializer.toJson<double>(taxAmount),
    };
  }

  SalesOrderLineData copyWith({
    int? id,
    int? salesOrderId,
    int? productId,
    double? units,
    double? amount,
    double? taxAmount,
  }) => SalesOrderLineData(
    id: id ?? this.id,
    salesOrderId: salesOrderId ?? this.salesOrderId,
    productId: productId ?? this.productId,
    units: units ?? this.units,
    amount: amount ?? this.amount,
    taxAmount: taxAmount ?? this.taxAmount,
  );
  SalesOrderLineData copyWithCompanion(SalesOrderLineCompanion data) {
    return SalesOrderLineData(
      id: data.id.present ? data.id.value : this.id,
      salesOrderId: data.salesOrderId.present
          ? data.salesOrderId.value
          : this.salesOrderId,
      productId: data.productId.present ? data.productId.value : this.productId,
      units: data.units.present ? data.units.value : this.units,
      amount: data.amount.present ? data.amount.value : this.amount,
      taxAmount: data.taxAmount.present ? data.taxAmount.value : this.taxAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesOrderLineData(')
          ..write('id: $id, ')
          ..write('salesOrderId: $salesOrderId, ')
          ..write('productId: $productId, ')
          ..write('units: $units, ')
          ..write('amount: $amount, ')
          ..write('taxAmount: $taxAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, salesOrderId, productId, units, amount, taxAmount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesOrderLineData &&
          other.id == this.id &&
          other.salesOrderId == this.salesOrderId &&
          other.productId == this.productId &&
          other.units == this.units &&
          other.amount == this.amount &&
          other.taxAmount == this.taxAmount);
}

class SalesOrderLineCompanion extends UpdateCompanion<SalesOrderLineData> {
  final Value<int> id;
  final Value<int> salesOrderId;
  final Value<int> productId;
  final Value<double> units;
  final Value<double> amount;
  final Value<double> taxAmount;
  const SalesOrderLineCompanion({
    this.id = const Value.absent(),
    this.salesOrderId = const Value.absent(),
    this.productId = const Value.absent(),
    this.units = const Value.absent(),
    this.amount = const Value.absent(),
    this.taxAmount = const Value.absent(),
  });
  SalesOrderLineCompanion.insert({
    this.id = const Value.absent(),
    required int salesOrderId,
    required int productId,
    required double units,
    required double amount,
    required double taxAmount,
  }) : salesOrderId = Value(salesOrderId),
       productId = Value(productId),
       units = Value(units),
       amount = Value(amount),
       taxAmount = Value(taxAmount);
  static Insertable<SalesOrderLineData> custom({
    Expression<int>? id,
    Expression<int>? salesOrderId,
    Expression<int>? productId,
    Expression<double>? units,
    Expression<double>? amount,
    Expression<double>? taxAmount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (salesOrderId != null) 'sales_order_id': salesOrderId,
      if (productId != null) 'product_id': productId,
      if (units != null) 'units': units,
      if (amount != null) 'amount': amount,
      if (taxAmount != null) 'tax_amount': taxAmount,
    });
  }

  SalesOrderLineCompanion copyWith({
    Value<int>? id,
    Value<int>? salesOrderId,
    Value<int>? productId,
    Value<double>? units,
    Value<double>? amount,
    Value<double>? taxAmount,
  }) {
    return SalesOrderLineCompanion(
      id: id ?? this.id,
      salesOrderId: salesOrderId ?? this.salesOrderId,
      productId: productId ?? this.productId,
      units: units ?? this.units,
      amount: amount ?? this.amount,
      taxAmount: taxAmount ?? this.taxAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (salesOrderId.present) {
      map['sales_order_id'] = Variable<int>(salesOrderId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (units.present) {
      map['units'] = Variable<double>(units.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (taxAmount.present) {
      map['tax_amount'] = Variable<double>(taxAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesOrderLineCompanion(')
          ..write('id: $id, ')
          ..write('salesOrderId: $salesOrderId, ')
          ..write('productId: $productId, ')
          ..write('units: $units, ')
          ..write('amount: $amount, ')
          ..write('taxAmount: $taxAmount')
          ..write(')'))
        .toString();
  }
}

class $SongTable extends Song with TableInfo<$SongTable, SongData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SongTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lockedMeta = const VerificationMeta('locked');
  @override
  late final GeneratedColumn<bool> locked = GeneratedColumn<bool>(
    'locked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("locked" IN (0, 1))',
    ),
  );
  static const VerificationMeta _publishedMeta = const VerificationMeta(
    'published',
  );
  @override
  late final GeneratedColumn<bool> published = GeneratedColumn<bool>(
    'published',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("published" IN (0, 1))',
    ),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _youtubeCodeMeta = const VerificationMeta(
    'youtubeCode',
  );
  @override
  late final GeneratedColumn<String> youtubeCode = GeneratedColumn<String>(
    'youtube_code',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _youtubeVideoInfoMeta = const VerificationMeta(
    'youtubeVideoInfo',
  );
  @override
  late final GeneratedColumn<String> youtubeVideoInfo = GeneratedColumn<String>(
    'youtube_video_info',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 1024,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _albumIdMeta = const VerificationMeta(
    'albumId',
  );
  @override
  late final GeneratedColumn<int> albumId = GeneratedColumn<int>(
    'album_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES album (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    locked,
    published,
    imagePath,
    description,
    note,
    youtubeCode,
    youtubeVideoInfo,
    albumId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'song';
  @override
  VerificationContext validateIntegrity(
    Insertable<SongData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('locked')) {
      context.handle(
        _lockedMeta,
        locked.isAcceptableOrUnknown(data['locked']!, _lockedMeta),
      );
    } else if (isInserting) {
      context.missing(_lockedMeta);
    }
    if (data.containsKey('published')) {
      context.handle(
        _publishedMeta,
        published.isAcceptableOrUnknown(data['published']!, _publishedMeta),
      );
    } else if (isInserting) {
      context.missing(_publishedMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('youtube_code')) {
      context.handle(
        _youtubeCodeMeta,
        youtubeCode.isAcceptableOrUnknown(
          data['youtube_code']!,
          _youtubeCodeMeta,
        ),
      );
    }
    if (data.containsKey('youtube_video_info')) {
      context.handle(
        _youtubeVideoInfoMeta,
        youtubeVideoInfo.isAcceptableOrUnknown(
          data['youtube_video_info']!,
          _youtubeVideoInfoMeta,
        ),
      );
    }
    if (data.containsKey('album_id')) {
      context.handle(
        _albumIdMeta,
        albumId.isAcceptableOrUnknown(data['album_id']!, _albumIdMeta),
      );
    } else if (isInserting) {
      context.missing(_albumIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SongData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SongData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      locked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}locked'],
      )!,
      published: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}published'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      youtubeCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}youtube_code'],
      ),
      youtubeVideoInfo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}youtube_video_info'],
      ),
      albumId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}album_id'],
      )!,
    );
  }

  @override
  $SongTable createAlias(String alias) {
    return $SongTable(attachedDatabase, alias);
  }
}

class SongData extends DataClass implements Insertable<SongData> {
  final int id;
  final String name;
  final bool locked;
  final bool published;
  final String? imagePath;
  final String? description;
  final String? note;
  final String? youtubeCode;
  final String? youtubeVideoInfo;
  final int albumId;
  const SongData({
    required this.id,
    required this.name,
    required this.locked,
    required this.published,
    this.imagePath,
    this.description,
    this.note,
    this.youtubeCode,
    this.youtubeVideoInfo,
    required this.albumId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['locked'] = Variable<bool>(locked);
    map['published'] = Variable<bool>(published);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || youtubeCode != null) {
      map['youtube_code'] = Variable<String>(youtubeCode);
    }
    if (!nullToAbsent || youtubeVideoInfo != null) {
      map['youtube_video_info'] = Variable<String>(youtubeVideoInfo);
    }
    map['album_id'] = Variable<int>(albumId);
    return map;
  }

  SongCompanion toCompanion(bool nullToAbsent) {
    return SongCompanion(
      id: Value(id),
      name: Value(name),
      locked: Value(locked),
      published: Value(published),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      youtubeCode: youtubeCode == null && nullToAbsent
          ? const Value.absent()
          : Value(youtubeCode),
      youtubeVideoInfo: youtubeVideoInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(youtubeVideoInfo),
      albumId: Value(albumId),
    );
  }

  factory SongData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SongData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      locked: serializer.fromJson<bool>(json['locked']),
      published: serializer.fromJson<bool>(json['published']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      description: serializer.fromJson<String?>(json['description']),
      note: serializer.fromJson<String?>(json['note']),
      youtubeCode: serializer.fromJson<String?>(json['youtubeCode']),
      youtubeVideoInfo: serializer.fromJson<String?>(json['youtubeVideoInfo']),
      albumId: serializer.fromJson<int>(json['albumId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'locked': serializer.toJson<bool>(locked),
      'published': serializer.toJson<bool>(published),
      'imagePath': serializer.toJson<String?>(imagePath),
      'description': serializer.toJson<String?>(description),
      'note': serializer.toJson<String?>(note),
      'youtubeCode': serializer.toJson<String?>(youtubeCode),
      'youtubeVideoInfo': serializer.toJson<String?>(youtubeVideoInfo),
      'albumId': serializer.toJson<int>(albumId),
    };
  }

  SongData copyWith({
    int? id,
    String? name,
    bool? locked,
    bool? published,
    Value<String?> imagePath = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<String?> youtubeCode = const Value.absent(),
    Value<String?> youtubeVideoInfo = const Value.absent(),
    int? albumId,
  }) => SongData(
    id: id ?? this.id,
    name: name ?? this.name,
    locked: locked ?? this.locked,
    published: published ?? this.published,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    description: description.present ? description.value : this.description,
    note: note.present ? note.value : this.note,
    youtubeCode: youtubeCode.present ? youtubeCode.value : this.youtubeCode,
    youtubeVideoInfo: youtubeVideoInfo.present
        ? youtubeVideoInfo.value
        : this.youtubeVideoInfo,
    albumId: albumId ?? this.albumId,
  );
  SongData copyWithCompanion(SongCompanion data) {
    return SongData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      locked: data.locked.present ? data.locked.value : this.locked,
      published: data.published.present ? data.published.value : this.published,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      description: data.description.present
          ? data.description.value
          : this.description,
      note: data.note.present ? data.note.value : this.note,
      youtubeCode: data.youtubeCode.present
          ? data.youtubeCode.value
          : this.youtubeCode,
      youtubeVideoInfo: data.youtubeVideoInfo.present
          ? data.youtubeVideoInfo.value
          : this.youtubeVideoInfo,
      albumId: data.albumId.present ? data.albumId.value : this.albumId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SongData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('locked: $locked, ')
          ..write('published: $published, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description, ')
          ..write('note: $note, ')
          ..write('youtubeCode: $youtubeCode, ')
          ..write('youtubeVideoInfo: $youtubeVideoInfo, ')
          ..write('albumId: $albumId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    locked,
    published,
    imagePath,
    description,
    note,
    youtubeCode,
    youtubeVideoInfo,
    albumId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SongData &&
          other.id == this.id &&
          other.name == this.name &&
          other.locked == this.locked &&
          other.published == this.published &&
          other.imagePath == this.imagePath &&
          other.description == this.description &&
          other.note == this.note &&
          other.youtubeCode == this.youtubeCode &&
          other.youtubeVideoInfo == this.youtubeVideoInfo &&
          other.albumId == this.albumId);
}

class SongCompanion extends UpdateCompanion<SongData> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> locked;
  final Value<bool> published;
  final Value<String?> imagePath;
  final Value<String?> description;
  final Value<String?> note;
  final Value<String?> youtubeCode;
  final Value<String?> youtubeVideoInfo;
  final Value<int> albumId;
  const SongCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.locked = const Value.absent(),
    this.published = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
    this.youtubeCode = const Value.absent(),
    this.youtubeVideoInfo = const Value.absent(),
    this.albumId = const Value.absent(),
  });
  SongCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required bool locked,
    required bool published,
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
    this.youtubeCode = const Value.absent(),
    this.youtubeVideoInfo = const Value.absent(),
    required int albumId,
  }) : name = Value(name),
       locked = Value(locked),
       published = Value(published),
       albumId = Value(albumId);
  static Insertable<SongData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? locked,
    Expression<bool>? published,
    Expression<String>? imagePath,
    Expression<String>? description,
    Expression<String>? note,
    Expression<String>? youtubeCode,
    Expression<String>? youtubeVideoInfo,
    Expression<int>? albumId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (locked != null) 'locked': locked,
      if (published != null) 'published': published,
      if (imagePath != null) 'image_path': imagePath,
      if (description != null) 'description': description,
      if (note != null) 'note': note,
      if (youtubeCode != null) 'youtube_code': youtubeCode,
      if (youtubeVideoInfo != null) 'youtube_video_info': youtubeVideoInfo,
      if (albumId != null) 'album_id': albumId,
    });
  }

  SongCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<bool>? locked,
    Value<bool>? published,
    Value<String?>? imagePath,
    Value<String?>? description,
    Value<String?>? note,
    Value<String?>? youtubeCode,
    Value<String?>? youtubeVideoInfo,
    Value<int>? albumId,
  }) {
    return SongCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      locked: locked ?? this.locked,
      published: published ?? this.published,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      note: note ?? this.note,
      youtubeCode: youtubeCode ?? this.youtubeCode,
      youtubeVideoInfo: youtubeVideoInfo ?? this.youtubeVideoInfo,
      albumId: albumId ?? this.albumId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (locked.present) {
      map['locked'] = Variable<bool>(locked.value);
    }
    if (published.present) {
      map['published'] = Variable<bool>(published.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (youtubeCode.present) {
      map['youtube_code'] = Variable<String>(youtubeCode.value);
    }
    if (youtubeVideoInfo.present) {
      map['youtube_video_info'] = Variable<String>(youtubeVideoInfo.value);
    }
    if (albumId.present) {
      map['album_id'] = Variable<int>(albumId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('locked: $locked, ')
          ..write('published: $published, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description, ')
          ..write('note: $note, ')
          ..write('youtubeCode: $youtubeCode, ')
          ..write('youtubeVideoInfo: $youtubeVideoInfo, ')
          ..write('albumId: $albumId')
          ..write(')'))
        .toString();
  }
}

class $SupplierTypeTable extends SupplierType
    with TableInfo<$SupplierTypeTable, SupplierTypeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplierTypeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, code, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplier_type';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplierTypeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplierTypeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierTypeData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $SupplierTypeTable createAlias(String alias) {
    return $SupplierTypeTable(attachedDatabase, alias);
  }
}

class SupplierTypeData extends DataClass
    implements Insertable<SupplierTypeData> {
  final int id;
  final String code;
  final String name;
  const SupplierTypeData({
    required this.id,
    required this.code,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    return map;
  }

  SupplierTypeCompanion toCompanion(bool nullToAbsent) {
    return SupplierTypeCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
    );
  }

  factory SupplierTypeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierTypeData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
    };
  }

  SupplierTypeData copyWith({int? id, String? code, String? name}) =>
      SupplierTypeData(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
      );
  SupplierTypeData copyWithCompanion(SupplierTypeCompanion data) {
    return SupplierTypeData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierTypeData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierTypeData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name);
}

class SupplierTypeCompanion extends UpdateCompanion<SupplierTypeData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  const SupplierTypeCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
  });
  SupplierTypeCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
  }) : code = Value(code),
       name = Value(name);
  static Insertable<SupplierTypeData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
    });
  }

  SupplierTypeCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
  }) {
    return SupplierTypeCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplierTypeCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SupplierTable extends Supplier
    with TableInfo<$SupplierTable, SupplierData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplierTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 1024,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _supplierTypeIdMeta = const VerificationMeta(
    'supplierTypeId',
  );
  @override
  late final GeneratedColumn<int> supplierTypeId = GeneratedColumn<int>(
    'supplier_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES supplier_type (id)',
    ),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    active,
    email,
    address,
    phone,
    description,
    supplierTypeId,
    imagePath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplier';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplierData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('supplier_type_id')) {
      context.handle(
        _supplierTypeIdMeta,
        supplierTypeId.isAcceptableOrUnknown(
          data['supplier_type_id']!,
          _supplierTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_supplierTypeIdMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplierData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      supplierTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supplier_type_id'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
    );
  }

  @override
  $SupplierTable createAlias(String alias) {
    return $SupplierTable(attachedDatabase, alias);
  }
}

class SupplierData extends DataClass implements Insertable<SupplierData> {
  final int id;
  final String name;
  final bool active;
  final String email;
  final String? address;
  final String? phone;
  final String? description;
  final int supplierTypeId;
  final String? imagePath;
  const SupplierData({
    required this.id,
    required this.name,
    required this.active,
    required this.email,
    this.address,
    this.phone,
    this.description,
    required this.supplierTypeId,
    this.imagePath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['active'] = Variable<bool>(active);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['supplier_type_id'] = Variable<int>(supplierTypeId);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    return map;
  }

  SupplierCompanion toCompanion(bool nullToAbsent) {
    return SupplierCompanion(
      id: Value(id),
      name: Value(name),
      active: Value(active),
      email: Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      supplierTypeId: Value(supplierTypeId),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
    );
  }

  factory SupplierData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      active: serializer.fromJson<bool>(json['active']),
      email: serializer.fromJson<String>(json['email']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
      description: serializer.fromJson<String?>(json['description']),
      supplierTypeId: serializer.fromJson<int>(json['supplierTypeId']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'active': serializer.toJson<bool>(active),
      'email': serializer.toJson<String>(email),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
      'description': serializer.toJson<String?>(description),
      'supplierTypeId': serializer.toJson<int>(supplierTypeId),
      'imagePath': serializer.toJson<String?>(imagePath),
    };
  }

  SupplierData copyWith({
    int? id,
    String? name,
    bool? active,
    String? email,
    Value<String?> address = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> description = const Value.absent(),
    int? supplierTypeId,
    Value<String?> imagePath = const Value.absent(),
  }) => SupplierData(
    id: id ?? this.id,
    name: name ?? this.name,
    active: active ?? this.active,
    email: email ?? this.email,
    address: address.present ? address.value : this.address,
    phone: phone.present ? phone.value : this.phone,
    description: description.present ? description.value : this.description,
    supplierTypeId: supplierTypeId ?? this.supplierTypeId,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
  );
  SupplierData copyWithCompanion(SupplierCompanion data) {
    return SupplierData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      active: data.active.present ? data.active.value : this.active,
      email: data.email.present ? data.email.value : this.email,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
      description: data.description.present
          ? data.description.value
          : this.description,
      supplierTypeId: data.supplierTypeId.present
          ? data.supplierTypeId.value
          : this.supplierTypeId,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('description: $description, ')
          ..write('supplierTypeId: $supplierTypeId, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    active,
    email,
    address,
    phone,
    description,
    supplierTypeId,
    imagePath,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierData &&
          other.id == this.id &&
          other.name == this.name &&
          other.active == this.active &&
          other.email == this.email &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.description == this.description &&
          other.supplierTypeId == this.supplierTypeId &&
          other.imagePath == this.imagePath);
}

class SupplierCompanion extends UpdateCompanion<SupplierData> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> active;
  final Value<String> email;
  final Value<String?> address;
  final Value<String?> phone;
  final Value<String?> description;
  final Value<int> supplierTypeId;
  final Value<String?> imagePath;
  const SupplierCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.active = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.description = const Value.absent(),
    this.supplierTypeId = const Value.absent(),
    this.imagePath = const Value.absent(),
  });
  SupplierCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required bool active,
    required String email,
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.description = const Value.absent(),
    required int supplierTypeId,
    this.imagePath = const Value.absent(),
  }) : name = Value(name),
       active = Value(active),
       email = Value(email),
       supplierTypeId = Value(supplierTypeId);
  static Insertable<SupplierData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? active,
    Expression<String>? email,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<String>? description,
    Expression<int>? supplierTypeId,
    Expression<String>? imagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (active != null) 'active': active,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (description != null) 'description': description,
      if (supplierTypeId != null) 'supplier_type_id': supplierTypeId,
      if (imagePath != null) 'image_path': imagePath,
    });
  }

  SupplierCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<bool>? active,
    Value<String>? email,
    Value<String?>? address,
    Value<String?>? phone,
    Value<String?>? description,
    Value<int>? supplierTypeId,
    Value<String?>? imagePath,
  }) {
    return SupplierCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      description: description ?? this.description,
      supplierTypeId: supplierTypeId ?? this.supplierTypeId,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (supplierTypeId.present) {
      map['supplier_type_id'] = Variable<int>(supplierTypeId.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplierCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('description: $description, ')
          ..write('supplierTypeId: $supplierTypeId, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }
}

class $SystemLogTable extends SystemLog
    with TableInfo<$SystemLogTable, SystemLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SystemLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createDateTimeMeta = const VerificationMeta(
    'createDateTime',
  );
  @override
  late final GeneratedColumn<DateTime> createDateTime =
      GeneratedColumn<DateTime>(
        'create_date_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _severityMeta = const VerificationMeta(
    'severity',
  );
  @override
  late final GeneratedColumn<String> severity = GeneratedColumn<String>(
    'severity',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, createDateTime, severity, content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'system_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<SystemLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('create_date_time')) {
      context.handle(
        _createDateTimeMeta,
        createDateTime.isAcceptableOrUnknown(
          data['create_date_time']!,
          _createDateTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createDateTimeMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(
        _severityMeta,
        severity.isAcceptableOrUnknown(data['severity']!, _severityMeta),
      );
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SystemLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SystemLogData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}create_date_time'],
      )!,
      severity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}severity'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
    );
  }

  @override
  $SystemLogTable createAlias(String alias) {
    return $SystemLogTable(attachedDatabase, alias);
  }
}

class SystemLogData extends DataClass implements Insertable<SystemLogData> {
  final int id;
  final DateTime createDateTime;
  final String severity;
  final String content;
  const SystemLogData({
    required this.id,
    required this.createDateTime,
    required this.severity,
    required this.content,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['create_date_time'] = Variable<DateTime>(createDateTime);
    map['severity'] = Variable<String>(severity);
    map['content'] = Variable<String>(content);
    return map;
  }

  SystemLogCompanion toCompanion(bool nullToAbsent) {
    return SystemLogCompanion(
      id: Value(id),
      createDateTime: Value(createDateTime),
      severity: Value(severity),
      content: Value(content),
    );
  }

  factory SystemLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SystemLogData(
      id: serializer.fromJson<int>(json['id']),
      createDateTime: serializer.fromJson<DateTime>(json['createDateTime']),
      severity: serializer.fromJson<String>(json['severity']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createDateTime': serializer.toJson<DateTime>(createDateTime),
      'severity': serializer.toJson<String>(severity),
      'content': serializer.toJson<String>(content),
    };
  }

  SystemLogData copyWith({
    int? id,
    DateTime? createDateTime,
    String? severity,
    String? content,
  }) => SystemLogData(
    id: id ?? this.id,
    createDateTime: createDateTime ?? this.createDateTime,
    severity: severity ?? this.severity,
    content: content ?? this.content,
  );
  SystemLogData copyWithCompanion(SystemLogCompanion data) {
    return SystemLogData(
      id: data.id.present ? data.id.value : this.id,
      createDateTime: data.createDateTime.present
          ? data.createDateTime.value
          : this.createDateTime,
      severity: data.severity.present ? data.severity.value : this.severity,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SystemLogData(')
          ..write('id: $id, ')
          ..write('createDateTime: $createDateTime, ')
          ..write('severity: $severity, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createDateTime, severity, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SystemLogData &&
          other.id == this.id &&
          other.createDateTime == this.createDateTime &&
          other.severity == this.severity &&
          other.content == this.content);
}

class SystemLogCompanion extends UpdateCompanion<SystemLogData> {
  final Value<int> id;
  final Value<DateTime> createDateTime;
  final Value<String> severity;
  final Value<String> content;
  const SystemLogCompanion({
    this.id = const Value.absent(),
    this.createDateTime = const Value.absent(),
    this.severity = const Value.absent(),
    this.content = const Value.absent(),
  });
  SystemLogCompanion.insert({
    this.id = const Value.absent(),
    required DateTime createDateTime,
    required String severity,
    required String content,
  }) : createDateTime = Value(createDateTime),
       severity = Value(severity),
       content = Value(content);
  static Insertable<SystemLogData> custom({
    Expression<int>? id,
    Expression<DateTime>? createDateTime,
    Expression<String>? severity,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createDateTime != null) 'create_date_time': createDateTime,
      if (severity != null) 'severity': severity,
      if (content != null) 'content': content,
    });
  }

  SystemLogCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createDateTime,
    Value<String>? severity,
    Value<String>? content,
  }) {
    return SystemLogCompanion(
      id: id ?? this.id,
      createDateTime: createDateTime ?? this.createDateTime,
      severity: severity ?? this.severity,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createDateTime.present) {
      map['create_date_time'] = Variable<DateTime>(createDateTime.value);
    }
    if (severity.present) {
      map['severity'] = Variable<String>(severity.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SystemLogCompanion(')
          ..write('id: $id, ')
          ..write('createDateTime: $createDateTime, ')
          ..write('severity: $severity, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $TeacherPositionTable extends TeacherPosition
    with TableInfo<$TeacherPositionTable, TeacherPositionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeacherPositionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 16,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teacher_position';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeacherPositionData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TeacherPositionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeacherPositionData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $TeacherPositionTable createAlias(String alias) {
    return $TeacherPositionTable(attachedDatabase, alias);
  }
}

class TeacherPositionData extends DataClass
    implements Insertable<TeacherPositionData> {
  final String id;
  final String name;
  const TeacherPositionData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TeacherPositionCompanion toCompanion(bool nullToAbsent) {
    return TeacherPositionCompanion(id: Value(id), name: Value(name));
  }

  factory TeacherPositionData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeacherPositionData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TeacherPositionData copyWith({String? id, String? name}) =>
      TeacherPositionData(id: id ?? this.id, name: name ?? this.name);
  TeacherPositionData copyWithCompanion(TeacherPositionCompanion data) {
    return TeacherPositionData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeacherPositionData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeacherPositionData &&
          other.id == this.id &&
          other.name == this.name);
}

class TeacherPositionCompanion extends UpdateCompanion<TeacherPositionData> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const TeacherPositionCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TeacherPositionCompanion.insert({
    required String id,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<TeacherPositionData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TeacherPositionCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return TeacherPositionCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeacherPositionCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UniversityTable extends University
    with TableInfo<$UniversityTable, UniversityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UniversityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameInEnglishMeta = const VerificationMeta(
    'nameInEnglish',
  );
  @override
  late final GeneratedColumn<String> nameInEnglish = GeneratedColumn<String>(
    'name_in_english',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
  );
  static const VerificationMeta _lockedMeta = const VerificationMeta('locked');
  @override
  late final GeneratedColumn<bool> locked = GeneratedColumn<bool>(
    'locked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("locked" IN (0, 1))',
    ),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 1024,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    nameInEnglish,
    active,
    locked,
    imagePath,
    description,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'university';
  @override
  VerificationContext validateIntegrity(
    Insertable<UniversityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('name_in_english')) {
      context.handle(
        _nameInEnglishMeta,
        nameInEnglish.isAcceptableOrUnknown(
          data['name_in_english']!,
          _nameInEnglishMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nameInEnglishMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('locked')) {
      context.handle(
        _lockedMeta,
        locked.isAcceptableOrUnknown(data['locked']!, _lockedMeta),
      );
    } else if (isInserting) {
      context.missing(_lockedMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UniversityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UniversityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      nameInEnglish: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_in_english'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      locked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}locked'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $UniversityTable createAlias(String alias) {
    return $UniversityTable(attachedDatabase, alias);
  }
}

class UniversityData extends DataClass implements Insertable<UniversityData> {
  final int id;
  final String code;
  final String name;
  final String nameInEnglish;
  final bool active;
  final bool locked;
  final String? imagePath;
  final String? description;
  final String? note;
  const UniversityData({
    required this.id,
    required this.code,
    required this.name,
    required this.nameInEnglish,
    required this.active,
    required this.locked,
    this.imagePath,
    this.description,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['name_in_english'] = Variable<String>(nameInEnglish);
    map['active'] = Variable<bool>(active);
    map['locked'] = Variable<bool>(locked);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  UniversityCompanion toCompanion(bool nullToAbsent) {
    return UniversityCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      nameInEnglish: Value(nameInEnglish),
      active: Value(active),
      locked: Value(locked),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory UniversityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UniversityData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      nameInEnglish: serializer.fromJson<String>(json['nameInEnglish']),
      active: serializer.fromJson<bool>(json['active']),
      locked: serializer.fromJson<bool>(json['locked']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      description: serializer.fromJson<String?>(json['description']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'nameInEnglish': serializer.toJson<String>(nameInEnglish),
      'active': serializer.toJson<bool>(active),
      'locked': serializer.toJson<bool>(locked),
      'imagePath': serializer.toJson<String?>(imagePath),
      'description': serializer.toJson<String?>(description),
      'note': serializer.toJson<String?>(note),
    };
  }

  UniversityData copyWith({
    int? id,
    String? code,
    String? name,
    String? nameInEnglish,
    bool? active,
    bool? locked,
    Value<String?> imagePath = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => UniversityData(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    nameInEnglish: nameInEnglish ?? this.nameInEnglish,
    active: active ?? this.active,
    locked: locked ?? this.locked,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    description: description.present ? description.value : this.description,
    note: note.present ? note.value : this.note,
  );
  UniversityData copyWithCompanion(UniversityCompanion data) {
    return UniversityData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      nameInEnglish: data.nameInEnglish.present
          ? data.nameInEnglish.value
          : this.nameInEnglish,
      active: data.active.present ? data.active.value : this.active,
      locked: data.locked.present ? data.locked.value : this.locked,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      description: data.description.present
          ? data.description.value
          : this.description,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UniversityData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('nameInEnglish: $nameInEnglish, ')
          ..write('active: $active, ')
          ..write('locked: $locked, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    name,
    nameInEnglish,
    active,
    locked,
    imagePath,
    description,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UniversityData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.nameInEnglish == this.nameInEnglish &&
          other.active == this.active &&
          other.locked == this.locked &&
          other.imagePath == this.imagePath &&
          other.description == this.description &&
          other.note == this.note);
}

class UniversityCompanion extends UpdateCompanion<UniversityData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> nameInEnglish;
  final Value<bool> active;
  final Value<bool> locked;
  final Value<String?> imagePath;
  final Value<String?> description;
  final Value<String?> note;
  const UniversityCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.nameInEnglish = const Value.absent(),
    this.active = const Value.absent(),
    this.locked = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
  });
  UniversityCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required String nameInEnglish,
    required bool active,
    required bool locked,
    this.imagePath = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
  }) : code = Value(code),
       name = Value(name),
       nameInEnglish = Value(nameInEnglish),
       active = Value(active),
       locked = Value(locked);
  static Insertable<UniversityData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? nameInEnglish,
    Expression<bool>? active,
    Expression<bool>? locked,
    Expression<String>? imagePath,
    Expression<String>? description,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (nameInEnglish != null) 'name_in_english': nameInEnglish,
      if (active != null) 'active': active,
      if (locked != null) 'locked': locked,
      if (imagePath != null) 'image_path': imagePath,
      if (description != null) 'description': description,
      if (note != null) 'note': note,
    });
  }

  UniversityCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String>? nameInEnglish,
    Value<bool>? active,
    Value<bool>? locked,
    Value<String?>? imagePath,
    Value<String?>? description,
    Value<String?>? note,
  }) {
    return UniversityCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      nameInEnglish: nameInEnglish ?? this.nameInEnglish,
      active: active ?? this.active,
      locked: locked ?? this.locked,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nameInEnglish.present) {
      map['name_in_english'] = Variable<String>(nameInEnglish.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (locked.present) {
      map['locked'] = Variable<bool>(locked.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UniversityCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('nameInEnglish: $nameInEnglish, ')
          ..write('active: $active, ')
          ..write('locked: $locked, ')
          ..write('imagePath: $imagePath, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $TeacherTable extends Teacher with TableInfo<$TeacherTable, TeacherData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeacherTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _birthdayMeta = const VerificationMeta(
    'birthday',
  );
  @override
  late final GeneratedColumn<DateTime> birthday = GeneratedColumn<DateTime>(
    'birthday',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genderIdMeta = const VerificationMeta(
    'genderId',
  );
  @override
  late final GeneratedColumn<String> genderId = GeneratedColumn<String>(
    'gender_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES gender (id)',
    ),
  );
  static const VerificationMeta _teacherPositionIdMeta = const VerificationMeta(
    'teacherPositionId',
  );
  @override
  late final GeneratedColumn<String> teacherPositionId =
      GeneratedColumn<String>(
        'teacher_position_id',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1,
          maxTextLength: 16,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES teacher_position (id)',
        ),
      );
  static const VerificationMeta _lockedMeta = const VerificationMeta('locked');
  @override
  late final GeneratedColumn<bool> locked = GeneratedColumn<bool>(
    'locked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("locked" IN (0, 1))',
    ),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
  );
  static const VerificationMeta _universityIdMeta = const VerificationMeta(
    'universityId',
  );
  @override
  late final GeneratedColumn<int> universityId = GeneratedColumn<int>(
    'university_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES university (id)',
    ),
  );
  static const VerificationMeta _countryIdMeta = const VerificationMeta(
    'countryId',
  );
  @override
  late final GeneratedColumn<String> countryId = GeneratedColumn<String>(
    'country_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES country (id)',
    ),
  );
  static const VerificationMeta _youtubeVideoCodeMeta = const VerificationMeta(
    'youtubeVideoCode',
  );
  @override
  late final GeneratedColumn<String> youtubeVideoCode = GeneratedColumn<String>(
    'youtube_video_code',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _skypeMeta = const VerificationMeta('skype');
  @override
  late final GeneratedColumn<String> skype = GeneratedColumn<String>(
    'skype',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _facebookMeta = const VerificationMeta(
    'facebook',
  );
  @override
  late final GeneratedColumn<String> facebook = GeneratedColumn<String>(
    'facebook',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fullName,
    birthday,
    genderId,
    teacherPositionId,
    locked,
    active,
    universityId,
    countryId,
    youtubeVideoCode,
    email,
    skype,
    facebook,
    phoneNumber,
    description,
    note,
    imagePath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teacher';
  @override
  VerificationContext validateIntegrity(
    Insertable<TeacherData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('birthday')) {
      context.handle(
        _birthdayMeta,
        birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta),
      );
    } else if (isInserting) {
      context.missing(_birthdayMeta);
    }
    if (data.containsKey('gender_id')) {
      context.handle(
        _genderIdMeta,
        genderId.isAcceptableOrUnknown(data['gender_id']!, _genderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_genderIdMeta);
    }
    if (data.containsKey('teacher_position_id')) {
      context.handle(
        _teacherPositionIdMeta,
        teacherPositionId.isAcceptableOrUnknown(
          data['teacher_position_id']!,
          _teacherPositionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_teacherPositionIdMeta);
    }
    if (data.containsKey('locked')) {
      context.handle(
        _lockedMeta,
        locked.isAcceptableOrUnknown(data['locked']!, _lockedMeta),
      );
    } else if (isInserting) {
      context.missing(_lockedMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('university_id')) {
      context.handle(
        _universityIdMeta,
        universityId.isAcceptableOrUnknown(
          data['university_id']!,
          _universityIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_universityIdMeta);
    }
    if (data.containsKey('country_id')) {
      context.handle(
        _countryIdMeta,
        countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta),
      );
    }
    if (data.containsKey('youtube_video_code')) {
      context.handle(
        _youtubeVideoCodeMeta,
        youtubeVideoCode.isAcceptableOrUnknown(
          data['youtube_video_code']!,
          _youtubeVideoCodeMeta,
        ),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('skype')) {
      context.handle(
        _skypeMeta,
        skype.isAcceptableOrUnknown(data['skype']!, _skypeMeta),
      );
    }
    if (data.containsKey('facebook')) {
      context.handle(
        _facebookMeta,
        facebook.isAcceptableOrUnknown(data['facebook']!, _facebookMeta),
      );
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TeacherData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TeacherData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      birthday: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birthday'],
      )!,
      genderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender_id'],
      )!,
      teacherPositionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}teacher_position_id'],
      )!,
      locked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}locked'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      universityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}university_id'],
      )!,
      countryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_id'],
      ),
      youtubeVideoCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}youtube_video_code'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      skype: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}skype'],
      ),
      facebook: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}facebook'],
      ),
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
    );
  }

  @override
  $TeacherTable createAlias(String alias) {
    return $TeacherTable(attachedDatabase, alias);
  }
}

class TeacherData extends DataClass implements Insertable<TeacherData> {
  final int id;
  final String fullName;
  final DateTime birthday;
  final String genderId;
  final String teacherPositionId;
  final bool locked;
  final bool active;
  final int universityId;
  final String? countryId;
  final String? youtubeVideoCode;
  final String email;
  final String? skype;
  final String? facebook;
  final String? phoneNumber;
  final String? description;
  final String? note;
  final String? imagePath;
  const TeacherData({
    required this.id,
    required this.fullName,
    required this.birthday,
    required this.genderId,
    required this.teacherPositionId,
    required this.locked,
    required this.active,
    required this.universityId,
    this.countryId,
    this.youtubeVideoCode,
    required this.email,
    this.skype,
    this.facebook,
    this.phoneNumber,
    this.description,
    this.note,
    this.imagePath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['birthday'] = Variable<DateTime>(birthday);
    map['gender_id'] = Variable<String>(genderId);
    map['teacher_position_id'] = Variable<String>(teacherPositionId);
    map['locked'] = Variable<bool>(locked);
    map['active'] = Variable<bool>(active);
    map['university_id'] = Variable<int>(universityId);
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<String>(countryId);
    }
    if (!nullToAbsent || youtubeVideoCode != null) {
      map['youtube_video_code'] = Variable<String>(youtubeVideoCode);
    }
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || skype != null) {
      map['skype'] = Variable<String>(skype);
    }
    if (!nullToAbsent || facebook != null) {
      map['facebook'] = Variable<String>(facebook);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    return map;
  }

  TeacherCompanion toCompanion(bool nullToAbsent) {
    return TeacherCompanion(
      id: Value(id),
      fullName: Value(fullName),
      birthday: Value(birthday),
      genderId: Value(genderId),
      teacherPositionId: Value(teacherPositionId),
      locked: Value(locked),
      active: Value(active),
      universityId: Value(universityId),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      youtubeVideoCode: youtubeVideoCode == null && nullToAbsent
          ? const Value.absent()
          : Value(youtubeVideoCode),
      email: Value(email),
      skype: skype == null && nullToAbsent
          ? const Value.absent()
          : Value(skype),
      facebook: facebook == null && nullToAbsent
          ? const Value.absent()
          : Value(facebook),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
    );
  }

  factory TeacherData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TeacherData(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      birthday: serializer.fromJson<DateTime>(json['birthday']),
      genderId: serializer.fromJson<String>(json['genderId']),
      teacherPositionId: serializer.fromJson<String>(json['teacherPositionId']),
      locked: serializer.fromJson<bool>(json['locked']),
      active: serializer.fromJson<bool>(json['active']),
      universityId: serializer.fromJson<int>(json['universityId']),
      countryId: serializer.fromJson<String?>(json['countryId']),
      youtubeVideoCode: serializer.fromJson<String?>(json['youtubeVideoCode']),
      email: serializer.fromJson<String>(json['email']),
      skype: serializer.fromJson<String?>(json['skype']),
      facebook: serializer.fromJson<String?>(json['facebook']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      description: serializer.fromJson<String?>(json['description']),
      note: serializer.fromJson<String?>(json['note']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'birthday': serializer.toJson<DateTime>(birthday),
      'genderId': serializer.toJson<String>(genderId),
      'teacherPositionId': serializer.toJson<String>(teacherPositionId),
      'locked': serializer.toJson<bool>(locked),
      'active': serializer.toJson<bool>(active),
      'universityId': serializer.toJson<int>(universityId),
      'countryId': serializer.toJson<String?>(countryId),
      'youtubeVideoCode': serializer.toJson<String?>(youtubeVideoCode),
      'email': serializer.toJson<String>(email),
      'skype': serializer.toJson<String?>(skype),
      'facebook': serializer.toJson<String?>(facebook),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'description': serializer.toJson<String?>(description),
      'note': serializer.toJson<String?>(note),
      'imagePath': serializer.toJson<String?>(imagePath),
    };
  }

  TeacherData copyWith({
    int? id,
    String? fullName,
    DateTime? birthday,
    String? genderId,
    String? teacherPositionId,
    bool? locked,
    bool? active,
    int? universityId,
    Value<String?> countryId = const Value.absent(),
    Value<String?> youtubeVideoCode = const Value.absent(),
    String? email,
    Value<String?> skype = const Value.absent(),
    Value<String?> facebook = const Value.absent(),
    Value<String?> phoneNumber = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
  }) => TeacherData(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    birthday: birthday ?? this.birthday,
    genderId: genderId ?? this.genderId,
    teacherPositionId: teacherPositionId ?? this.teacherPositionId,
    locked: locked ?? this.locked,
    active: active ?? this.active,
    universityId: universityId ?? this.universityId,
    countryId: countryId.present ? countryId.value : this.countryId,
    youtubeVideoCode: youtubeVideoCode.present
        ? youtubeVideoCode.value
        : this.youtubeVideoCode,
    email: email ?? this.email,
    skype: skype.present ? skype.value : this.skype,
    facebook: facebook.present ? facebook.value : this.facebook,
    phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
    description: description.present ? description.value : this.description,
    note: note.present ? note.value : this.note,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
  );
  TeacherData copyWithCompanion(TeacherCompanion data) {
    return TeacherData(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      birthday: data.birthday.present ? data.birthday.value : this.birthday,
      genderId: data.genderId.present ? data.genderId.value : this.genderId,
      teacherPositionId: data.teacherPositionId.present
          ? data.teacherPositionId.value
          : this.teacherPositionId,
      locked: data.locked.present ? data.locked.value : this.locked,
      active: data.active.present ? data.active.value : this.active,
      universityId: data.universityId.present
          ? data.universityId.value
          : this.universityId,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
      youtubeVideoCode: data.youtubeVideoCode.present
          ? data.youtubeVideoCode.value
          : this.youtubeVideoCode,
      email: data.email.present ? data.email.value : this.email,
      skype: data.skype.present ? data.skype.value : this.skype,
      facebook: data.facebook.present ? data.facebook.value : this.facebook,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      description: data.description.present
          ? data.description.value
          : this.description,
      note: data.note.present ? data.note.value : this.note,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TeacherData(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('birthday: $birthday, ')
          ..write('genderId: $genderId, ')
          ..write('teacherPositionId: $teacherPositionId, ')
          ..write('locked: $locked, ')
          ..write('active: $active, ')
          ..write('universityId: $universityId, ')
          ..write('countryId: $countryId, ')
          ..write('youtubeVideoCode: $youtubeVideoCode, ')
          ..write('email: $email, ')
          ..write('skype: $skype, ')
          ..write('facebook: $facebook, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('description: $description, ')
          ..write('note: $note, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fullName,
    birthday,
    genderId,
    teacherPositionId,
    locked,
    active,
    universityId,
    countryId,
    youtubeVideoCode,
    email,
    skype,
    facebook,
    phoneNumber,
    description,
    note,
    imagePath,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeacherData &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.birthday == this.birthday &&
          other.genderId == this.genderId &&
          other.teacherPositionId == this.teacherPositionId &&
          other.locked == this.locked &&
          other.active == this.active &&
          other.universityId == this.universityId &&
          other.countryId == this.countryId &&
          other.youtubeVideoCode == this.youtubeVideoCode &&
          other.email == this.email &&
          other.skype == this.skype &&
          other.facebook == this.facebook &&
          other.phoneNumber == this.phoneNumber &&
          other.description == this.description &&
          other.note == this.note &&
          other.imagePath == this.imagePath);
}

class TeacherCompanion extends UpdateCompanion<TeacherData> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<DateTime> birthday;
  final Value<String> genderId;
  final Value<String> teacherPositionId;
  final Value<bool> locked;
  final Value<bool> active;
  final Value<int> universityId;
  final Value<String?> countryId;
  final Value<String?> youtubeVideoCode;
  final Value<String> email;
  final Value<String?> skype;
  final Value<String?> facebook;
  final Value<String?> phoneNumber;
  final Value<String?> description;
  final Value<String?> note;
  final Value<String?> imagePath;
  const TeacherCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.birthday = const Value.absent(),
    this.genderId = const Value.absent(),
    this.teacherPositionId = const Value.absent(),
    this.locked = const Value.absent(),
    this.active = const Value.absent(),
    this.universityId = const Value.absent(),
    this.countryId = const Value.absent(),
    this.youtubeVideoCode = const Value.absent(),
    this.email = const Value.absent(),
    this.skype = const Value.absent(),
    this.facebook = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
    this.imagePath = const Value.absent(),
  });
  TeacherCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required DateTime birthday,
    required String genderId,
    required String teacherPositionId,
    required bool locked,
    required bool active,
    required int universityId,
    this.countryId = const Value.absent(),
    this.youtubeVideoCode = const Value.absent(),
    required String email,
    this.skype = const Value.absent(),
    this.facebook = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
    this.imagePath = const Value.absent(),
  }) : fullName = Value(fullName),
       birthday = Value(birthday),
       genderId = Value(genderId),
       teacherPositionId = Value(teacherPositionId),
       locked = Value(locked),
       active = Value(active),
       universityId = Value(universityId),
       email = Value(email);
  static Insertable<TeacherData> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<DateTime>? birthday,
    Expression<String>? genderId,
    Expression<String>? teacherPositionId,
    Expression<bool>? locked,
    Expression<bool>? active,
    Expression<int>? universityId,
    Expression<String>? countryId,
    Expression<String>? youtubeVideoCode,
    Expression<String>? email,
    Expression<String>? skype,
    Expression<String>? facebook,
    Expression<String>? phoneNumber,
    Expression<String>? description,
    Expression<String>? note,
    Expression<String>? imagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (birthday != null) 'birthday': birthday,
      if (genderId != null) 'gender_id': genderId,
      if (teacherPositionId != null) 'teacher_position_id': teacherPositionId,
      if (locked != null) 'locked': locked,
      if (active != null) 'active': active,
      if (universityId != null) 'university_id': universityId,
      if (countryId != null) 'country_id': countryId,
      if (youtubeVideoCode != null) 'youtube_video_code': youtubeVideoCode,
      if (email != null) 'email': email,
      if (skype != null) 'skype': skype,
      if (facebook != null) 'facebook': facebook,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (description != null) 'description': description,
      if (note != null) 'note': note,
      if (imagePath != null) 'image_path': imagePath,
    });
  }

  TeacherCompanion copyWith({
    Value<int>? id,
    Value<String>? fullName,
    Value<DateTime>? birthday,
    Value<String>? genderId,
    Value<String>? teacherPositionId,
    Value<bool>? locked,
    Value<bool>? active,
    Value<int>? universityId,
    Value<String?>? countryId,
    Value<String?>? youtubeVideoCode,
    Value<String>? email,
    Value<String?>? skype,
    Value<String?>? facebook,
    Value<String?>? phoneNumber,
    Value<String?>? description,
    Value<String?>? note,
    Value<String?>? imagePath,
  }) {
    return TeacherCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      birthday: birthday ?? this.birthday,
      genderId: genderId ?? this.genderId,
      teacherPositionId: teacherPositionId ?? this.teacherPositionId,
      locked: locked ?? this.locked,
      active: active ?? this.active,
      universityId: universityId ?? this.universityId,
      countryId: countryId ?? this.countryId,
      youtubeVideoCode: youtubeVideoCode ?? this.youtubeVideoCode,
      email: email ?? this.email,
      skype: skype ?? this.skype,
      facebook: facebook ?? this.facebook,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      description: description ?? this.description,
      note: note ?? this.note,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<DateTime>(birthday.value);
    }
    if (genderId.present) {
      map['gender_id'] = Variable<String>(genderId.value);
    }
    if (teacherPositionId.present) {
      map['teacher_position_id'] = Variable<String>(teacherPositionId.value);
    }
    if (locked.present) {
      map['locked'] = Variable<bool>(locked.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (universityId.present) {
      map['university_id'] = Variable<int>(universityId.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<String>(countryId.value);
    }
    if (youtubeVideoCode.present) {
      map['youtube_video_code'] = Variable<String>(youtubeVideoCode.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (skype.present) {
      map['skype'] = Variable<String>(skype.value);
    }
    if (facebook.present) {
      map['facebook'] = Variable<String>(facebook.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeacherCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('birthday: $birthday, ')
          ..write('genderId: $genderId, ')
          ..write('teacherPositionId: $teacherPositionId, ')
          ..write('locked: $locked, ')
          ..write('active: $active, ')
          ..write('universityId: $universityId, ')
          ..write('countryId: $countryId, ')
          ..write('youtubeVideoCode: $youtubeVideoCode, ')
          ..write('email: $email, ')
          ..write('skype: $skype, ')
          ..write('facebook: $facebook, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('description: $description, ')
          ..write('note: $note, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }
}

class $ProjectTable extends Project with TableInfo<$ProjectTable, ProjectData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 256,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, code, name, description, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $ProjectTable createAlias(String alias) {
    return $ProjectTable(attachedDatabase, alias);
  }
}

class ProjectData extends DataClass implements Insertable<ProjectData> {
  final int id;
  final String code;
  final String name;
  final String? description;
  final String? note;
  const ProjectData({
    required this.id,
    required this.code,
    required this.name,
    this.description,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  ProjectCompanion toCompanion(bool nullToAbsent) {
    return ProjectCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory ProjectData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'note': serializer.toJson<String?>(note),
    };
  }

  ProjectData copyWith({
    int? id,
    String? code,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => ProjectData(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    note: note.present ? note.value : this.note,
  );
  ProjectData copyWithCompanion(ProjectCompanion data) {
    return ProjectData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name, description, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.description == this.description &&
          other.note == this.note);
}

class ProjectCompanion extends UpdateCompanion<ProjectData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> note;
  const ProjectCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
  });
  ProjectCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    this.description = const Value.absent(),
    this.note = const Value.absent(),
  }) : code = Value(code),
       name = Value(name);
  static Insertable<ProjectData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (note != null) 'note': note,
    });
  }

  ProjectCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? note,
  }) {
    return ProjectCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $ContributorTable extends Contributor
    with TableInfo<$ContributorTable, ContributorData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContributorTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<int> projectId = GeneratedColumn<int>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES project (id)',
    ),
  );
  static const VerificationMeta _appUserIdMeta = const VerificationMeta(
    'appUserId',
  );
  @override
  late final GeneratedColumn<int> appUserId = GeneratedColumn<int>(
    'app_user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_user (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, projectId, appUserId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contributor';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContributorData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('app_user_id')) {
      context.handle(
        _appUserIdMeta,
        appUserId.isAcceptableOrUnknown(data['app_user_id']!, _appUserIdMeta),
      );
    } else if (isInserting) {
      context.missing(_appUserIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContributorData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContributorData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}project_id'],
      )!,
      appUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}app_user_id'],
      )!,
    );
  }

  @override
  $ContributorTable createAlias(String alias) {
    return $ContributorTable(attachedDatabase, alias);
  }
}

class ContributorData extends DataClass implements Insertable<ContributorData> {
  final int id;
  final int projectId;
  final int appUserId;
  const ContributorData({
    required this.id,
    required this.projectId,
    required this.appUserId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['project_id'] = Variable<int>(projectId);
    map['app_user_id'] = Variable<int>(appUserId);
    return map;
  }

  ContributorCompanion toCompanion(bool nullToAbsent) {
    return ContributorCompanion(
      id: Value(id),
      projectId: Value(projectId),
      appUserId: Value(appUserId),
    );
  }

  factory ContributorData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContributorData(
      id: serializer.fromJson<int>(json['id']),
      projectId: serializer.fromJson<int>(json['projectId']),
      appUserId: serializer.fromJson<int>(json['appUserId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'projectId': serializer.toJson<int>(projectId),
      'appUserId': serializer.toJson<int>(appUserId),
    };
  }

  ContributorData copyWith({int? id, int? projectId, int? appUserId}) =>
      ContributorData(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        appUserId: appUserId ?? this.appUserId,
      );
  ContributorData copyWithCompanion(ContributorCompanion data) {
    return ContributorData(
      id: data.id.present ? data.id.value : this.id,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      appUserId: data.appUserId.present ? data.appUserId.value : this.appUserId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContributorData(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('appUserId: $appUserId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, projectId, appUserId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContributorData &&
          other.id == this.id &&
          other.projectId == this.projectId &&
          other.appUserId == this.appUserId);
}

class ContributorCompanion extends UpdateCompanion<ContributorData> {
  final Value<int> id;
  final Value<int> projectId;
  final Value<int> appUserId;
  const ContributorCompanion({
    this.id = const Value.absent(),
    this.projectId = const Value.absent(),
    this.appUserId = const Value.absent(),
  });
  ContributorCompanion.insert({
    this.id = const Value.absent(),
    required int projectId,
    required int appUserId,
  }) : projectId = Value(projectId),
       appUserId = Value(appUserId);
  static Insertable<ContributorData> custom({
    Expression<int>? id,
    Expression<int>? projectId,
    Expression<int>? appUserId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (projectId != null) 'project_id': projectId,
      if (appUserId != null) 'app_user_id': appUserId,
    });
  }

  ContributorCompanion copyWith({
    Value<int>? id,
    Value<int>? projectId,
    Value<int>? appUserId,
  }) {
    return ContributorCompanion(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      appUserId: appUserId ?? this.appUserId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<int>(projectId.value);
    }
    if (appUserId.present) {
      map['app_user_id'] = Variable<int>(appUserId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContributorCompanion(')
          ..write('id: $id, ')
          ..write('projectId: $projectId, ')
          ..write('appUserId: $appUserId')
          ..write(')'))
        .toString();
  }
}

abstract class _$SharedDatabase extends GeneratedDatabase {
  _$SharedDatabase(QueryExecutor e) : super(e);
  $SharedDatabaseManager get managers => $SharedDatabaseManager(this);
  late final $AlbumTable album = $AlbumTable(this);
  late final $EmployeePositionTable employeePosition = $EmployeePositionTable(
    this,
  );
  late final $CompanyTable company = $CompanyTable(this);
  late final $DepartmentTable department = $DepartmentTable(this);
  late final $EmployeeTable employee = $EmployeeTable(this);
  late final $AppUserTable appUser = $AppUserTable(this);
  late final $BookTable book = $BookTable(this);
  late final $CategoryTable category = $CategoryTable(this);
  late final $CountryTable country = $CountryTable(this);
  late final $CouponTypeTable couponType = $CouponTypeTable(this);
  late final $CouponTable coupon = $CouponTable(this);
  late final $CurrencyTable currency = $CurrencyTable(this);
  late final $CustomerTable customer = $CustomerTable(this);
  late final $EmploymentHistoryTable employmentHistory =
      $EmploymentHistoryTable(this);
  late final $FootballPlayerTable footballPlayer = $FootballPlayerTable(this);
  late final $GenderTable gender = $GenderTable(this);
  late final $LanguageTable language = $LanguageTable(this);
  late final $LessonTable lesson = $LessonTable(this);
  late final $NoteTable note = $NoteTable(this);
  late final $NotificationMessageTable notificationMessage =
      $NotificationMessageTable(this);
  late final $PaymentGatewayTable paymentGateway = $PaymentGatewayTable(this);
  late final $ProductTable product = $ProductTable(this);
  late final $SalesOrderTable salesOrder = $SalesOrderTable(this);
  late final $SalesOrderLineTable salesOrderLine = $SalesOrderLineTable(this);
  late final $SongTable song = $SongTable(this);
  late final $SupplierTypeTable supplierType = $SupplierTypeTable(this);
  late final $SupplierTable supplier = $SupplierTable(this);
  late final $SystemLogTable systemLog = $SystemLogTable(this);
  late final $TeacherPositionTable teacherPosition = $TeacherPositionTable(
    this,
  );
  late final $UniversityTable university = $UniversityTable(this);
  late final $TeacherTable teacher = $TeacherTable(this);
  late final $ProjectTable project = $ProjectTable(this);
  late final $ContributorTable contributor = $ContributorTable(this);
  late final BestSellingDAO bestSellingDAO = BestSellingDAO(
    this as SharedDatabase,
  );
  late final SupplierDAO supplierDAO = SupplierDAO(this as SharedDatabase);
  late final SupplierTypeDAO supplierTypeDAO = SupplierTypeDAO(
    this as SharedDatabase,
  );
  late final AlbumDAO albumDAO = AlbumDAO(this as SharedDatabase);
  late final BookDAO bookDAO = BookDAO(this as SharedDatabase);
  late final CategoryDAO categoryDAO = CategoryDAO(this as SharedDatabase);
  late final AppUserDAO appUserDAO = AppUserDAO(this as SharedDatabase);
  late final CompanyDAO companyDAO = CompanyDAO(this as SharedDatabase);
  late final CountryDAO countryDAO = CountryDAO(this as SharedDatabase);
  late final CouponDAO couponDAO = CouponDAO(this as SharedDatabase);
  late final CouponTypeDAO couponTypeDAO = CouponTypeDAO(
    this as SharedDatabase,
  );
  late final CurrencyDAO currencyDAO = CurrencyDAO(this as SharedDatabase);
  late final CustomerDAO customerDAO = CustomerDAO(this as SharedDatabase);
  late final DepartmentDAO departmentDAO = DepartmentDAO(
    this as SharedDatabase,
  );
  late final EmployeeDAO employeeDAO = EmployeeDAO(this as SharedDatabase);
  late final EmployeePositionDAO employeePositionDAO = EmployeePositionDAO(
    this as SharedDatabase,
  );
  late final EmploymentHistoryDAO employmentHistoryDAO = EmploymentHistoryDAO(
    this as SharedDatabase,
  );
  late final FootballPlayerDAO footballPlayerDAO = FootballPlayerDAO(
    this as SharedDatabase,
  );
  late final GenderDAO genderDAO = GenderDAO(this as SharedDatabase);
  late final LanguageDAO languageDAO = LanguageDAO(this as SharedDatabase);
  late final LessonDAO lessonDAO = LessonDAO(this as SharedDatabase);
  late final NoteDAO noteDAO = NoteDAO(this as SharedDatabase);
  late final PaymentGatewayDAO paymentGatewayDAO = PaymentGatewayDAO(
    this as SharedDatabase,
  );
  late final ProductDAO productDAO = ProductDAO(this as SharedDatabase);
  late final SalesOrderDAO salesOrderDAO = SalesOrderDAO(
    this as SharedDatabase,
  );
  late final SalesOrderLineDAO salesOrderLineDAO = SalesOrderLineDAO(
    this as SharedDatabase,
  );
  late final SongDAO songDAO = SongDAO(this as SharedDatabase);
  late final SystemLogDAO systemLogDAO = SystemLogDAO(this as SharedDatabase);
  late final TeacherDAO teacherDAO = TeacherDAO(this as SharedDatabase);
  late final TeacherPositionDAO teacherPositionDAO = TeacherPositionDAO(
    this as SharedDatabase,
  );
  late final UniversityDAO universityDAO = UniversityDAO(
    this as SharedDatabase,
  );
  late final ProjectDAO projectDAO = ProjectDAO(this as SharedDatabase);
  late final ContributorDAO contributorDAO = ContributorDAO(
    this as SharedDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    album,
    employeePosition,
    company,
    department,
    employee,
    appUser,
    book,
    category,
    country,
    couponType,
    coupon,
    currency,
    customer,
    employmentHistory,
    footballPlayer,
    gender,
    language,
    lesson,
    note,
    notificationMessage,
    paymentGateway,
    product,
    salesOrder,
    salesOrderLine,
    song,
    supplierType,
    supplier,
    systemLog,
    teacherPosition,
    university,
    teacher,
    project,
    contributor,
  ];
}

typedef $$AlbumTableCreateCompanionBuilder =
    AlbumCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      required String nameInEnglish,
      required int seqNum,
      required bool published,
      required bool locked,
      Value<String?> imagePath,
      required int publishedSongCount,
      required int totalSongCount,
      Value<String?> description,
      Value<String?> note,
    });
typedef $$AlbumTableUpdateCompanionBuilder =
    AlbumCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<String> nameInEnglish,
      Value<int> seqNum,
      Value<bool> published,
      Value<bool> locked,
      Value<String?> imagePath,
      Value<int> publishedSongCount,
      Value<int> totalSongCount,
      Value<String?> description,
      Value<String?> note,
    });

final class $$AlbumTableReferences
    extends BaseReferences<_$SharedDatabase, $AlbumTable, AlbumData> {
  $$AlbumTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SongTable, List<SongData>> _songRefsTable(
    _$SharedDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.song,
    aliasName: $_aliasNameGenerator(db.album.id, db.song.albumId),
  );

  $$SongTableProcessedTableManager get songRefs {
    final manager = $$SongTableTableManager(
      $_db,
      $_db.song,
    ).filter((f) => f.albumId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_songRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AlbumTableFilterComposer
    extends Composer<_$SharedDatabase, $AlbumTable> {
  $$AlbumTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameInEnglish => $composableBuilder(
    column: $table.nameInEnglish,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seqNum => $composableBuilder(
    column: $table.seqNum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get published => $composableBuilder(
    column: $table.published,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get publishedSongCount => $composableBuilder(
    column: $table.publishedSongCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSongCount => $composableBuilder(
    column: $table.totalSongCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> songRefs(
    Expression<bool> Function($$SongTableFilterComposer f) f,
  ) {
    final $$SongTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.song,
      getReferencedColumn: (t) => t.albumId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongTableFilterComposer(
            $db: $db,
            $table: $db.song,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AlbumTableOrderingComposer
    extends Composer<_$SharedDatabase, $AlbumTable> {
  $$AlbumTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameInEnglish => $composableBuilder(
    column: $table.nameInEnglish,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seqNum => $composableBuilder(
    column: $table.seqNum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get published => $composableBuilder(
    column: $table.published,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get publishedSongCount => $composableBuilder(
    column: $table.publishedSongCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSongCount => $composableBuilder(
    column: $table.totalSongCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AlbumTableAnnotationComposer
    extends Composer<_$SharedDatabase, $AlbumTable> {
  $$AlbumTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameInEnglish => $composableBuilder(
    column: $table.nameInEnglish,
    builder: (column) => column,
  );

  GeneratedColumn<int> get seqNum =>
      $composableBuilder(column: $table.seqNum, builder: (column) => column);

  GeneratedColumn<bool> get published =>
      $composableBuilder(column: $table.published, builder: (column) => column);

  GeneratedColumn<bool> get locked =>
      $composableBuilder(column: $table.locked, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<int> get publishedSongCount => $composableBuilder(
    column: $table.publishedSongCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalSongCount => $composableBuilder(
    column: $table.totalSongCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  Expression<T> songRefs<T extends Object>(
    Expression<T> Function($$SongTableAnnotationComposer a) f,
  ) {
    final $$SongTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.song,
      getReferencedColumn: (t) => t.albumId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongTableAnnotationComposer(
            $db: $db,
            $table: $db.song,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AlbumTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $AlbumTable,
          AlbumData,
          $$AlbumTableFilterComposer,
          $$AlbumTableOrderingComposer,
          $$AlbumTableAnnotationComposer,
          $$AlbumTableCreateCompanionBuilder,
          $$AlbumTableUpdateCompanionBuilder,
          (AlbumData, $$AlbumTableReferences),
          AlbumData,
          PrefetchHooks Function({bool songRefs})
        > {
  $$AlbumTableTableManager(_$SharedDatabase db, $AlbumTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlbumTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlbumTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlbumTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> nameInEnglish = const Value.absent(),
                Value<int> seqNum = const Value.absent(),
                Value<bool> published = const Value.absent(),
                Value<bool> locked = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<int> publishedSongCount = const Value.absent(),
                Value<int> totalSongCount = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => AlbumCompanion(
                id: id,
                code: code,
                name: name,
                nameInEnglish: nameInEnglish,
                seqNum: seqNum,
                published: published,
                locked: locked,
                imagePath: imagePath,
                publishedSongCount: publishedSongCount,
                totalSongCount: totalSongCount,
                description: description,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                required String nameInEnglish,
                required int seqNum,
                required bool published,
                required bool locked,
                Value<String?> imagePath = const Value.absent(),
                required int publishedSongCount,
                required int totalSongCount,
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => AlbumCompanion.insert(
                id: id,
                code: code,
                name: name,
                nameInEnglish: nameInEnglish,
                seqNum: seqNum,
                published: published,
                locked: locked,
                imagePath: imagePath,
                publishedSongCount: publishedSongCount,
                totalSongCount: totalSongCount,
                description: description,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AlbumTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({songRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (songRefs) db.song],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (songRefs)
                    await $_getPrefetchedData<AlbumData, $AlbumTable, SongData>(
                      currentTable: table,
                      referencedTable: $$AlbumTableReferences._songRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$AlbumTableReferences(db, table, p0).songRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.albumId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AlbumTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $AlbumTable,
      AlbumData,
      $$AlbumTableFilterComposer,
      $$AlbumTableOrderingComposer,
      $$AlbumTableAnnotationComposer,
      $$AlbumTableCreateCompanionBuilder,
      $$AlbumTableUpdateCompanionBuilder,
      (AlbumData, $$AlbumTableReferences),
      AlbumData,
      PrefetchHooks Function({bool songRefs})
    >;
typedef $$EmployeePositionTableCreateCompanionBuilder =
    EmployeePositionCompanion Function({
      Value<int> id,
      required String code,
      required String name,
    });
typedef $$EmployeePositionTableUpdateCompanionBuilder =
    EmployeePositionCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
    });

final class $$EmployeePositionTableReferences
    extends
        BaseReferences<
          _$SharedDatabase,
          $EmployeePositionTable,
          EmployeePositionData
        > {
  $$EmployeePositionTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$EmployeeTable, List<EmployeeData>>
  _employeeRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.employee,
    aliasName: $_aliasNameGenerator(
      db.employeePosition.id,
      db.employee.employeePositionId,
    ),
  );

  $$EmployeeTableProcessedTableManager get employeeRefs {
    final manager = $$EmployeeTableTableManager($_db, $_db.employee).filter(
      (f) => f.employeePositionId.id.sqlEquals($_itemColumn<int>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_employeeRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $EmploymentHistoryTable,
    List<EmploymentHistoryData>
  >
  _employmentHistoryRefsTable(_$SharedDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.employmentHistory,
        aliasName: $_aliasNameGenerator(
          db.employeePosition.id,
          db.employmentHistory.employeePositionId,
        ),
      );

  $$EmploymentHistoryTableProcessedTableManager get employmentHistoryRefs {
    final manager =
        $$EmploymentHistoryTableTableManager(
          $_db,
          $_db.employmentHistory,
        ).filter(
          (f) => f.employeePositionId.id.sqlEquals($_itemColumn<int>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _employmentHistoryRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EmployeePositionTableFilterComposer
    extends Composer<_$SharedDatabase, $EmployeePositionTable> {
  $$EmployeePositionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> employeeRefs(
    Expression<bool> Function($$EmployeeTableFilterComposer f) f,
  ) {
    final $$EmployeeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.employee,
      getReferencedColumn: (t) => t.employeePositionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeTableFilterComposer(
            $db: $db,
            $table: $db.employee,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> employmentHistoryRefs(
    Expression<bool> Function($$EmploymentHistoryTableFilterComposer f) f,
  ) {
    final $$EmploymentHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.employmentHistory,
      getReferencedColumn: (t) => t.employeePositionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmploymentHistoryTableFilterComposer(
            $db: $db,
            $table: $db.employmentHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EmployeePositionTableOrderingComposer
    extends Composer<_$SharedDatabase, $EmployeePositionTable> {
  $$EmployeePositionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EmployeePositionTableAnnotationComposer
    extends Composer<_$SharedDatabase, $EmployeePositionTable> {
  $$EmployeePositionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> employeeRefs<T extends Object>(
    Expression<T> Function($$EmployeeTableAnnotationComposer a) f,
  ) {
    final $$EmployeeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.employee,
      getReferencedColumn: (t) => t.employeePositionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeTableAnnotationComposer(
            $db: $db,
            $table: $db.employee,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> employmentHistoryRefs<T extends Object>(
    Expression<T> Function($$EmploymentHistoryTableAnnotationComposer a) f,
  ) {
    final $$EmploymentHistoryTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.employmentHistory,
          getReferencedColumn: (t) => t.employeePositionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EmploymentHistoryTableAnnotationComposer(
                $db: $db,
                $table: $db.employmentHistory,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$EmployeePositionTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $EmployeePositionTable,
          EmployeePositionData,
          $$EmployeePositionTableFilterComposer,
          $$EmployeePositionTableOrderingComposer,
          $$EmployeePositionTableAnnotationComposer,
          $$EmployeePositionTableCreateCompanionBuilder,
          $$EmployeePositionTableUpdateCompanionBuilder,
          (EmployeePositionData, $$EmployeePositionTableReferences),
          EmployeePositionData,
          PrefetchHooks Function({
            bool employeeRefs,
            bool employmentHistoryRefs,
          })
        > {
  $$EmployeePositionTableTableManager(
    _$SharedDatabase db,
    $EmployeePositionTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmployeePositionTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmployeePositionTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmployeePositionTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => EmployeePositionCompanion(id: id, code: code, name: name),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
              }) => EmployeePositionCompanion.insert(
                id: id,
                code: code,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EmployeePositionTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({employeeRefs = false, employmentHistoryRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (employeeRefs) db.employee,
                    if (employmentHistoryRefs) db.employmentHistory,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (employeeRefs)
                        await $_getPrefetchedData<
                          EmployeePositionData,
                          $EmployeePositionTable,
                          EmployeeData
                        >(
                          currentTable: table,
                          referencedTable: $$EmployeePositionTableReferences
                              ._employeeRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EmployeePositionTableReferences(
                                db,
                                table,
                                p0,
                              ).employeeRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.employeePositionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (employmentHistoryRefs)
                        await $_getPrefetchedData<
                          EmployeePositionData,
                          $EmployeePositionTable,
                          EmploymentHistoryData
                        >(
                          currentTable: table,
                          referencedTable: $$EmployeePositionTableReferences
                              ._employmentHistoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EmployeePositionTableReferences(
                                db,
                                table,
                                p0,
                              ).employmentHistoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.employeePositionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EmployeePositionTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $EmployeePositionTable,
      EmployeePositionData,
      $$EmployeePositionTableFilterComposer,
      $$EmployeePositionTableOrderingComposer,
      $$EmployeePositionTableAnnotationComposer,
      $$EmployeePositionTableCreateCompanionBuilder,
      $$EmployeePositionTableUpdateCompanionBuilder,
      (EmployeePositionData, $$EmployeePositionTableReferences),
      EmployeePositionData,
      PrefetchHooks Function({bool employeeRefs, bool employmentHistoryRefs})
    >;
typedef $$CompanyTableCreateCompanionBuilder =
    CompanyCompanion Function({
      Value<int> id,
      Value<int?> companyIdParent,
      required String code,
      required String name,
      Value<String?> imagePath,
      Value<String?> description,
    });
typedef $$CompanyTableUpdateCompanionBuilder =
    CompanyCompanion Function({
      Value<int> id,
      Value<int?> companyIdParent,
      Value<String> code,
      Value<String> name,
      Value<String?> imagePath,
      Value<String?> description,
    });

final class $$CompanyTableReferences
    extends BaseReferences<_$SharedDatabase, $CompanyTable, CompanyData> {
  $$CompanyTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CompanyTable _companyIdParentTable(_$SharedDatabase db) =>
      db.company.createAlias(
        $_aliasNameGenerator(db.company.companyIdParent, db.company.id),
      );

  $$CompanyTableProcessedTableManager? get companyIdParent {
    final $_column = $_itemColumn<int>('company_id_parent');
    if ($_column == null) return null;
    final manager = $$CompanyTableTableManager(
      $_db,
      $_db.company,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_companyIdParentTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DepartmentTable, List<DepartmentData>>
  _departmentRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.department,
    aliasName: $_aliasNameGenerator(db.company.id, db.department.companyId),
  );

  $$DepartmentTableProcessedTableManager get departmentRefs {
    final manager = $$DepartmentTableTableManager(
      $_db,
      $_db.department,
    ).filter((f) => f.companyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_departmentRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $EmploymentHistoryTable,
    List<EmploymentHistoryData>
  >
  _employmentHistoryRefsTable(_$SharedDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.employmentHistory,
        aliasName: $_aliasNameGenerator(
          db.company.id,
          db.employmentHistory.companyId,
        ),
      );

  $$EmploymentHistoryTableProcessedTableManager get employmentHistoryRefs {
    final manager = $$EmploymentHistoryTableTableManager(
      $_db,
      $_db.employmentHistory,
    ).filter((f) => f.companyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _employmentHistoryRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CompanyTableFilterComposer
    extends Composer<_$SharedDatabase, $CompanyTable> {
  $$CompanyTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$CompanyTableFilterComposer get companyIdParent {
    final $$CompanyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.companyIdParent,
      referencedTable: $db.company,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompanyTableFilterComposer(
            $db: $db,
            $table: $db.company,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> departmentRefs(
    Expression<bool> Function($$DepartmentTableFilterComposer f) f,
  ) {
    final $$DepartmentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.department,
      getReferencedColumn: (t) => t.companyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepartmentTableFilterComposer(
            $db: $db,
            $table: $db.department,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> employmentHistoryRefs(
    Expression<bool> Function($$EmploymentHistoryTableFilterComposer f) f,
  ) {
    final $$EmploymentHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.employmentHistory,
      getReferencedColumn: (t) => t.companyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmploymentHistoryTableFilterComposer(
            $db: $db,
            $table: $db.employmentHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CompanyTableOrderingComposer
    extends Composer<_$SharedDatabase, $CompanyTable> {
  $$CompanyTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$CompanyTableOrderingComposer get companyIdParent {
    final $$CompanyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.companyIdParent,
      referencedTable: $db.company,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompanyTableOrderingComposer(
            $db: $db,
            $table: $db.company,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CompanyTableAnnotationComposer
    extends Composer<_$SharedDatabase, $CompanyTable> {
  $$CompanyTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$CompanyTableAnnotationComposer get companyIdParent {
    final $$CompanyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.companyIdParent,
      referencedTable: $db.company,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompanyTableAnnotationComposer(
            $db: $db,
            $table: $db.company,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> departmentRefs<T extends Object>(
    Expression<T> Function($$DepartmentTableAnnotationComposer a) f,
  ) {
    final $$DepartmentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.department,
      getReferencedColumn: (t) => t.companyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepartmentTableAnnotationComposer(
            $db: $db,
            $table: $db.department,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> employmentHistoryRefs<T extends Object>(
    Expression<T> Function($$EmploymentHistoryTableAnnotationComposer a) f,
  ) {
    final $$EmploymentHistoryTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.employmentHistory,
          getReferencedColumn: (t) => t.companyId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EmploymentHistoryTableAnnotationComposer(
                $db: $db,
                $table: $db.employmentHistory,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CompanyTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $CompanyTable,
          CompanyData,
          $$CompanyTableFilterComposer,
          $$CompanyTableOrderingComposer,
          $$CompanyTableAnnotationComposer,
          $$CompanyTableCreateCompanionBuilder,
          $$CompanyTableUpdateCompanionBuilder,
          (CompanyData, $$CompanyTableReferences),
          CompanyData,
          PrefetchHooks Function({
            bool companyIdParent,
            bool departmentRefs,
            bool employmentHistoryRefs,
          })
        > {
  $$CompanyTableTableManager(_$SharedDatabase db, $CompanyTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompanyTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompanyTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompanyTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> companyIdParent = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => CompanyCompanion(
                id: id,
                companyIdParent: companyIdParent,
                code: code,
                name: name,
                imagePath: imagePath,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> companyIdParent = const Value.absent(),
                required String code,
                required String name,
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => CompanyCompanion.insert(
                id: id,
                companyIdParent: companyIdParent,
                code: code,
                name: name,
                imagePath: imagePath,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CompanyTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                companyIdParent = false,
                departmentRefs = false,
                employmentHistoryRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (departmentRefs) db.department,
                    if (employmentHistoryRefs) db.employmentHistory,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (companyIdParent) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.companyIdParent,
                                    referencedTable: $$CompanyTableReferences
                                        ._companyIdParentTable(db),
                                    referencedColumn: $$CompanyTableReferences
                                        ._companyIdParentTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (departmentRefs)
                        await $_getPrefetchedData<
                          CompanyData,
                          $CompanyTable,
                          DepartmentData
                        >(
                          currentTable: table,
                          referencedTable: $$CompanyTableReferences
                              ._departmentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CompanyTableReferences(
                                db,
                                table,
                                p0,
                              ).departmentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.companyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (employmentHistoryRefs)
                        await $_getPrefetchedData<
                          CompanyData,
                          $CompanyTable,
                          EmploymentHistoryData
                        >(
                          currentTable: table,
                          referencedTable: $$CompanyTableReferences
                              ._employmentHistoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CompanyTableReferences(
                                db,
                                table,
                                p0,
                              ).employmentHistoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.companyId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CompanyTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $CompanyTable,
      CompanyData,
      $$CompanyTableFilterComposer,
      $$CompanyTableOrderingComposer,
      $$CompanyTableAnnotationComposer,
      $$CompanyTableCreateCompanionBuilder,
      $$CompanyTableUpdateCompanionBuilder,
      (CompanyData, $$CompanyTableReferences),
      CompanyData,
      PrefetchHooks Function({
        bool companyIdParent,
        bool departmentRefs,
        bool employmentHistoryRefs,
      })
    >;
typedef $$DepartmentTableCreateCompanionBuilder =
    DepartmentCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      required int companyId,
      Value<int?> managerId,
      Value<String?> imagePath,
      Value<String?> description,
    });
typedef $$DepartmentTableUpdateCompanionBuilder =
    DepartmentCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<int> companyId,
      Value<int?> managerId,
      Value<String?> imagePath,
      Value<String?> description,
    });

final class $$DepartmentTableReferences
    extends BaseReferences<_$SharedDatabase, $DepartmentTable, DepartmentData> {
  $$DepartmentTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CompanyTable _companyIdTable(_$SharedDatabase db) =>
      db.company.createAlias(
        $_aliasNameGenerator(db.department.companyId, db.company.id),
      );

  $$CompanyTableProcessedTableManager get companyId {
    final $_column = $_itemColumn<int>('company_id')!;

    final manager = $$CompanyTableTableManager(
      $_db,
      $_db.company,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_companyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$EmployeeTable, List<EmployeeData>>
  _employeeRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.employee,
    aliasName: $_aliasNameGenerator(db.department.id, db.employee.departmentId),
  );

  $$EmployeeTableProcessedTableManager get employeeRefs {
    final manager = $$EmployeeTableTableManager(
      $_db,
      $_db.employee,
    ).filter((f) => f.departmentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_employeeRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $EmploymentHistoryTable,
    List<EmploymentHistoryData>
  >
  _employmentHistoryRefsTable(_$SharedDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.employmentHistory,
        aliasName: $_aliasNameGenerator(
          db.department.id,
          db.employmentHistory.departmentId,
        ),
      );

  $$EmploymentHistoryTableProcessedTableManager get employmentHistoryRefs {
    final manager = $$EmploymentHistoryTableTableManager(
      $_db,
      $_db.employmentHistory,
    ).filter((f) => f.departmentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _employmentHistoryRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DepartmentTableFilterComposer
    extends Composer<_$SharedDatabase, $DepartmentTable> {
  $$DepartmentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get managerId => $composableBuilder(
    column: $table.managerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$CompanyTableFilterComposer get companyId {
    final $$CompanyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.companyId,
      referencedTable: $db.company,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompanyTableFilterComposer(
            $db: $db,
            $table: $db.company,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> employeeRefs(
    Expression<bool> Function($$EmployeeTableFilterComposer f) f,
  ) {
    final $$EmployeeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.employee,
      getReferencedColumn: (t) => t.departmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeTableFilterComposer(
            $db: $db,
            $table: $db.employee,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> employmentHistoryRefs(
    Expression<bool> Function($$EmploymentHistoryTableFilterComposer f) f,
  ) {
    final $$EmploymentHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.employmentHistory,
      getReferencedColumn: (t) => t.departmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmploymentHistoryTableFilterComposer(
            $db: $db,
            $table: $db.employmentHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DepartmentTableOrderingComposer
    extends Composer<_$SharedDatabase, $DepartmentTable> {
  $$DepartmentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get managerId => $composableBuilder(
    column: $table.managerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$CompanyTableOrderingComposer get companyId {
    final $$CompanyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.companyId,
      referencedTable: $db.company,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompanyTableOrderingComposer(
            $db: $db,
            $table: $db.company,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DepartmentTableAnnotationComposer
    extends Composer<_$SharedDatabase, $DepartmentTable> {
  $$DepartmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get managerId =>
      $composableBuilder(column: $table.managerId, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$CompanyTableAnnotationComposer get companyId {
    final $$CompanyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.companyId,
      referencedTable: $db.company,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompanyTableAnnotationComposer(
            $db: $db,
            $table: $db.company,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> employeeRefs<T extends Object>(
    Expression<T> Function($$EmployeeTableAnnotationComposer a) f,
  ) {
    final $$EmployeeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.employee,
      getReferencedColumn: (t) => t.departmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeTableAnnotationComposer(
            $db: $db,
            $table: $db.employee,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> employmentHistoryRefs<T extends Object>(
    Expression<T> Function($$EmploymentHistoryTableAnnotationComposer a) f,
  ) {
    final $$EmploymentHistoryTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.employmentHistory,
          getReferencedColumn: (t) => t.departmentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EmploymentHistoryTableAnnotationComposer(
                $db: $db,
                $table: $db.employmentHistory,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DepartmentTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $DepartmentTable,
          DepartmentData,
          $$DepartmentTableFilterComposer,
          $$DepartmentTableOrderingComposer,
          $$DepartmentTableAnnotationComposer,
          $$DepartmentTableCreateCompanionBuilder,
          $$DepartmentTableUpdateCompanionBuilder,
          (DepartmentData, $$DepartmentTableReferences),
          DepartmentData,
          PrefetchHooks Function({
            bool companyId,
            bool employeeRefs,
            bool employmentHistoryRefs,
          })
        > {
  $$DepartmentTableTableManager(_$SharedDatabase db, $DepartmentTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DepartmentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DepartmentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DepartmentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> companyId = const Value.absent(),
                Value<int?> managerId = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => DepartmentCompanion(
                id: id,
                code: code,
                name: name,
                companyId: companyId,
                managerId: managerId,
                imagePath: imagePath,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                required int companyId,
                Value<int?> managerId = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => DepartmentCompanion.insert(
                id: id,
                code: code,
                name: name,
                companyId: companyId,
                managerId: managerId,
                imagePath: imagePath,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DepartmentTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                companyId = false,
                employeeRefs = false,
                employmentHistoryRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (employeeRefs) db.employee,
                    if (employmentHistoryRefs) db.employmentHistory,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (companyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.companyId,
                                    referencedTable: $$DepartmentTableReferences
                                        ._companyIdTable(db),
                                    referencedColumn:
                                        $$DepartmentTableReferences
                                            ._companyIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (employeeRefs)
                        await $_getPrefetchedData<
                          DepartmentData,
                          $DepartmentTable,
                          EmployeeData
                        >(
                          currentTable: table,
                          referencedTable: $$DepartmentTableReferences
                              ._employeeRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DepartmentTableReferences(
                                db,
                                table,
                                p0,
                              ).employeeRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.departmentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (employmentHistoryRefs)
                        await $_getPrefetchedData<
                          DepartmentData,
                          $DepartmentTable,
                          EmploymentHistoryData
                        >(
                          currentTable: table,
                          referencedTable: $$DepartmentTableReferences
                              ._employmentHistoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DepartmentTableReferences(
                                db,
                                table,
                                p0,
                              ).employmentHistoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.departmentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DepartmentTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $DepartmentTable,
      DepartmentData,
      $$DepartmentTableFilterComposer,
      $$DepartmentTableOrderingComposer,
      $$DepartmentTableAnnotationComposer,
      $$DepartmentTableCreateCompanionBuilder,
      $$DepartmentTableUpdateCompanionBuilder,
      (DepartmentData, $$DepartmentTableReferences),
      DepartmentData,
      PrefetchHooks Function({
        bool companyId,
        bool employeeRefs,
        bool employmentHistoryRefs,
      })
    >;
typedef $$EmployeeTableCreateCompanionBuilder =
    EmployeeCompanion Function({
      Value<int> id,
      required String empNumber,
      required String name,
      required String email,
      required int employeePositionId,
      required int departmentId,
      required DateTime birthday,
      required DateTime hireDate,
      Value<String?> imagePath,
      Value<String?> address,
    });
typedef $$EmployeeTableUpdateCompanionBuilder =
    EmployeeCompanion Function({
      Value<int> id,
      Value<String> empNumber,
      Value<String> name,
      Value<String> email,
      Value<int> employeePositionId,
      Value<int> departmentId,
      Value<DateTime> birthday,
      Value<DateTime> hireDate,
      Value<String?> imagePath,
      Value<String?> address,
    });

final class $$EmployeeTableReferences
    extends BaseReferences<_$SharedDatabase, $EmployeeTable, EmployeeData> {
  $$EmployeeTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EmployeePositionTable _employeePositionIdTable(_$SharedDatabase db) =>
      db.employeePosition.createAlias(
        $_aliasNameGenerator(
          db.employee.employeePositionId,
          db.employeePosition.id,
        ),
      );

  $$EmployeePositionTableProcessedTableManager get employeePositionId {
    final $_column = $_itemColumn<int>('employee_position_id')!;

    final manager = $$EmployeePositionTableTableManager(
      $_db,
      $_db.employeePosition,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_employeePositionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DepartmentTable _departmentIdTable(_$SharedDatabase db) =>
      db.department.createAlias(
        $_aliasNameGenerator(db.employee.departmentId, db.department.id),
      );

  $$DepartmentTableProcessedTableManager get departmentId {
    final $_column = $_itemColumn<int>('department_id')!;

    final manager = $$DepartmentTableTableManager(
      $_db,
      $_db.department,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_departmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AppUserTable, List<AppUserData>>
  _appUserRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.appUser,
    aliasName: $_aliasNameGenerator(db.employee.id, db.appUser.employeeId),
  );

  $$AppUserTableProcessedTableManager get appUserRefs {
    final manager = $$AppUserTableTableManager(
      $_db,
      $_db.appUser,
    ).filter((f) => f.employeeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_appUserRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $EmploymentHistoryTable,
    List<EmploymentHistoryData>
  >
  _employmentHistoryRefsTable(_$SharedDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.employmentHistory,
        aliasName: $_aliasNameGenerator(
          db.employee.id,
          db.employmentHistory.employeeId,
        ),
      );

  $$EmploymentHistoryTableProcessedTableManager get employmentHistoryRefs {
    final manager = $$EmploymentHistoryTableTableManager(
      $_db,
      $_db.employmentHistory,
    ).filter((f) => f.employeeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _employmentHistoryRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SalesOrderTable, List<SalesOrderData>>
  _salesOrderRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.salesOrder,
    aliasName: $_aliasNameGenerator(db.employee.id, db.salesOrder.sellerId),
  );

  $$SalesOrderTableProcessedTableManager get salesOrderRefs {
    final manager = $$SalesOrderTableTableManager(
      $_db,
      $_db.salesOrder,
    ).filter((f) => f.sellerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_salesOrderRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EmployeeTableFilterComposer
    extends Composer<_$SharedDatabase, $EmployeeTable> {
  $$EmployeeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get empNumber => $composableBuilder(
    column: $table.empNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthday => $composableBuilder(
    column: $table.birthday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get hireDate => $composableBuilder(
    column: $table.hireDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  $$EmployeePositionTableFilterComposer get employeePositionId {
    final $$EmployeePositionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeePositionId,
      referencedTable: $db.employeePosition,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeePositionTableFilterComposer(
            $db: $db,
            $table: $db.employeePosition,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DepartmentTableFilterComposer get departmentId {
    final $$DepartmentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.departmentId,
      referencedTable: $db.department,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepartmentTableFilterComposer(
            $db: $db,
            $table: $db.department,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> appUserRefs(
    Expression<bool> Function($$AppUserTableFilterComposer f) f,
  ) {
    final $$AppUserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appUser,
      getReferencedColumn: (t) => t.employeeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableFilterComposer(
            $db: $db,
            $table: $db.appUser,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> employmentHistoryRefs(
    Expression<bool> Function($$EmploymentHistoryTableFilterComposer f) f,
  ) {
    final $$EmploymentHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.employmentHistory,
      getReferencedColumn: (t) => t.employeeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmploymentHistoryTableFilterComposer(
            $db: $db,
            $table: $db.employmentHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> salesOrderRefs(
    Expression<bool> Function($$SalesOrderTableFilterComposer f) f,
  ) {
    final $$SalesOrderTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesOrder,
      getReferencedColumn: (t) => t.sellerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesOrderTableFilterComposer(
            $db: $db,
            $table: $db.salesOrder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EmployeeTableOrderingComposer
    extends Composer<_$SharedDatabase, $EmployeeTable> {
  $$EmployeeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get empNumber => $composableBuilder(
    column: $table.empNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthday => $composableBuilder(
    column: $table.birthday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hireDate => $composableBuilder(
    column: $table.hireDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  $$EmployeePositionTableOrderingComposer get employeePositionId {
    final $$EmployeePositionTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeePositionId,
      referencedTable: $db.employeePosition,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeePositionTableOrderingComposer(
            $db: $db,
            $table: $db.employeePosition,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DepartmentTableOrderingComposer get departmentId {
    final $$DepartmentTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.departmentId,
      referencedTable: $db.department,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepartmentTableOrderingComposer(
            $db: $db,
            $table: $db.department,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EmployeeTableAnnotationComposer
    extends Composer<_$SharedDatabase, $EmployeeTable> {
  $$EmployeeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get empNumber =>
      $composableBuilder(column: $table.empNumber, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<DateTime> get birthday =>
      $composableBuilder(column: $table.birthday, builder: (column) => column);

  GeneratedColumn<DateTime> get hireDate =>
      $composableBuilder(column: $table.hireDate, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  $$EmployeePositionTableAnnotationComposer get employeePositionId {
    final $$EmployeePositionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeePositionId,
      referencedTable: $db.employeePosition,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeePositionTableAnnotationComposer(
            $db: $db,
            $table: $db.employeePosition,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DepartmentTableAnnotationComposer get departmentId {
    final $$DepartmentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.departmentId,
      referencedTable: $db.department,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepartmentTableAnnotationComposer(
            $db: $db,
            $table: $db.department,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> appUserRefs<T extends Object>(
    Expression<T> Function($$AppUserTableAnnotationComposer a) f,
  ) {
    final $$AppUserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appUser,
      getReferencedColumn: (t) => t.employeeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableAnnotationComposer(
            $db: $db,
            $table: $db.appUser,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> employmentHistoryRefs<T extends Object>(
    Expression<T> Function($$EmploymentHistoryTableAnnotationComposer a) f,
  ) {
    final $$EmploymentHistoryTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.employmentHistory,
          getReferencedColumn: (t) => t.employeeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EmploymentHistoryTableAnnotationComposer(
                $db: $db,
                $table: $db.employmentHistory,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> salesOrderRefs<T extends Object>(
    Expression<T> Function($$SalesOrderTableAnnotationComposer a) f,
  ) {
    final $$SalesOrderTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesOrder,
      getReferencedColumn: (t) => t.sellerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesOrderTableAnnotationComposer(
            $db: $db,
            $table: $db.salesOrder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EmployeeTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $EmployeeTable,
          EmployeeData,
          $$EmployeeTableFilterComposer,
          $$EmployeeTableOrderingComposer,
          $$EmployeeTableAnnotationComposer,
          $$EmployeeTableCreateCompanionBuilder,
          $$EmployeeTableUpdateCompanionBuilder,
          (EmployeeData, $$EmployeeTableReferences),
          EmployeeData,
          PrefetchHooks Function({
            bool employeePositionId,
            bool departmentId,
            bool appUserRefs,
            bool employmentHistoryRefs,
            bool salesOrderRefs,
          })
        > {
  $$EmployeeTableTableManager(_$SharedDatabase db, $EmployeeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmployeeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmployeeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmployeeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> empNumber = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<int> employeePositionId = const Value.absent(),
                Value<int> departmentId = const Value.absent(),
                Value<DateTime> birthday = const Value.absent(),
                Value<DateTime> hireDate = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> address = const Value.absent(),
              }) => EmployeeCompanion(
                id: id,
                empNumber: empNumber,
                name: name,
                email: email,
                employeePositionId: employeePositionId,
                departmentId: departmentId,
                birthday: birthday,
                hireDate: hireDate,
                imagePath: imagePath,
                address: address,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String empNumber,
                required String name,
                required String email,
                required int employeePositionId,
                required int departmentId,
                required DateTime birthday,
                required DateTime hireDate,
                Value<String?> imagePath = const Value.absent(),
                Value<String?> address = const Value.absent(),
              }) => EmployeeCompanion.insert(
                id: id,
                empNumber: empNumber,
                name: name,
                email: email,
                employeePositionId: employeePositionId,
                departmentId: departmentId,
                birthday: birthday,
                hireDate: hireDate,
                imagePath: imagePath,
                address: address,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EmployeeTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                employeePositionId = false,
                departmentId = false,
                appUserRefs = false,
                employmentHistoryRefs = false,
                salesOrderRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (appUserRefs) db.appUser,
                    if (employmentHistoryRefs) db.employmentHistory,
                    if (salesOrderRefs) db.salesOrder,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (employeePositionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.employeePositionId,
                                    referencedTable: $$EmployeeTableReferences
                                        ._employeePositionIdTable(db),
                                    referencedColumn: $$EmployeeTableReferences
                                        ._employeePositionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (departmentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.departmentId,
                                    referencedTable: $$EmployeeTableReferences
                                        ._departmentIdTable(db),
                                    referencedColumn: $$EmployeeTableReferences
                                        ._departmentIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (appUserRefs)
                        await $_getPrefetchedData<
                          EmployeeData,
                          $EmployeeTable,
                          AppUserData
                        >(
                          currentTable: table,
                          referencedTable: $$EmployeeTableReferences
                              ._appUserRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EmployeeTableReferences(
                                db,
                                table,
                                p0,
                              ).appUserRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.employeeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (employmentHistoryRefs)
                        await $_getPrefetchedData<
                          EmployeeData,
                          $EmployeeTable,
                          EmploymentHistoryData
                        >(
                          currentTable: table,
                          referencedTable: $$EmployeeTableReferences
                              ._employmentHistoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EmployeeTableReferences(
                                db,
                                table,
                                p0,
                              ).employmentHistoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.employeeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (salesOrderRefs)
                        await $_getPrefetchedData<
                          EmployeeData,
                          $EmployeeTable,
                          SalesOrderData
                        >(
                          currentTable: table,
                          referencedTable: $$EmployeeTableReferences
                              ._salesOrderRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EmployeeTableReferences(
                                db,
                                table,
                                p0,
                              ).salesOrderRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sellerId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EmployeeTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $EmployeeTable,
      EmployeeData,
      $$EmployeeTableFilterComposer,
      $$EmployeeTableOrderingComposer,
      $$EmployeeTableAnnotationComposer,
      $$EmployeeTableCreateCompanionBuilder,
      $$EmployeeTableUpdateCompanionBuilder,
      (EmployeeData, $$EmployeeTableReferences),
      EmployeeData,
      PrefetchHooks Function({
        bool employeePositionId,
        bool departmentId,
        bool appUserRefs,
        bool employmentHistoryRefs,
        bool salesOrderRefs,
      })
    >;
typedef $$AppUserTableCreateCompanionBuilder =
    AppUserCompanion Function({
      Value<int> id,
      required String userName,
      required String email,
      required String fullName,
      required String encryptedPassword,
      required bool enabled,
      required bool activated,
      Value<String?> accessToken,
      Value<int?> employeeId,
      Value<DateTime?> lastActiveDatetime,
      required bool isSystemUser,
      Value<String?> imagePath,
    });
typedef $$AppUserTableUpdateCompanionBuilder =
    AppUserCompanion Function({
      Value<int> id,
      Value<String> userName,
      Value<String> email,
      Value<String> fullName,
      Value<String> encryptedPassword,
      Value<bool> enabled,
      Value<bool> activated,
      Value<String?> accessToken,
      Value<int?> employeeId,
      Value<DateTime?> lastActiveDatetime,
      Value<bool> isSystemUser,
      Value<String?> imagePath,
    });

final class $$AppUserTableReferences
    extends BaseReferences<_$SharedDatabase, $AppUserTable, AppUserData> {
  $$AppUserTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EmployeeTable _employeeIdTable(_$SharedDatabase db) => db.employee
      .createAlias($_aliasNameGenerator(db.appUser.employeeId, db.employee.id));

  $$EmployeeTableProcessedTableManager? get employeeId {
    final $_column = $_itemColumn<int>('employee_id');
    if ($_column == null) return null;
    final manager = $$EmployeeTableTableManager(
      $_db,
      $_db.employee,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_employeeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ContributorTable, List<ContributorData>>
  _contributorRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.contributor,
    aliasName: $_aliasNameGenerator(db.appUser.id, db.contributor.appUserId),
  );

  $$ContributorTableProcessedTableManager get contributorRefs {
    final manager = $$ContributorTableTableManager(
      $_db,
      $_db.contributor,
    ).filter((f) => f.appUserId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_contributorRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AppUserTableFilterComposer
    extends Composer<_$SharedDatabase, $AppUserTable> {
  $$AppUserTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userName => $composableBuilder(
    column: $table.userName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get encryptedPassword => $composableBuilder(
    column: $table.encryptedPassword,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get activated => $composableBuilder(
    column: $table.activated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastActiveDatetime => $composableBuilder(
    column: $table.lastActiveDatetime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSystemUser => $composableBuilder(
    column: $table.isSystemUser,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  $$EmployeeTableFilterComposer get employeeId {
    final $$EmployeeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeId,
      referencedTable: $db.employee,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeTableFilterComposer(
            $db: $db,
            $table: $db.employee,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> contributorRefs(
    Expression<bool> Function($$ContributorTableFilterComposer f) f,
  ) {
    final $$ContributorTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contributor,
      getReferencedColumn: (t) => t.appUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContributorTableFilterComposer(
            $db: $db,
            $table: $db.contributor,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AppUserTableOrderingComposer
    extends Composer<_$SharedDatabase, $AppUserTable> {
  $$AppUserTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userName => $composableBuilder(
    column: $table.userName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get encryptedPassword => $composableBuilder(
    column: $table.encryptedPassword,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get activated => $composableBuilder(
    column: $table.activated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastActiveDatetime => $composableBuilder(
    column: $table.lastActiveDatetime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSystemUser => $composableBuilder(
    column: $table.isSystemUser,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  $$EmployeeTableOrderingComposer get employeeId {
    final $$EmployeeTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeId,
      referencedTable: $db.employee,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeTableOrderingComposer(
            $db: $db,
            $table: $db.employee,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppUserTableAnnotationComposer
    extends Composer<_$SharedDatabase, $AppUserTable> {
  $$AppUserTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userName =>
      $composableBuilder(column: $table.userName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get encryptedPassword => $composableBuilder(
    column: $table.encryptedPassword,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<bool> get activated =>
      $composableBuilder(column: $table.activated, builder: (column) => column);

  GeneratedColumn<String> get accessToken => $composableBuilder(
    column: $table.accessToken,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastActiveDatetime => $composableBuilder(
    column: $table.lastActiveDatetime,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSystemUser => $composableBuilder(
    column: $table.isSystemUser,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  $$EmployeeTableAnnotationComposer get employeeId {
    final $$EmployeeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeId,
      referencedTable: $db.employee,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeTableAnnotationComposer(
            $db: $db,
            $table: $db.employee,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> contributorRefs<T extends Object>(
    Expression<T> Function($$ContributorTableAnnotationComposer a) f,
  ) {
    final $$ContributorTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contributor,
      getReferencedColumn: (t) => t.appUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContributorTableAnnotationComposer(
            $db: $db,
            $table: $db.contributor,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AppUserTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $AppUserTable,
          AppUserData,
          $$AppUserTableFilterComposer,
          $$AppUserTableOrderingComposer,
          $$AppUserTableAnnotationComposer,
          $$AppUserTableCreateCompanionBuilder,
          $$AppUserTableUpdateCompanionBuilder,
          (AppUserData, $$AppUserTableReferences),
          AppUserData,
          PrefetchHooks Function({bool employeeId, bool contributorRefs})
        > {
  $$AppUserTableTableManager(_$SharedDatabase db, $AppUserTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppUserTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppUserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppUserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userName = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> encryptedPassword = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<bool> activated = const Value.absent(),
                Value<String?> accessToken = const Value.absent(),
                Value<int?> employeeId = const Value.absent(),
                Value<DateTime?> lastActiveDatetime = const Value.absent(),
                Value<bool> isSystemUser = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
              }) => AppUserCompanion(
                id: id,
                userName: userName,
                email: email,
                fullName: fullName,
                encryptedPassword: encryptedPassword,
                enabled: enabled,
                activated: activated,
                accessToken: accessToken,
                employeeId: employeeId,
                lastActiveDatetime: lastActiveDatetime,
                isSystemUser: isSystemUser,
                imagePath: imagePath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userName,
                required String email,
                required String fullName,
                required String encryptedPassword,
                required bool enabled,
                required bool activated,
                Value<String?> accessToken = const Value.absent(),
                Value<int?> employeeId = const Value.absent(),
                Value<DateTime?> lastActiveDatetime = const Value.absent(),
                required bool isSystemUser,
                Value<String?> imagePath = const Value.absent(),
              }) => AppUserCompanion.insert(
                id: id,
                userName: userName,
                email: email,
                fullName: fullName,
                encryptedPassword: encryptedPassword,
                enabled: enabled,
                activated: activated,
                accessToken: accessToken,
                employeeId: employeeId,
                lastActiveDatetime: lastActiveDatetime,
                isSystemUser: isSystemUser,
                imagePath: imagePath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AppUserTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({employeeId = false, contributorRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (contributorRefs) db.contributor,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (employeeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.employeeId,
                                    referencedTable: $$AppUserTableReferences
                                        ._employeeIdTable(db),
                                    referencedColumn: $$AppUserTableReferences
                                        ._employeeIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (contributorRefs)
                        await $_getPrefetchedData<
                          AppUserData,
                          $AppUserTable,
                          ContributorData
                        >(
                          currentTable: table,
                          referencedTable: $$AppUserTableReferences
                              ._contributorRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppUserTableReferences(
                                db,
                                table,
                                p0,
                              ).contributorRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.appUserId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AppUserTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $AppUserTable,
      AppUserData,
      $$AppUserTableFilterComposer,
      $$AppUserTableOrderingComposer,
      $$AppUserTableAnnotationComposer,
      $$AppUserTableCreateCompanionBuilder,
      $$AppUserTableUpdateCompanionBuilder,
      (AppUserData, $$AppUserTableReferences),
      AppUserData,
      PrefetchHooks Function({bool employeeId, bool contributorRefs})
    >;
typedef $$BookTableCreateCompanionBuilder =
    BookCompanion Function({
      Value<int> id,
      required String code,
      required String title,
      required int seqNum,
      required bool published,
      required bool locked,
      Value<String?> imagePath,
      Value<String?> description,
      Value<String?> note,
    });
typedef $$BookTableUpdateCompanionBuilder =
    BookCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> title,
      Value<int> seqNum,
      Value<bool> published,
      Value<bool> locked,
      Value<String?> imagePath,
      Value<String?> description,
      Value<String?> note,
    });

final class $$BookTableReferences
    extends BaseReferences<_$SharedDatabase, $BookTable, BookData> {
  $$BookTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LessonTable, List<LessonData>> _lessonRefsTable(
    _$SharedDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.lesson,
    aliasName: $_aliasNameGenerator(db.book.id, db.lesson.bookId),
  );

  $$LessonTableProcessedTableManager get lessonRefs {
    final manager = $$LessonTableTableManager(
      $_db,
      $_db.lesson,
    ).filter((f) => f.bookId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_lessonRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BookTableFilterComposer extends Composer<_$SharedDatabase, $BookTable> {
  $$BookTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seqNum => $composableBuilder(
    column: $table.seqNum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get published => $composableBuilder(
    column: $table.published,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> lessonRefs(
    Expression<bool> Function($$LessonTableFilterComposer f) f,
  ) {
    final $$LessonTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lesson,
      getReferencedColumn: (t) => t.bookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonTableFilterComposer(
            $db: $db,
            $table: $db.lesson,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BookTableOrderingComposer
    extends Composer<_$SharedDatabase, $BookTable> {
  $$BookTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seqNum => $composableBuilder(
    column: $table.seqNum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get published => $composableBuilder(
    column: $table.published,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BookTableAnnotationComposer
    extends Composer<_$SharedDatabase, $BookTable> {
  $$BookTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get seqNum =>
      $composableBuilder(column: $table.seqNum, builder: (column) => column);

  GeneratedColumn<bool> get published =>
      $composableBuilder(column: $table.published, builder: (column) => column);

  GeneratedColumn<bool> get locked =>
      $composableBuilder(column: $table.locked, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  Expression<T> lessonRefs<T extends Object>(
    Expression<T> Function($$LessonTableAnnotationComposer a) f,
  ) {
    final $$LessonTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lesson,
      getReferencedColumn: (t) => t.bookId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonTableAnnotationComposer(
            $db: $db,
            $table: $db.lesson,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BookTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $BookTable,
          BookData,
          $$BookTableFilterComposer,
          $$BookTableOrderingComposer,
          $$BookTableAnnotationComposer,
          $$BookTableCreateCompanionBuilder,
          $$BookTableUpdateCompanionBuilder,
          (BookData, $$BookTableReferences),
          BookData,
          PrefetchHooks Function({bool lessonRefs})
        > {
  $$BookTableTableManager(_$SharedDatabase db, $BookTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> seqNum = const Value.absent(),
                Value<bool> published = const Value.absent(),
                Value<bool> locked = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => BookCompanion(
                id: id,
                code: code,
                title: title,
                seqNum: seqNum,
                published: published,
                locked: locked,
                imagePath: imagePath,
                description: description,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String title,
                required int seqNum,
                required bool published,
                required bool locked,
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => BookCompanion.insert(
                id: id,
                code: code,
                title: title,
                seqNum: seqNum,
                published: published,
                locked: locked,
                imagePath: imagePath,
                description: description,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$BookTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({lessonRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (lessonRefs) db.lesson],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (lessonRefs)
                    await $_getPrefetchedData<BookData, $BookTable, LessonData>(
                      currentTable: table,
                      referencedTable: $$BookTableReferences._lessonRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$BookTableReferences(db, table, p0).lessonRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.bookId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BookTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $BookTable,
      BookData,
      $$BookTableFilterComposer,
      $$BookTableOrderingComposer,
      $$BookTableAnnotationComposer,
      $$BookTableCreateCompanionBuilder,
      $$BookTableUpdateCompanionBuilder,
      (BookData, $$BookTableReferences),
      BookData,
      PrefetchHooks Function({bool lessonRefs})
    >;
typedef $$CategoryTableCreateCompanionBuilder =
    CategoryCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      Value<String?> imagePath,
      Value<String?> description,
    });
typedef $$CategoryTableUpdateCompanionBuilder =
    CategoryCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<String?> imagePath,
      Value<String?> description,
    });

final class $$CategoryTableReferences
    extends BaseReferences<_$SharedDatabase, $CategoryTable, CategoryData> {
  $$CategoryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductTable, List<ProductData>>
  _productRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.product,
    aliasName: $_aliasNameGenerator(db.category.id, db.product.categoryId),
  );

  $$ProductTableProcessedTableManager get productRefs {
    final manager = $$ProductTableTableManager(
      $_db,
      $_db.product,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_productRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoryTableFilterComposer
    extends Composer<_$SharedDatabase, $CategoryTable> {
  $$CategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productRefs(
    Expression<bool> Function($$ProductTableFilterComposer f) f,
  ) {
    final $$ProductTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.product,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableFilterComposer(
            $db: $db,
            $table: $db.product,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoryTableOrderingComposer
    extends Composer<_$SharedDatabase, $CategoryTable> {
  $$CategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryTableAnnotationComposer
    extends Composer<_$SharedDatabase, $CategoryTable> {
  $$CategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> productRefs<T extends Object>(
    Expression<T> Function($$ProductTableAnnotationComposer a) f,
  ) {
    final $$ProductTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.product,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableAnnotationComposer(
            $db: $db,
            $table: $db.product,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoryTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $CategoryTable,
          CategoryData,
          $$CategoryTableFilterComposer,
          $$CategoryTableOrderingComposer,
          $$CategoryTableAnnotationComposer,
          $$CategoryTableCreateCompanionBuilder,
          $$CategoryTableUpdateCompanionBuilder,
          (CategoryData, $$CategoryTableReferences),
          CategoryData,
          PrefetchHooks Function({bool productRefs})
        > {
  $$CategoryTableTableManager(_$SharedDatabase db, $CategoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => CategoryCompanion(
                id: id,
                code: code,
                name: name,
                imagePath: imagePath,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => CategoryCompanion.insert(
                id: id,
                code: code,
                name: name,
                imagePath: imagePath,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productRefs) db.product],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productRefs)
                    await $_getPrefetchedData<
                      CategoryData,
                      $CategoryTable,
                      ProductData
                    >(
                      currentTable: table,
                      referencedTable: $$CategoryTableReferences
                          ._productRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CategoryTableReferences(db, table, p0).productRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.categoryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoryTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $CategoryTable,
      CategoryData,
      $$CategoryTableFilterComposer,
      $$CategoryTableOrderingComposer,
      $$CategoryTableAnnotationComposer,
      $$CategoryTableCreateCompanionBuilder,
      $$CategoryTableUpdateCompanionBuilder,
      (CategoryData, $$CategoryTableReferences),
      CategoryData,
      PrefetchHooks Function({bool productRefs})
    >;
typedef $$CountryTableCreateCompanionBuilder =
    CountryCompanion Function({
      required String id,
      required String code,
      required String name,
      required String nameInEnglish,
      required String countryCode,
      required String isoCode2,
      required String isoCode3,
      required int population,
      required int area,
      Value<double?> gdp,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$CountryTableUpdateCompanionBuilder =
    CountryCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> name,
      Value<String> nameInEnglish,
      Value<String> countryCode,
      Value<String> isoCode2,
      Value<String> isoCode3,
      Value<int> population,
      Value<int> area,
      Value<double?> gdp,
      Value<String?> description,
      Value<int> rowid,
    });

final class $$CountryTableReferences
    extends BaseReferences<_$SharedDatabase, $CountryTable, CountryData> {
  $$CountryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FootballPlayerTable, List<FootballPlayerData>>
  _footballPlayerRefsTable(_$SharedDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.footballPlayer,
        aliasName: $_aliasNameGenerator(
          db.country.id,
          db.footballPlayer.countryId,
        ),
      );

  $$FootballPlayerTableProcessedTableManager get footballPlayerRefs {
    final manager = $$FootballPlayerTableTableManager(
      $_db,
      $_db.footballPlayer,
    ).filter((f) => f.countryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_footballPlayerRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TeacherTable, List<TeacherData>>
  _teacherRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.teacher,
    aliasName: $_aliasNameGenerator(db.country.id, db.teacher.countryId),
  );

  $$TeacherTableProcessedTableManager get teacherRefs {
    final manager = $$TeacherTableTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.countryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_teacherRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CountryTableFilterComposer
    extends Composer<_$SharedDatabase, $CountryTable> {
  $$CountryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameInEnglish => $composableBuilder(
    column: $table.nameInEnglish,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isoCode2 => $composableBuilder(
    column: $table.isoCode2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isoCode3 => $composableBuilder(
    column: $table.isoCode3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gdp => $composableBuilder(
    column: $table.gdp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> footballPlayerRefs(
    Expression<bool> Function($$FootballPlayerTableFilterComposer f) f,
  ) {
    final $$FootballPlayerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.footballPlayer,
      getReferencedColumn: (t) => t.countryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FootballPlayerTableFilterComposer(
            $db: $db,
            $table: $db.footballPlayer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> teacherRefs(
    Expression<bool> Function($$TeacherTableFilterComposer f) f,
  ) {
    final $$TeacherTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.countryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherTableFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CountryTableOrderingComposer
    extends Composer<_$SharedDatabase, $CountryTable> {
  $$CountryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameInEnglish => $composableBuilder(
    column: $table.nameInEnglish,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isoCode2 => $composableBuilder(
    column: $table.isoCode2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isoCode3 => $composableBuilder(
    column: $table.isoCode3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gdp => $composableBuilder(
    column: $table.gdp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CountryTableAnnotationComposer
    extends Composer<_$SharedDatabase, $CountryTable> {
  $$CountryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameInEnglish => $composableBuilder(
    column: $table.nameInEnglish,
    builder: (column) => column,
  );

  GeneratedColumn<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get isoCode2 =>
      $composableBuilder(column: $table.isoCode2, builder: (column) => column);

  GeneratedColumn<String> get isoCode3 =>
      $composableBuilder(column: $table.isoCode3, builder: (column) => column);

  GeneratedColumn<int> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => column,
  );

  GeneratedColumn<int> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<double> get gdp =>
      $composableBuilder(column: $table.gdp, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> footballPlayerRefs<T extends Object>(
    Expression<T> Function($$FootballPlayerTableAnnotationComposer a) f,
  ) {
    final $$FootballPlayerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.footballPlayer,
      getReferencedColumn: (t) => t.countryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FootballPlayerTableAnnotationComposer(
            $db: $db,
            $table: $db.footballPlayer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> teacherRefs<T extends Object>(
    Expression<T> Function($$TeacherTableAnnotationComposer a) f,
  ) {
    final $$TeacherTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.countryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherTableAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CountryTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $CountryTable,
          CountryData,
          $$CountryTableFilterComposer,
          $$CountryTableOrderingComposer,
          $$CountryTableAnnotationComposer,
          $$CountryTableCreateCompanionBuilder,
          $$CountryTableUpdateCompanionBuilder,
          (CountryData, $$CountryTableReferences),
          CountryData,
          PrefetchHooks Function({bool footballPlayerRefs, bool teacherRefs})
        > {
  $$CountryTableTableManager(_$SharedDatabase db, $CountryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CountryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CountryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CountryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> nameInEnglish = const Value.absent(),
                Value<String> countryCode = const Value.absent(),
                Value<String> isoCode2 = const Value.absent(),
                Value<String> isoCode3 = const Value.absent(),
                Value<int> population = const Value.absent(),
                Value<int> area = const Value.absent(),
                Value<double?> gdp = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CountryCompanion(
                id: id,
                code: code,
                name: name,
                nameInEnglish: nameInEnglish,
                countryCode: countryCode,
                isoCode2: isoCode2,
                isoCode3: isoCode3,
                population: population,
                area: area,
                gdp: gdp,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String name,
                required String nameInEnglish,
                required String countryCode,
                required String isoCode2,
                required String isoCode3,
                required int population,
                required int area,
                Value<double?> gdp = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CountryCompanion.insert(
                id: id,
                code: code,
                name: name,
                nameInEnglish: nameInEnglish,
                countryCode: countryCode,
                isoCode2: isoCode2,
                isoCode3: isoCode3,
                population: population,
                area: area,
                gdp: gdp,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CountryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({footballPlayerRefs = false, teacherRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (footballPlayerRefs) db.footballPlayer,
                    if (teacherRefs) db.teacher,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (footballPlayerRefs)
                        await $_getPrefetchedData<
                          CountryData,
                          $CountryTable,
                          FootballPlayerData
                        >(
                          currentTable: table,
                          referencedTable: $$CountryTableReferences
                              ._footballPlayerRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CountryTableReferences(
                                db,
                                table,
                                p0,
                              ).footballPlayerRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.countryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (teacherRefs)
                        await $_getPrefetchedData<
                          CountryData,
                          $CountryTable,
                          TeacherData
                        >(
                          currentTable: table,
                          referencedTable: $$CountryTableReferences
                              ._teacherRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CountryTableReferences(
                                db,
                                table,
                                p0,
                              ).teacherRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.countryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CountryTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $CountryTable,
      CountryData,
      $$CountryTableFilterComposer,
      $$CountryTableOrderingComposer,
      $$CountryTableAnnotationComposer,
      $$CountryTableCreateCompanionBuilder,
      $$CountryTableUpdateCompanionBuilder,
      (CountryData, $$CountryTableReferences),
      CountryData,
      PrefetchHooks Function({bool footballPlayerRefs, bool teacherRefs})
    >;
typedef $$CouponTypeTableCreateCompanionBuilder =
    CouponTypeCompanion Function({
      required String id,
      required String name,
      Value<int> rowid,
    });
typedef $$CouponTypeTableUpdateCompanionBuilder =
    CouponTypeCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> rowid,
    });

final class $$CouponTypeTableReferences
    extends BaseReferences<_$SharedDatabase, $CouponTypeTable, CouponTypeData> {
  $$CouponTypeTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CouponTable, List<CouponData>> _couponRefsTable(
    _$SharedDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.coupon,
    aliasName: $_aliasNameGenerator(db.couponType.id, db.coupon.type),
  );

  $$CouponTableProcessedTableManager get couponRefs {
    final manager = $$CouponTableTableManager(
      $_db,
      $_db.coupon,
    ).filter((f) => f.type.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_couponRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CouponTypeTableFilterComposer
    extends Composer<_$SharedDatabase, $CouponTypeTable> {
  $$CouponTypeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> couponRefs(
    Expression<bool> Function($$CouponTableFilterComposer f) f,
  ) {
    final $$CouponTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.coupon,
      getReferencedColumn: (t) => t.type,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CouponTableFilterComposer(
            $db: $db,
            $table: $db.coupon,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CouponTypeTableOrderingComposer
    extends Composer<_$SharedDatabase, $CouponTypeTable> {
  $$CouponTypeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CouponTypeTableAnnotationComposer
    extends Composer<_$SharedDatabase, $CouponTypeTable> {
  $$CouponTypeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> couponRefs<T extends Object>(
    Expression<T> Function($$CouponTableAnnotationComposer a) f,
  ) {
    final $$CouponTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.coupon,
      getReferencedColumn: (t) => t.type,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CouponTableAnnotationComposer(
            $db: $db,
            $table: $db.coupon,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CouponTypeTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $CouponTypeTable,
          CouponTypeData,
          $$CouponTypeTableFilterComposer,
          $$CouponTypeTableOrderingComposer,
          $$CouponTypeTableAnnotationComposer,
          $$CouponTypeTableCreateCompanionBuilder,
          $$CouponTypeTableUpdateCompanionBuilder,
          (CouponTypeData, $$CouponTypeTableReferences),
          CouponTypeData,
          PrefetchHooks Function({bool couponRefs})
        > {
  $$CouponTypeTableTableManager(_$SharedDatabase db, $CouponTypeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CouponTypeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CouponTypeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CouponTypeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CouponTypeCompanion(id: id, name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) =>
                  CouponTypeCompanion.insert(id: id, name: name, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CouponTypeTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({couponRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (couponRefs) db.coupon],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (couponRefs)
                    await $_getPrefetchedData<
                      CouponTypeData,
                      $CouponTypeTable,
                      CouponData
                    >(
                      currentTable: table,
                      referencedTable: $$CouponTypeTableReferences
                          ._couponRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CouponTypeTableReferences(db, table, p0).couponRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.type == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CouponTypeTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $CouponTypeTable,
      CouponTypeData,
      $$CouponTypeTableFilterComposer,
      $$CouponTypeTableOrderingComposer,
      $$CouponTypeTableAnnotationComposer,
      $$CouponTypeTableCreateCompanionBuilder,
      $$CouponTypeTableUpdateCompanionBuilder,
      (CouponTypeData, $$CouponTypeTableReferences),
      CouponTypeData,
      PrefetchHooks Function({bool couponRefs})
    >;
typedef $$CouponTableCreateCompanionBuilder =
    CouponCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      required bool active,
      required String type,
      Value<String?> description,
    });
typedef $$CouponTableUpdateCompanionBuilder =
    CouponCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<bool> active,
      Value<String> type,
      Value<String?> description,
    });

final class $$CouponTableReferences
    extends BaseReferences<_$SharedDatabase, $CouponTable, CouponData> {
  $$CouponTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CouponTypeTable _typeTable(_$SharedDatabase db) => db.couponType
      .createAlias($_aliasNameGenerator(db.coupon.type, db.couponType.id));

  $$CouponTypeTableProcessedTableManager get type {
    final $_column = $_itemColumn<String>('type')!;

    final manager = $$CouponTypeTableTableManager(
      $_db,
      $_db.couponType,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_typeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CouponTableFilterComposer
    extends Composer<_$SharedDatabase, $CouponTable> {
  $$CouponTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$CouponTypeTableFilterComposer get type {
    final $$CouponTypeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.type,
      referencedTable: $db.couponType,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CouponTypeTableFilterComposer(
            $db: $db,
            $table: $db.couponType,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CouponTableOrderingComposer
    extends Composer<_$SharedDatabase, $CouponTable> {
  $$CouponTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$CouponTypeTableOrderingComposer get type {
    final $$CouponTypeTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.type,
      referencedTable: $db.couponType,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CouponTypeTableOrderingComposer(
            $db: $db,
            $table: $db.couponType,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CouponTableAnnotationComposer
    extends Composer<_$SharedDatabase, $CouponTable> {
  $$CouponTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$CouponTypeTableAnnotationComposer get type {
    final $$CouponTypeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.type,
      referencedTable: $db.couponType,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CouponTypeTableAnnotationComposer(
            $db: $db,
            $table: $db.couponType,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CouponTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $CouponTable,
          CouponData,
          $$CouponTableFilterComposer,
          $$CouponTableOrderingComposer,
          $$CouponTableAnnotationComposer,
          $$CouponTableCreateCompanionBuilder,
          $$CouponTableUpdateCompanionBuilder,
          (CouponData, $$CouponTableReferences),
          CouponData,
          PrefetchHooks Function({bool type})
        > {
  $$CouponTableTableManager(_$SharedDatabase db, $CouponTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CouponTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CouponTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CouponTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => CouponCompanion(
                id: id,
                code: code,
                name: name,
                active: active,
                type: type,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                required bool active,
                required String type,
                Value<String?> description = const Value.absent(),
              }) => CouponCompanion.insert(
                id: id,
                code: code,
                name: name,
                active: active,
                type: type,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$CouponTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({type = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (type) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.type,
                                referencedTable: $$CouponTableReferences
                                    ._typeTable(db),
                                referencedColumn: $$CouponTableReferences
                                    ._typeTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CouponTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $CouponTable,
      CouponData,
      $$CouponTableFilterComposer,
      $$CouponTableOrderingComposer,
      $$CouponTableAnnotationComposer,
      $$CouponTableCreateCompanionBuilder,
      $$CouponTableUpdateCompanionBuilder,
      (CouponData, $$CouponTableReferences),
      CouponData,
      PrefetchHooks Function({bool type})
    >;
typedef $$CurrencyTableCreateCompanionBuilder =
    CurrencyCompanion Function({
      required String id,
      required String symbol,
      required String name,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$CurrencyTableUpdateCompanionBuilder =
    CurrencyCompanion Function({
      Value<String> id,
      Value<String> symbol,
      Value<String> name,
      Value<String?> description,
      Value<int> rowid,
    });

class $$CurrencyTableFilterComposer
    extends Composer<_$SharedDatabase, $CurrencyTable> {
  $$CurrencyTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CurrencyTableOrderingComposer
    extends Composer<_$SharedDatabase, $CurrencyTable> {
  $$CurrencyTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CurrencyTableAnnotationComposer
    extends Composer<_$SharedDatabase, $CurrencyTable> {
  $$CurrencyTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$CurrencyTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $CurrencyTable,
          CurrencyData,
          $$CurrencyTableFilterComposer,
          $$CurrencyTableOrderingComposer,
          $$CurrencyTableAnnotationComposer,
          $$CurrencyTableCreateCompanionBuilder,
          $$CurrencyTableUpdateCompanionBuilder,
          (
            CurrencyData,
            BaseReferences<_$SharedDatabase, $CurrencyTable, CurrencyData>,
          ),
          CurrencyData,
          PrefetchHooks Function()
        > {
  $$CurrencyTableTableManager(_$SharedDatabase db, $CurrencyTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CurrencyTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CurrencyTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CurrencyTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> symbol = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CurrencyCompanion(
                id: id,
                symbol: symbol,
                name: name,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String symbol,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CurrencyCompanion.insert(
                id: id,
                symbol: symbol,
                name: name,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CurrencyTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $CurrencyTable,
      CurrencyData,
      $$CurrencyTableFilterComposer,
      $$CurrencyTableOrderingComposer,
      $$CurrencyTableAnnotationComposer,
      $$CurrencyTableCreateCompanionBuilder,
      $$CurrencyTableUpdateCompanionBuilder,
      (
        CurrencyData,
        BaseReferences<_$SharedDatabase, $CurrencyTable, CurrencyData>,
      ),
      CurrencyData,
      PrefetchHooks Function()
    >;
typedef $$CustomerTableCreateCompanionBuilder =
    CustomerCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      required bool vip,
      Value<String?> address,
      Value<String?> phone,
      required String email,
      Value<String?> imagePath,
    });
typedef $$CustomerTableUpdateCompanionBuilder =
    CustomerCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<bool> vip,
      Value<String?> address,
      Value<String?> phone,
      Value<String> email,
      Value<String?> imagePath,
    });

final class $$CustomerTableReferences
    extends BaseReferences<_$SharedDatabase, $CustomerTable, CustomerData> {
  $$CustomerTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SalesOrderTable, List<SalesOrderData>>
  _salesOrderRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.salesOrder,
    aliasName: $_aliasNameGenerator(db.customer.id, db.salesOrder.customerId),
  );

  $$SalesOrderTableProcessedTableManager get salesOrderRefs {
    final manager = $$SalesOrderTableTableManager(
      $_db,
      $_db.salesOrder,
    ).filter((f) => f.customerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_salesOrderRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CustomerTableFilterComposer
    extends Composer<_$SharedDatabase, $CustomerTable> {
  $$CustomerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get vip => $composableBuilder(
    column: $table.vip,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> salesOrderRefs(
    Expression<bool> Function($$SalesOrderTableFilterComposer f) f,
  ) {
    final $$SalesOrderTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesOrder,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesOrderTableFilterComposer(
            $db: $db,
            $table: $db.salesOrder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomerTableOrderingComposer
    extends Composer<_$SharedDatabase, $CustomerTable> {
  $$CustomerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get vip => $composableBuilder(
    column: $table.vip,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomerTableAnnotationComposer
    extends Composer<_$SharedDatabase, $CustomerTable> {
  $$CustomerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get vip =>
      $composableBuilder(column: $table.vip, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  Expression<T> salesOrderRefs<T extends Object>(
    Expression<T> Function($$SalesOrderTableAnnotationComposer a) f,
  ) {
    final $$SalesOrderTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesOrder,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesOrderTableAnnotationComposer(
            $db: $db,
            $table: $db.salesOrder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomerTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $CustomerTable,
          CustomerData,
          $$CustomerTableFilterComposer,
          $$CustomerTableOrderingComposer,
          $$CustomerTableAnnotationComposer,
          $$CustomerTableCreateCompanionBuilder,
          $$CustomerTableUpdateCompanionBuilder,
          (CustomerData, $$CustomerTableReferences),
          CustomerData,
          PrefetchHooks Function({bool salesOrderRefs})
        > {
  $$CustomerTableTableManager(_$SharedDatabase db, $CustomerTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> vip = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
              }) => CustomerCompanion(
                id: id,
                code: code,
                name: name,
                vip: vip,
                address: address,
                phone: phone,
                email: email,
                imagePath: imagePath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                required bool vip,
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                required String email,
                Value<String?> imagePath = const Value.absent(),
              }) => CustomerCompanion.insert(
                id: id,
                code: code,
                name: name,
                vip: vip,
                address: address,
                phone: phone,
                email: email,
                imagePath: imagePath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CustomerTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({salesOrderRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (salesOrderRefs) db.salesOrder],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (salesOrderRefs)
                    await $_getPrefetchedData<
                      CustomerData,
                      $CustomerTable,
                      SalesOrderData
                    >(
                      currentTable: table,
                      referencedTable: $$CustomerTableReferences
                          ._salesOrderRefsTable(db),
                      managerFromTypedResult: (p0) => $$CustomerTableReferences(
                        db,
                        table,
                        p0,
                      ).salesOrderRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.customerId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CustomerTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $CustomerTable,
      CustomerData,
      $$CustomerTableFilterComposer,
      $$CustomerTableOrderingComposer,
      $$CustomerTableAnnotationComposer,
      $$CustomerTableCreateCompanionBuilder,
      $$CustomerTableUpdateCompanionBuilder,
      (CustomerData, $$CustomerTableReferences),
      CustomerData,
      PrefetchHooks Function({bool salesOrderRefs})
    >;
typedef $$EmploymentHistoryTableCreateCompanionBuilder =
    EmploymentHistoryCompanion Function({
      Value<int> id,
      required int employeeId,
      required int employeePositionId,
      required int departmentId,
      required int companyId,
      required DateTime fromDate,
      required DateTime toDate,
    });
typedef $$EmploymentHistoryTableUpdateCompanionBuilder =
    EmploymentHistoryCompanion Function({
      Value<int> id,
      Value<int> employeeId,
      Value<int> employeePositionId,
      Value<int> departmentId,
      Value<int> companyId,
      Value<DateTime> fromDate,
      Value<DateTime> toDate,
    });

final class $$EmploymentHistoryTableReferences
    extends
        BaseReferences<
          _$SharedDatabase,
          $EmploymentHistoryTable,
          EmploymentHistoryData
        > {
  $$EmploymentHistoryTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EmployeeTable _employeeIdTable(_$SharedDatabase db) =>
      db.employee.createAlias(
        $_aliasNameGenerator(db.employmentHistory.employeeId, db.employee.id),
      );

  $$EmployeeTableProcessedTableManager get employeeId {
    final $_column = $_itemColumn<int>('employee_id')!;

    final manager = $$EmployeeTableTableManager(
      $_db,
      $_db.employee,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_employeeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EmployeePositionTable _employeePositionIdTable(_$SharedDatabase db) =>
      db.employeePosition.createAlias(
        $_aliasNameGenerator(
          db.employmentHistory.employeePositionId,
          db.employeePosition.id,
        ),
      );

  $$EmployeePositionTableProcessedTableManager get employeePositionId {
    final $_column = $_itemColumn<int>('employee_position_id')!;

    final manager = $$EmployeePositionTableTableManager(
      $_db,
      $_db.employeePosition,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_employeePositionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DepartmentTable _departmentIdTable(_$SharedDatabase db) =>
      db.department.createAlias(
        $_aliasNameGenerator(
          db.employmentHistory.departmentId,
          db.department.id,
        ),
      );

  $$DepartmentTableProcessedTableManager get departmentId {
    final $_column = $_itemColumn<int>('department_id')!;

    final manager = $$DepartmentTableTableManager(
      $_db,
      $_db.department,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_departmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CompanyTable _companyIdTable(_$SharedDatabase db) =>
      db.company.createAlias(
        $_aliasNameGenerator(db.employmentHistory.companyId, db.company.id),
      );

  $$CompanyTableProcessedTableManager get companyId {
    final $_column = $_itemColumn<int>('company_id')!;

    final manager = $$CompanyTableTableManager(
      $_db,
      $_db.company,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_companyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EmploymentHistoryTableFilterComposer
    extends Composer<_$SharedDatabase, $EmploymentHistoryTable> {
  $$EmploymentHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fromDate => $composableBuilder(
    column: $table.fromDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get toDate => $composableBuilder(
    column: $table.toDate,
    builder: (column) => ColumnFilters(column),
  );

  $$EmployeeTableFilterComposer get employeeId {
    final $$EmployeeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeId,
      referencedTable: $db.employee,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeTableFilterComposer(
            $db: $db,
            $table: $db.employee,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EmployeePositionTableFilterComposer get employeePositionId {
    final $$EmployeePositionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeePositionId,
      referencedTable: $db.employeePosition,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeePositionTableFilterComposer(
            $db: $db,
            $table: $db.employeePosition,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DepartmentTableFilterComposer get departmentId {
    final $$DepartmentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.departmentId,
      referencedTable: $db.department,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepartmentTableFilterComposer(
            $db: $db,
            $table: $db.department,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CompanyTableFilterComposer get companyId {
    final $$CompanyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.companyId,
      referencedTable: $db.company,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompanyTableFilterComposer(
            $db: $db,
            $table: $db.company,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EmploymentHistoryTableOrderingComposer
    extends Composer<_$SharedDatabase, $EmploymentHistoryTable> {
  $$EmploymentHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fromDate => $composableBuilder(
    column: $table.fromDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get toDate => $composableBuilder(
    column: $table.toDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$EmployeeTableOrderingComposer get employeeId {
    final $$EmployeeTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeId,
      referencedTable: $db.employee,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeTableOrderingComposer(
            $db: $db,
            $table: $db.employee,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EmployeePositionTableOrderingComposer get employeePositionId {
    final $$EmployeePositionTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeePositionId,
      referencedTable: $db.employeePosition,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeePositionTableOrderingComposer(
            $db: $db,
            $table: $db.employeePosition,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DepartmentTableOrderingComposer get departmentId {
    final $$DepartmentTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.departmentId,
      referencedTable: $db.department,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepartmentTableOrderingComposer(
            $db: $db,
            $table: $db.department,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CompanyTableOrderingComposer get companyId {
    final $$CompanyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.companyId,
      referencedTable: $db.company,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompanyTableOrderingComposer(
            $db: $db,
            $table: $db.company,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EmploymentHistoryTableAnnotationComposer
    extends Composer<_$SharedDatabase, $EmploymentHistoryTable> {
  $$EmploymentHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get fromDate =>
      $composableBuilder(column: $table.fromDate, builder: (column) => column);

  GeneratedColumn<DateTime> get toDate =>
      $composableBuilder(column: $table.toDate, builder: (column) => column);

  $$EmployeeTableAnnotationComposer get employeeId {
    final $$EmployeeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeId,
      referencedTable: $db.employee,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeTableAnnotationComposer(
            $db: $db,
            $table: $db.employee,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EmployeePositionTableAnnotationComposer get employeePositionId {
    final $$EmployeePositionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeePositionId,
      referencedTable: $db.employeePosition,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeePositionTableAnnotationComposer(
            $db: $db,
            $table: $db.employeePosition,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DepartmentTableAnnotationComposer get departmentId {
    final $$DepartmentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.departmentId,
      referencedTable: $db.department,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DepartmentTableAnnotationComposer(
            $db: $db,
            $table: $db.department,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CompanyTableAnnotationComposer get companyId {
    final $$CompanyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.companyId,
      referencedTable: $db.company,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompanyTableAnnotationComposer(
            $db: $db,
            $table: $db.company,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EmploymentHistoryTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $EmploymentHistoryTable,
          EmploymentHistoryData,
          $$EmploymentHistoryTableFilterComposer,
          $$EmploymentHistoryTableOrderingComposer,
          $$EmploymentHistoryTableAnnotationComposer,
          $$EmploymentHistoryTableCreateCompanionBuilder,
          $$EmploymentHistoryTableUpdateCompanionBuilder,
          (EmploymentHistoryData, $$EmploymentHistoryTableReferences),
          EmploymentHistoryData,
          PrefetchHooks Function({
            bool employeeId,
            bool employeePositionId,
            bool departmentId,
            bool companyId,
          })
        > {
  $$EmploymentHistoryTableTableManager(
    _$SharedDatabase db,
    $EmploymentHistoryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmploymentHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmploymentHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmploymentHistoryTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> employeeId = const Value.absent(),
                Value<int> employeePositionId = const Value.absent(),
                Value<int> departmentId = const Value.absent(),
                Value<int> companyId = const Value.absent(),
                Value<DateTime> fromDate = const Value.absent(),
                Value<DateTime> toDate = const Value.absent(),
              }) => EmploymentHistoryCompanion(
                id: id,
                employeeId: employeeId,
                employeePositionId: employeePositionId,
                departmentId: departmentId,
                companyId: companyId,
                fromDate: fromDate,
                toDate: toDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int employeeId,
                required int employeePositionId,
                required int departmentId,
                required int companyId,
                required DateTime fromDate,
                required DateTime toDate,
              }) => EmploymentHistoryCompanion.insert(
                id: id,
                employeeId: employeeId,
                employeePositionId: employeePositionId,
                departmentId: departmentId,
                companyId: companyId,
                fromDate: fromDate,
                toDate: toDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EmploymentHistoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                employeeId = false,
                employeePositionId = false,
                departmentId = false,
                companyId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (employeeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.employeeId,
                                    referencedTable:
                                        $$EmploymentHistoryTableReferences
                                            ._employeeIdTable(db),
                                    referencedColumn:
                                        $$EmploymentHistoryTableReferences
                                            ._employeeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (employeePositionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.employeePositionId,
                                    referencedTable:
                                        $$EmploymentHistoryTableReferences
                                            ._employeePositionIdTable(db),
                                    referencedColumn:
                                        $$EmploymentHistoryTableReferences
                                            ._employeePositionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (departmentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.departmentId,
                                    referencedTable:
                                        $$EmploymentHistoryTableReferences
                                            ._departmentIdTable(db),
                                    referencedColumn:
                                        $$EmploymentHistoryTableReferences
                                            ._departmentIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (companyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.companyId,
                                    referencedTable:
                                        $$EmploymentHistoryTableReferences
                                            ._companyIdTable(db),
                                    referencedColumn:
                                        $$EmploymentHistoryTableReferences
                                            ._companyIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$EmploymentHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $EmploymentHistoryTable,
      EmploymentHistoryData,
      $$EmploymentHistoryTableFilterComposer,
      $$EmploymentHistoryTableOrderingComposer,
      $$EmploymentHistoryTableAnnotationComposer,
      $$EmploymentHistoryTableCreateCompanionBuilder,
      $$EmploymentHistoryTableUpdateCompanionBuilder,
      (EmploymentHistoryData, $$EmploymentHistoryTableReferences),
      EmploymentHistoryData,
      PrefetchHooks Function({
        bool employeeId,
        bool employeePositionId,
        bool departmentId,
        bool companyId,
      })
    >;
typedef $$FootballPlayerTableCreateCompanionBuilder =
    FootballPlayerCompanion Function({
      Value<int> id,
      required String fullName,
      required DateTime birthday,
      required String countryId,
      Value<String?> imagePath,
      Value<String?> description,
    });
typedef $$FootballPlayerTableUpdateCompanionBuilder =
    FootballPlayerCompanion Function({
      Value<int> id,
      Value<String> fullName,
      Value<DateTime> birthday,
      Value<String> countryId,
      Value<String?> imagePath,
      Value<String?> description,
    });

final class $$FootballPlayerTableReferences
    extends
        BaseReferences<
          _$SharedDatabase,
          $FootballPlayerTable,
          FootballPlayerData
        > {
  $$FootballPlayerTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CountryTable _countryIdTable(_$SharedDatabase db) =>
      db.country.createAlias(
        $_aliasNameGenerator(db.footballPlayer.countryId, db.country.id),
      );

  $$CountryTableProcessedTableManager get countryId {
    final $_column = $_itemColumn<String>('country_id')!;

    final manager = $$CountryTableTableManager(
      $_db,
      $_db.country,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_countryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FootballPlayerTableFilterComposer
    extends Composer<_$SharedDatabase, $FootballPlayerTable> {
  $$FootballPlayerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthday => $composableBuilder(
    column: $table.birthday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$CountryTableFilterComposer get countryId {
    final $$CountryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.country,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountryTableFilterComposer(
            $db: $db,
            $table: $db.country,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FootballPlayerTableOrderingComposer
    extends Composer<_$SharedDatabase, $FootballPlayerTable> {
  $$FootballPlayerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthday => $composableBuilder(
    column: $table.birthday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$CountryTableOrderingComposer get countryId {
    final $$CountryTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.country,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountryTableOrderingComposer(
            $db: $db,
            $table: $db.country,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FootballPlayerTableAnnotationComposer
    extends Composer<_$SharedDatabase, $FootballPlayerTable> {
  $$FootballPlayerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<DateTime> get birthday =>
      $composableBuilder(column: $table.birthday, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$CountryTableAnnotationComposer get countryId {
    final $$CountryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.country,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountryTableAnnotationComposer(
            $db: $db,
            $table: $db.country,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FootballPlayerTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $FootballPlayerTable,
          FootballPlayerData,
          $$FootballPlayerTableFilterComposer,
          $$FootballPlayerTableOrderingComposer,
          $$FootballPlayerTableAnnotationComposer,
          $$FootballPlayerTableCreateCompanionBuilder,
          $$FootballPlayerTableUpdateCompanionBuilder,
          (FootballPlayerData, $$FootballPlayerTableReferences),
          FootballPlayerData,
          PrefetchHooks Function({bool countryId})
        > {
  $$FootballPlayerTableTableManager(
    _$SharedDatabase db,
    $FootballPlayerTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FootballPlayerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FootballPlayerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FootballPlayerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<DateTime> birthday = const Value.absent(),
                Value<String> countryId = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => FootballPlayerCompanion(
                id: id,
                fullName: fullName,
                birthday: birthday,
                countryId: countryId,
                imagePath: imagePath,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String fullName,
                required DateTime birthday,
                required String countryId,
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => FootballPlayerCompanion.insert(
                id: id,
                fullName: fullName,
                birthday: birthday,
                countryId: countryId,
                imagePath: imagePath,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FootballPlayerTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({countryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (countryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.countryId,
                                referencedTable: $$FootballPlayerTableReferences
                                    ._countryIdTable(db),
                                referencedColumn:
                                    $$FootballPlayerTableReferences
                                        ._countryIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FootballPlayerTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $FootballPlayerTable,
      FootballPlayerData,
      $$FootballPlayerTableFilterComposer,
      $$FootballPlayerTableOrderingComposer,
      $$FootballPlayerTableAnnotationComposer,
      $$FootballPlayerTableCreateCompanionBuilder,
      $$FootballPlayerTableUpdateCompanionBuilder,
      (FootballPlayerData, $$FootballPlayerTableReferences),
      FootballPlayerData,
      PrefetchHooks Function({bool countryId})
    >;
typedef $$GenderTableCreateCompanionBuilder =
    GenderCompanion Function({
      required String id,
      required String name,
      Value<int> rowid,
    });
typedef $$GenderTableUpdateCompanionBuilder =
    GenderCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> rowid,
    });

final class $$GenderTableReferences
    extends BaseReferences<_$SharedDatabase, $GenderTable, GenderData> {
  $$GenderTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TeacherTable, List<TeacherData>>
  _teacherRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.teacher,
    aliasName: $_aliasNameGenerator(db.gender.id, db.teacher.genderId),
  );

  $$TeacherTableProcessedTableManager get teacherRefs {
    final manager = $$TeacherTableTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.genderId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_teacherRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GenderTableFilterComposer
    extends Composer<_$SharedDatabase, $GenderTable> {
  $$GenderTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> teacherRefs(
    Expression<bool> Function($$TeacherTableFilterComposer f) f,
  ) {
    final $$TeacherTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.genderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherTableFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GenderTableOrderingComposer
    extends Composer<_$SharedDatabase, $GenderTable> {
  $$GenderTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GenderTableAnnotationComposer
    extends Composer<_$SharedDatabase, $GenderTable> {
  $$GenderTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> teacherRefs<T extends Object>(
    Expression<T> Function($$TeacherTableAnnotationComposer a) f,
  ) {
    final $$TeacherTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.genderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherTableAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GenderTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $GenderTable,
          GenderData,
          $$GenderTableFilterComposer,
          $$GenderTableOrderingComposer,
          $$GenderTableAnnotationComposer,
          $$GenderTableCreateCompanionBuilder,
          $$GenderTableUpdateCompanionBuilder,
          (GenderData, $$GenderTableReferences),
          GenderData,
          PrefetchHooks Function({bool teacherRefs})
        > {
  $$GenderTableTableManager(_$SharedDatabase db, $GenderTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GenderTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GenderTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GenderTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GenderCompanion(id: id, name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => GenderCompanion.insert(id: id, name: name, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$GenderTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({teacherRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (teacherRefs) db.teacher],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (teacherRefs)
                    await $_getPrefetchedData<
                      GenderData,
                      $GenderTable,
                      TeacherData
                    >(
                      currentTable: table,
                      referencedTable: $$GenderTableReferences
                          ._teacherRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$GenderTableReferences(db, table, p0).teacherRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.genderId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$GenderTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $GenderTable,
      GenderData,
      $$GenderTableFilterComposer,
      $$GenderTableOrderingComposer,
      $$GenderTableAnnotationComposer,
      $$GenderTableCreateCompanionBuilder,
      $$GenderTableUpdateCompanionBuilder,
      (GenderData, $$GenderTableReferences),
      GenderData,
      PrefetchHooks Function({bool teacherRefs})
    >;
typedef $$LanguageTableCreateCompanionBuilder =
    LanguageCompanion Function({
      required String id,
      required String name,
      required String nameInEnglish,
      required int seqNum,
      Value<int> rowid,
    });
typedef $$LanguageTableUpdateCompanionBuilder =
    LanguageCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> nameInEnglish,
      Value<int> seqNum,
      Value<int> rowid,
    });

class $$LanguageTableFilterComposer
    extends Composer<_$SharedDatabase, $LanguageTable> {
  $$LanguageTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameInEnglish => $composableBuilder(
    column: $table.nameInEnglish,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seqNum => $composableBuilder(
    column: $table.seqNum,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LanguageTableOrderingComposer
    extends Composer<_$SharedDatabase, $LanguageTable> {
  $$LanguageTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameInEnglish => $composableBuilder(
    column: $table.nameInEnglish,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seqNum => $composableBuilder(
    column: $table.seqNum,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LanguageTableAnnotationComposer
    extends Composer<_$SharedDatabase, $LanguageTable> {
  $$LanguageTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameInEnglish => $composableBuilder(
    column: $table.nameInEnglish,
    builder: (column) => column,
  );

  GeneratedColumn<int> get seqNum =>
      $composableBuilder(column: $table.seqNum, builder: (column) => column);
}

class $$LanguageTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $LanguageTable,
          LanguageData,
          $$LanguageTableFilterComposer,
          $$LanguageTableOrderingComposer,
          $$LanguageTableAnnotationComposer,
          $$LanguageTableCreateCompanionBuilder,
          $$LanguageTableUpdateCompanionBuilder,
          (
            LanguageData,
            BaseReferences<_$SharedDatabase, $LanguageTable, LanguageData>,
          ),
          LanguageData,
          PrefetchHooks Function()
        > {
  $$LanguageTableTableManager(_$SharedDatabase db, $LanguageTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LanguageTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LanguageTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LanguageTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> nameInEnglish = const Value.absent(),
                Value<int> seqNum = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LanguageCompanion(
                id: id,
                name: name,
                nameInEnglish: nameInEnglish,
                seqNum: seqNum,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String nameInEnglish,
                required int seqNum,
                Value<int> rowid = const Value.absent(),
              }) => LanguageCompanion.insert(
                id: id,
                name: name,
                nameInEnglish: nameInEnglish,
                seqNum: seqNum,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LanguageTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $LanguageTable,
      LanguageData,
      $$LanguageTableFilterComposer,
      $$LanguageTableOrderingComposer,
      $$LanguageTableAnnotationComposer,
      $$LanguageTableCreateCompanionBuilder,
      $$LanguageTableUpdateCompanionBuilder,
      (
        LanguageData,
        BaseReferences<_$SharedDatabase, $LanguageTable, LanguageData>,
      ),
      LanguageData,
      PrefetchHooks Function()
    >;
typedef $$LessonTableCreateCompanionBuilder =
    LessonCompanion Function({
      Value<int> id,
      required String title,
      required String titleInEnglish,
      required int seqNum,
      required bool locked,
      required bool published,
      Value<DateTime?> publishDate,
      Value<String?> imagePath,
      required int bookId,
      Value<String?> description,
      Value<String?> note,
    });
typedef $$LessonTableUpdateCompanionBuilder =
    LessonCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> titleInEnglish,
      Value<int> seqNum,
      Value<bool> locked,
      Value<bool> published,
      Value<DateTime?> publishDate,
      Value<String?> imagePath,
      Value<int> bookId,
      Value<String?> description,
      Value<String?> note,
    });

final class $$LessonTableReferences
    extends BaseReferences<_$SharedDatabase, $LessonTable, LessonData> {
  $$LessonTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BookTable _bookIdTable(_$SharedDatabase db) =>
      db.book.createAlias($_aliasNameGenerator(db.lesson.bookId, db.book.id));

  $$BookTableProcessedTableManager get bookId {
    final $_column = $_itemColumn<int>('book_id')!;

    final manager = $$BookTableTableManager(
      $_db,
      $_db.book,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_bookIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LessonTableFilterComposer
    extends Composer<_$SharedDatabase, $LessonTable> {
  $$LessonTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleInEnglish => $composableBuilder(
    column: $table.titleInEnglish,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seqNum => $composableBuilder(
    column: $table.seqNum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get published => $composableBuilder(
    column: $table.published,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$BookTableFilterComposer get bookId {
    final $$BookTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.book,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookTableFilterComposer(
            $db: $db,
            $table: $db.book,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonTableOrderingComposer
    extends Composer<_$SharedDatabase, $LessonTable> {
  $$LessonTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleInEnglish => $composableBuilder(
    column: $table.titleInEnglish,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seqNum => $composableBuilder(
    column: $table.seqNum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get published => $composableBuilder(
    column: $table.published,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$BookTableOrderingComposer get bookId {
    final $$BookTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.book,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookTableOrderingComposer(
            $db: $db,
            $table: $db.book,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonTableAnnotationComposer
    extends Composer<_$SharedDatabase, $LessonTable> {
  $$LessonTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get titleInEnglish => $composableBuilder(
    column: $table.titleInEnglish,
    builder: (column) => column,
  );

  GeneratedColumn<int> get seqNum =>
      $composableBuilder(column: $table.seqNum, builder: (column) => column);

  GeneratedColumn<bool> get locked =>
      $composableBuilder(column: $table.locked, builder: (column) => column);

  GeneratedColumn<bool> get published =>
      $composableBuilder(column: $table.published, builder: (column) => column);

  GeneratedColumn<DateTime> get publishDate => $composableBuilder(
    column: $table.publishDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$BookTableAnnotationComposer get bookId {
    final $$BookTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.bookId,
      referencedTable: $db.book,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BookTableAnnotationComposer(
            $db: $db,
            $table: $db.book,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $LessonTable,
          LessonData,
          $$LessonTableFilterComposer,
          $$LessonTableOrderingComposer,
          $$LessonTableAnnotationComposer,
          $$LessonTableCreateCompanionBuilder,
          $$LessonTableUpdateCompanionBuilder,
          (LessonData, $$LessonTableReferences),
          LessonData,
          PrefetchHooks Function({bool bookId})
        > {
  $$LessonTableTableManager(_$SharedDatabase db, $LessonTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LessonTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LessonTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LessonTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> titleInEnglish = const Value.absent(),
                Value<int> seqNum = const Value.absent(),
                Value<bool> locked = const Value.absent(),
                Value<bool> published = const Value.absent(),
                Value<DateTime?> publishDate = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<int> bookId = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => LessonCompanion(
                id: id,
                title: title,
                titleInEnglish: titleInEnglish,
                seqNum: seqNum,
                locked: locked,
                published: published,
                publishDate: publishDate,
                imagePath: imagePath,
                bookId: bookId,
                description: description,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String titleInEnglish,
                required int seqNum,
                required bool locked,
                required bool published,
                Value<DateTime?> publishDate = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                required int bookId,
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => LessonCompanion.insert(
                id: id,
                title: title,
                titleInEnglish: titleInEnglish,
                seqNum: seqNum,
                locked: locked,
                published: published,
                publishDate: publishDate,
                imagePath: imagePath,
                bookId: bookId,
                description: description,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$LessonTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({bookId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (bookId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.bookId,
                                referencedTable: $$LessonTableReferences
                                    ._bookIdTable(db),
                                referencedColumn: $$LessonTableReferences
                                    ._bookIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LessonTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $LessonTable,
      LessonData,
      $$LessonTableFilterComposer,
      $$LessonTableOrderingComposer,
      $$LessonTableAnnotationComposer,
      $$LessonTableCreateCompanionBuilder,
      $$LessonTableUpdateCompanionBuilder,
      (LessonData, $$LessonTableReferences),
      LessonData,
      PrefetchHooks Function({bool bookId})
    >;
typedef $$NoteTableCreateCompanionBuilder =
    NoteCompanion Function({
      Value<int> id,
      required String title,
      required String content,
      required DateTime createDateTime,
      required String colorCode,
    });
typedef $$NoteTableUpdateCompanionBuilder =
    NoteCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> content,
      Value<DateTime> createDateTime,
      Value<String> colorCode,
    });

class $$NoteTableFilterComposer extends Composer<_$SharedDatabase, $NoteTable> {
  $$NoteTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createDateTime => $composableBuilder(
    column: $table.createDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorCode => $composableBuilder(
    column: $table.colorCode,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NoteTableOrderingComposer
    extends Composer<_$SharedDatabase, $NoteTable> {
  $$NoteTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createDateTime => $composableBuilder(
    column: $table.createDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorCode => $composableBuilder(
    column: $table.colorCode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NoteTableAnnotationComposer
    extends Composer<_$SharedDatabase, $NoteTable> {
  $$NoteTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createDateTime => $composableBuilder(
    column: $table.createDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get colorCode =>
      $composableBuilder(column: $table.colorCode, builder: (column) => column);
}

class $$NoteTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $NoteTable,
          NoteData,
          $$NoteTableFilterComposer,
          $$NoteTableOrderingComposer,
          $$NoteTableAnnotationComposer,
          $$NoteTableCreateCompanionBuilder,
          $$NoteTableUpdateCompanionBuilder,
          (NoteData, BaseReferences<_$SharedDatabase, $NoteTable, NoteData>),
          NoteData,
          PrefetchHooks Function()
        > {
  $$NoteTableTableManager(_$SharedDatabase db, $NoteTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoteTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoteTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoteTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> createDateTime = const Value.absent(),
                Value<String> colorCode = const Value.absent(),
              }) => NoteCompanion(
                id: id,
                title: title,
                content: content,
                createDateTime: createDateTime,
                colorCode: colorCode,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String content,
                required DateTime createDateTime,
                required String colorCode,
              }) => NoteCompanion.insert(
                id: id,
                title: title,
                content: content,
                createDateTime: createDateTime,
                colorCode: colorCode,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NoteTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $NoteTable,
      NoteData,
      $$NoteTableFilterComposer,
      $$NoteTableOrderingComposer,
      $$NoteTableAnnotationComposer,
      $$NoteTableCreateCompanionBuilder,
      $$NoteTableUpdateCompanionBuilder,
      (NoteData, BaseReferences<_$SharedDatabase, $NoteTable, NoteData>),
      NoteData,
      PrefetchHooks Function()
    >;
typedef $$NotificationMessageTableCreateCompanionBuilder =
    NotificationMessageCompanion Function({
      Value<int> id,
      required String title,
      required String message,
      required DateTime createDateTime,
      required bool read,
      required String type,
    });
typedef $$NotificationMessageTableUpdateCompanionBuilder =
    NotificationMessageCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> message,
      Value<DateTime> createDateTime,
      Value<bool> read,
      Value<String> type,
    });

class $$NotificationMessageTableFilterComposer
    extends Composer<_$SharedDatabase, $NotificationMessageTable> {
  $$NotificationMessageTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createDateTime => $composableBuilder(
    column: $table.createDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get read => $composableBuilder(
    column: $table.read,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotificationMessageTableOrderingComposer
    extends Composer<_$SharedDatabase, $NotificationMessageTable> {
  $$NotificationMessageTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createDateTime => $composableBuilder(
    column: $table.createDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get read => $composableBuilder(
    column: $table.read,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotificationMessageTableAnnotationComposer
    extends Composer<_$SharedDatabase, $NotificationMessageTable> {
  $$NotificationMessageTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<DateTime> get createDateTime => $composableBuilder(
    column: $table.createDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get read =>
      $composableBuilder(column: $table.read, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);
}

class $$NotificationMessageTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $NotificationMessageTable,
          NotificationMessageData,
          $$NotificationMessageTableFilterComposer,
          $$NotificationMessageTableOrderingComposer,
          $$NotificationMessageTableAnnotationComposer,
          $$NotificationMessageTableCreateCompanionBuilder,
          $$NotificationMessageTableUpdateCompanionBuilder,
          (
            NotificationMessageData,
            BaseReferences<
              _$SharedDatabase,
              $NotificationMessageTable,
              NotificationMessageData
            >,
          ),
          NotificationMessageData,
          PrefetchHooks Function()
        > {
  $$NotificationMessageTableTableManager(
    _$SharedDatabase db,
    $NotificationMessageTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationMessageTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationMessageTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$NotificationMessageTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<DateTime> createDateTime = const Value.absent(),
                Value<bool> read = const Value.absent(),
                Value<String> type = const Value.absent(),
              }) => NotificationMessageCompanion(
                id: id,
                title: title,
                message: message,
                createDateTime: createDateTime,
                read: read,
                type: type,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String message,
                required DateTime createDateTime,
                required bool read,
                required String type,
              }) => NotificationMessageCompanion.insert(
                id: id,
                title: title,
                message: message,
                createDateTime: createDateTime,
                read: read,
                type: type,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotificationMessageTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $NotificationMessageTable,
      NotificationMessageData,
      $$NotificationMessageTableFilterComposer,
      $$NotificationMessageTableOrderingComposer,
      $$NotificationMessageTableAnnotationComposer,
      $$NotificationMessageTableCreateCompanionBuilder,
      $$NotificationMessageTableUpdateCompanionBuilder,
      (
        NotificationMessageData,
        BaseReferences<
          _$SharedDatabase,
          $NotificationMessageTable,
          NotificationMessageData
        >,
      ),
      NotificationMessageData,
      PrefetchHooks Function()
    >;
typedef $$PaymentGatewayTableCreateCompanionBuilder =
    PaymentGatewayCompanion Function({
      required String id,
      required String name,
      required bool active,
      Value<int> rowid,
    });
typedef $$PaymentGatewayTableUpdateCompanionBuilder =
    PaymentGatewayCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<bool> active,
      Value<int> rowid,
    });

class $$PaymentGatewayTableFilterComposer
    extends Composer<_$SharedDatabase, $PaymentGatewayTable> {
  $$PaymentGatewayTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PaymentGatewayTableOrderingComposer
    extends Composer<_$SharedDatabase, $PaymentGatewayTable> {
  $$PaymentGatewayTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PaymentGatewayTableAnnotationComposer
    extends Composer<_$SharedDatabase, $PaymentGatewayTable> {
  $$PaymentGatewayTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);
}

class $$PaymentGatewayTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $PaymentGatewayTable,
          PaymentGatewayData,
          $$PaymentGatewayTableFilterComposer,
          $$PaymentGatewayTableOrderingComposer,
          $$PaymentGatewayTableAnnotationComposer,
          $$PaymentGatewayTableCreateCompanionBuilder,
          $$PaymentGatewayTableUpdateCompanionBuilder,
          (
            PaymentGatewayData,
            BaseReferences<
              _$SharedDatabase,
              $PaymentGatewayTable,
              PaymentGatewayData
            >,
          ),
          PaymentGatewayData,
          PrefetchHooks Function()
        > {
  $$PaymentGatewayTableTableManager(
    _$SharedDatabase db,
    $PaymentGatewayTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentGatewayTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentGatewayTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentGatewayTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PaymentGatewayCompanion(
                id: id,
                name: name,
                active: active,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required bool active,
                Value<int> rowid = const Value.absent(),
              }) => PaymentGatewayCompanion.insert(
                id: id,
                name: name,
                active: active,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PaymentGatewayTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $PaymentGatewayTable,
      PaymentGatewayData,
      $$PaymentGatewayTableFilterComposer,
      $$PaymentGatewayTableOrderingComposer,
      $$PaymentGatewayTableAnnotationComposer,
      $$PaymentGatewayTableCreateCompanionBuilder,
      $$PaymentGatewayTableUpdateCompanionBuilder,
      (
        PaymentGatewayData,
        BaseReferences<
          _$SharedDatabase,
          $PaymentGatewayTable,
          PaymentGatewayData
        >,
      ),
      PaymentGatewayData,
      PrefetchHooks Function()
    >;
typedef $$ProductTableCreateCompanionBuilder =
    ProductCompanion Function({
      Value<int> id,
      required String name,
      required double price,
      required bool active,
      Value<String?> imagePath,
      required int categoryId,
      required double estimatedInputPrice,
      required double taxRate,
      Value<String?> description,
    });
typedef $$ProductTableUpdateCompanionBuilder =
    ProductCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> price,
      Value<bool> active,
      Value<String?> imagePath,
      Value<int> categoryId,
      Value<double> estimatedInputPrice,
      Value<double> taxRate,
      Value<String?> description,
    });

final class $$ProductTableReferences
    extends BaseReferences<_$SharedDatabase, $ProductTable, ProductData> {
  $$ProductTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoryTable _categoryIdTable(_$SharedDatabase db) => db.category
      .createAlias($_aliasNameGenerator(db.product.categoryId, db.category.id));

  $$CategoryTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoryTableTableManager(
      $_db,
      $_db.category,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SalesOrderLineTable, List<SalesOrderLineData>>
  _salesOrderLineRefsTable(_$SharedDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.salesOrderLine,
        aliasName: $_aliasNameGenerator(
          db.product.id,
          db.salesOrderLine.productId,
        ),
      );

  $$SalesOrderLineTableProcessedTableManager get salesOrderLineRefs {
    final manager = $$SalesOrderLineTableTableManager(
      $_db,
      $_db.salesOrderLine,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_salesOrderLineRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductTableFilterComposer
    extends Composer<_$SharedDatabase, $ProductTable> {
  $$ProductTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get estimatedInputPrice => $composableBuilder(
    column: $table.estimatedInputPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get taxRate => $composableBuilder(
    column: $table.taxRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoryTableFilterComposer get categoryId {
    final $$CategoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableFilterComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> salesOrderLineRefs(
    Expression<bool> Function($$SalesOrderLineTableFilterComposer f) f,
  ) {
    final $$SalesOrderLineTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesOrderLine,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesOrderLineTableFilterComposer(
            $db: $db,
            $table: $db.salesOrderLine,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductTableOrderingComposer
    extends Composer<_$SharedDatabase, $ProductTable> {
  $$ProductTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get estimatedInputPrice => $composableBuilder(
    column: $table.estimatedInputPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get taxRate => $composableBuilder(
    column: $table.taxRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoryTableOrderingComposer get categoryId {
    final $$CategoryTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableOrderingComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTableAnnotationComposer
    extends Composer<_$SharedDatabase, $ProductTable> {
  $$ProductTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<double> get estimatedInputPrice => $composableBuilder(
    column: $table.estimatedInputPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get taxRate =>
      $composableBuilder(column: $table.taxRate, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$CategoryTableAnnotationComposer get categoryId {
    final $$CategoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.category,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableAnnotationComposer(
            $db: $db,
            $table: $db.category,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> salesOrderLineRefs<T extends Object>(
    Expression<T> Function($$SalesOrderLineTableAnnotationComposer a) f,
  ) {
    final $$SalesOrderLineTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesOrderLine,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesOrderLineTableAnnotationComposer(
            $db: $db,
            $table: $db.salesOrderLine,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $ProductTable,
          ProductData,
          $$ProductTableFilterComposer,
          $$ProductTableOrderingComposer,
          $$ProductTableAnnotationComposer,
          $$ProductTableCreateCompanionBuilder,
          $$ProductTableUpdateCompanionBuilder,
          (ProductData, $$ProductTableReferences),
          ProductData,
          PrefetchHooks Function({bool categoryId, bool salesOrderLineRefs})
        > {
  $$ProductTableTableManager(_$SharedDatabase db, $ProductTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<double> estimatedInputPrice = const Value.absent(),
                Value<double> taxRate = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => ProductCompanion(
                id: id,
                name: name,
                price: price,
                active: active,
                imagePath: imagePath,
                categoryId: categoryId,
                estimatedInputPrice: estimatedInputPrice,
                taxRate: taxRate,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required double price,
                required bool active,
                Value<String?> imagePath = const Value.absent(),
                required int categoryId,
                required double estimatedInputPrice,
                required double taxRate,
                Value<String?> description = const Value.absent(),
              }) => ProductCompanion.insert(
                id: id,
                name: name,
                price: price,
                active: active,
                imagePath: imagePath,
                categoryId: categoryId,
                estimatedInputPrice: estimatedInputPrice,
                taxRate: taxRate,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({categoryId = false, salesOrderLineRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (salesOrderLineRefs) db.salesOrderLine,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (categoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categoryId,
                                    referencedTable: $$ProductTableReferences
                                        ._categoryIdTable(db),
                                    referencedColumn: $$ProductTableReferences
                                        ._categoryIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (salesOrderLineRefs)
                        await $_getPrefetchedData<
                          ProductData,
                          $ProductTable,
                          SalesOrderLineData
                        >(
                          currentTable: table,
                          referencedTable: $$ProductTableReferences
                              ._salesOrderLineRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductTableReferences(
                                db,
                                table,
                                p0,
                              ).salesOrderLineRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProductTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $ProductTable,
      ProductData,
      $$ProductTableFilterComposer,
      $$ProductTableOrderingComposer,
      $$ProductTableAnnotationComposer,
      $$ProductTableCreateCompanionBuilder,
      $$ProductTableUpdateCompanionBuilder,
      (ProductData, $$ProductTableReferences),
      ProductData,
      PrefetchHooks Function({bool categoryId, bool salesOrderLineRefs})
    >;
typedef $$SalesOrderTableCreateCompanionBuilder =
    SalesOrderCompanion Function({
      Value<int> id,
      required DateTime orderDateTime,
      required double amount,
      required double taxAmount,
      required String status,
      required int sellerId,
      required int customerId,
    });
typedef $$SalesOrderTableUpdateCompanionBuilder =
    SalesOrderCompanion Function({
      Value<int> id,
      Value<DateTime> orderDateTime,
      Value<double> amount,
      Value<double> taxAmount,
      Value<String> status,
      Value<int> sellerId,
      Value<int> customerId,
    });

final class $$SalesOrderTableReferences
    extends BaseReferences<_$SharedDatabase, $SalesOrderTable, SalesOrderData> {
  $$SalesOrderTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EmployeeTable _sellerIdTable(_$SharedDatabase db) =>
      db.employee.createAlias(
        $_aliasNameGenerator(db.salesOrder.sellerId, db.employee.id),
      );

  $$EmployeeTableProcessedTableManager get sellerId {
    final $_column = $_itemColumn<int>('seller_id')!;

    final manager = $$EmployeeTableTableManager(
      $_db,
      $_db.employee,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sellerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CustomerTable _customerIdTable(_$SharedDatabase db) =>
      db.customer.createAlias(
        $_aliasNameGenerator(db.salesOrder.customerId, db.customer.id),
      );

  $$CustomerTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<int>('customer_id')!;

    final manager = $$CustomerTableTableManager(
      $_db,
      $_db.customer,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SalesOrderLineTable, List<SalesOrderLineData>>
  _salesOrderLineRefsTable(_$SharedDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.salesOrderLine,
        aliasName: $_aliasNameGenerator(
          db.salesOrder.id,
          db.salesOrderLine.salesOrderId,
        ),
      );

  $$SalesOrderLineTableProcessedTableManager get salesOrderLineRefs {
    final manager = $$SalesOrderLineTableTableManager(
      $_db,
      $_db.salesOrderLine,
    ).filter((f) => f.salesOrderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_salesOrderLineRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SalesOrderTableFilterComposer
    extends Composer<_$SharedDatabase, $SalesOrderTable> {
  $$SalesOrderTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get orderDateTime => $composableBuilder(
    column: $table.orderDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get taxAmount => $composableBuilder(
    column: $table.taxAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$EmployeeTableFilterComposer get sellerId {
    final $$EmployeeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sellerId,
      referencedTable: $db.employee,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeTableFilterComposer(
            $db: $db,
            $table: $db.employee,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CustomerTableFilterComposer get customerId {
    final $$CustomerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customer,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomerTableFilterComposer(
            $db: $db,
            $table: $db.customer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> salesOrderLineRefs(
    Expression<bool> Function($$SalesOrderLineTableFilterComposer f) f,
  ) {
    final $$SalesOrderLineTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesOrderLine,
      getReferencedColumn: (t) => t.salesOrderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesOrderLineTableFilterComposer(
            $db: $db,
            $table: $db.salesOrderLine,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SalesOrderTableOrderingComposer
    extends Composer<_$SharedDatabase, $SalesOrderTable> {
  $$SalesOrderTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get orderDateTime => $composableBuilder(
    column: $table.orderDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get taxAmount => $composableBuilder(
    column: $table.taxAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$EmployeeTableOrderingComposer get sellerId {
    final $$EmployeeTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sellerId,
      referencedTable: $db.employee,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeTableOrderingComposer(
            $db: $db,
            $table: $db.employee,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CustomerTableOrderingComposer get customerId {
    final $$CustomerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customer,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomerTableOrderingComposer(
            $db: $db,
            $table: $db.customer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalesOrderTableAnnotationComposer
    extends Composer<_$SharedDatabase, $SalesOrderTable> {
  $$SalesOrderTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get orderDateTime => $composableBuilder(
    column: $table.orderDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<double> get taxAmount =>
      $composableBuilder(column: $table.taxAmount, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$EmployeeTableAnnotationComposer get sellerId {
    final $$EmployeeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sellerId,
      referencedTable: $db.employee,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeTableAnnotationComposer(
            $db: $db,
            $table: $db.employee,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CustomerTableAnnotationComposer get customerId {
    final $$CustomerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customer,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomerTableAnnotationComposer(
            $db: $db,
            $table: $db.customer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> salesOrderLineRefs<T extends Object>(
    Expression<T> Function($$SalesOrderLineTableAnnotationComposer a) f,
  ) {
    final $$SalesOrderLineTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.salesOrderLine,
      getReferencedColumn: (t) => t.salesOrderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesOrderLineTableAnnotationComposer(
            $db: $db,
            $table: $db.salesOrderLine,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SalesOrderTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $SalesOrderTable,
          SalesOrderData,
          $$SalesOrderTableFilterComposer,
          $$SalesOrderTableOrderingComposer,
          $$SalesOrderTableAnnotationComposer,
          $$SalesOrderTableCreateCompanionBuilder,
          $$SalesOrderTableUpdateCompanionBuilder,
          (SalesOrderData, $$SalesOrderTableReferences),
          SalesOrderData,
          PrefetchHooks Function({
            bool sellerId,
            bool customerId,
            bool salesOrderLineRefs,
          })
        > {
  $$SalesOrderTableTableManager(_$SharedDatabase db, $SalesOrderTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesOrderTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesOrderTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesOrderTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> orderDateTime = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<double> taxAmount = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> sellerId = const Value.absent(),
                Value<int> customerId = const Value.absent(),
              }) => SalesOrderCompanion(
                id: id,
                orderDateTime: orderDateTime,
                amount: amount,
                taxAmount: taxAmount,
                status: status,
                sellerId: sellerId,
                customerId: customerId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime orderDateTime,
                required double amount,
                required double taxAmount,
                required String status,
                required int sellerId,
                required int customerId,
              }) => SalesOrderCompanion.insert(
                id: id,
                orderDateTime: orderDateTime,
                amount: amount,
                taxAmount: taxAmount,
                status: status,
                sellerId: sellerId,
                customerId: customerId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SalesOrderTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                sellerId = false,
                customerId = false,
                salesOrderLineRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (salesOrderLineRefs) db.salesOrderLine,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (sellerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sellerId,
                                    referencedTable: $$SalesOrderTableReferences
                                        ._sellerIdTable(db),
                                    referencedColumn:
                                        $$SalesOrderTableReferences
                                            ._sellerIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (customerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.customerId,
                                    referencedTable: $$SalesOrderTableReferences
                                        ._customerIdTable(db),
                                    referencedColumn:
                                        $$SalesOrderTableReferences
                                            ._customerIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (salesOrderLineRefs)
                        await $_getPrefetchedData<
                          SalesOrderData,
                          $SalesOrderTable,
                          SalesOrderLineData
                        >(
                          currentTable: table,
                          referencedTable: $$SalesOrderTableReferences
                              ._salesOrderLineRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SalesOrderTableReferences(
                                db,
                                table,
                                p0,
                              ).salesOrderLineRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.salesOrderId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SalesOrderTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $SalesOrderTable,
      SalesOrderData,
      $$SalesOrderTableFilterComposer,
      $$SalesOrderTableOrderingComposer,
      $$SalesOrderTableAnnotationComposer,
      $$SalesOrderTableCreateCompanionBuilder,
      $$SalesOrderTableUpdateCompanionBuilder,
      (SalesOrderData, $$SalesOrderTableReferences),
      SalesOrderData,
      PrefetchHooks Function({
        bool sellerId,
        bool customerId,
        bool salesOrderLineRefs,
      })
    >;
typedef $$SalesOrderLineTableCreateCompanionBuilder =
    SalesOrderLineCompanion Function({
      Value<int> id,
      required int salesOrderId,
      required int productId,
      required double units,
      required double amount,
      required double taxAmount,
    });
typedef $$SalesOrderLineTableUpdateCompanionBuilder =
    SalesOrderLineCompanion Function({
      Value<int> id,
      Value<int> salesOrderId,
      Value<int> productId,
      Value<double> units,
      Value<double> amount,
      Value<double> taxAmount,
    });

final class $$SalesOrderLineTableReferences
    extends
        BaseReferences<
          _$SharedDatabase,
          $SalesOrderLineTable,
          SalesOrderLineData
        > {
  $$SalesOrderLineTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SalesOrderTable _salesOrderIdTable(_$SharedDatabase db) =>
      db.salesOrder.createAlias(
        $_aliasNameGenerator(db.salesOrderLine.salesOrderId, db.salesOrder.id),
      );

  $$SalesOrderTableProcessedTableManager get salesOrderId {
    final $_column = $_itemColumn<int>('sales_order_id')!;

    final manager = $$SalesOrderTableTableManager(
      $_db,
      $_db.salesOrder,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_salesOrderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductTable _productIdTable(_$SharedDatabase db) =>
      db.product.createAlias(
        $_aliasNameGenerator(db.salesOrderLine.productId, db.product.id),
      );

  $$ProductTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductTableTableManager(
      $_db,
      $_db.product,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SalesOrderLineTableFilterComposer
    extends Composer<_$SharedDatabase, $SalesOrderLineTable> {
  $$SalesOrderLineTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get taxAmount => $composableBuilder(
    column: $table.taxAmount,
    builder: (column) => ColumnFilters(column),
  );

  $$SalesOrderTableFilterComposer get salesOrderId {
    final $$SalesOrderTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.salesOrderId,
      referencedTable: $db.salesOrder,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesOrderTableFilterComposer(
            $db: $db,
            $table: $db.salesOrder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductTableFilterComposer get productId {
    final $$ProductTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.product,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableFilterComposer(
            $db: $db,
            $table: $db.product,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalesOrderLineTableOrderingComposer
    extends Composer<_$SharedDatabase, $SalesOrderLineTable> {
  $$SalesOrderLineTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get taxAmount => $composableBuilder(
    column: $table.taxAmount,
    builder: (column) => ColumnOrderings(column),
  );

  $$SalesOrderTableOrderingComposer get salesOrderId {
    final $$SalesOrderTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.salesOrderId,
      referencedTable: $db.salesOrder,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesOrderTableOrderingComposer(
            $db: $db,
            $table: $db.salesOrder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductTableOrderingComposer get productId {
    final $$ProductTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.product,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableOrderingComposer(
            $db: $db,
            $table: $db.product,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalesOrderLineTableAnnotationComposer
    extends Composer<_$SharedDatabase, $SalesOrderLineTable> {
  $$SalesOrderLineTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get units =>
      $composableBuilder(column: $table.units, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<double> get taxAmount =>
      $composableBuilder(column: $table.taxAmount, builder: (column) => column);

  $$SalesOrderTableAnnotationComposer get salesOrderId {
    final $$SalesOrderTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.salesOrderId,
      referencedTable: $db.salesOrder,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SalesOrderTableAnnotationComposer(
            $db: $db,
            $table: $db.salesOrder,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductTableAnnotationComposer get productId {
    final $$ProductTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.product,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableAnnotationComposer(
            $db: $db,
            $table: $db.product,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SalesOrderLineTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $SalesOrderLineTable,
          SalesOrderLineData,
          $$SalesOrderLineTableFilterComposer,
          $$SalesOrderLineTableOrderingComposer,
          $$SalesOrderLineTableAnnotationComposer,
          $$SalesOrderLineTableCreateCompanionBuilder,
          $$SalesOrderLineTableUpdateCompanionBuilder,
          (SalesOrderLineData, $$SalesOrderLineTableReferences),
          SalesOrderLineData,
          PrefetchHooks Function({bool salesOrderId, bool productId})
        > {
  $$SalesOrderLineTableTableManager(
    _$SharedDatabase db,
    $SalesOrderLineTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesOrderLineTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesOrderLineTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesOrderLineTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> salesOrderId = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<double> units = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<double> taxAmount = const Value.absent(),
              }) => SalesOrderLineCompanion(
                id: id,
                salesOrderId: salesOrderId,
                productId: productId,
                units: units,
                amount: amount,
                taxAmount: taxAmount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int salesOrderId,
                required int productId,
                required double units,
                required double amount,
                required double taxAmount,
              }) => SalesOrderLineCompanion.insert(
                id: id,
                salesOrderId: salesOrderId,
                productId: productId,
                units: units,
                amount: amount,
                taxAmount: taxAmount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SalesOrderLineTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({salesOrderId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (salesOrderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.salesOrderId,
                                referencedTable: $$SalesOrderLineTableReferences
                                    ._salesOrderIdTable(db),
                                referencedColumn:
                                    $$SalesOrderLineTableReferences
                                        ._salesOrderIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable: $$SalesOrderLineTableReferences
                                    ._productIdTable(db),
                                referencedColumn:
                                    $$SalesOrderLineTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SalesOrderLineTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $SalesOrderLineTable,
      SalesOrderLineData,
      $$SalesOrderLineTableFilterComposer,
      $$SalesOrderLineTableOrderingComposer,
      $$SalesOrderLineTableAnnotationComposer,
      $$SalesOrderLineTableCreateCompanionBuilder,
      $$SalesOrderLineTableUpdateCompanionBuilder,
      (SalesOrderLineData, $$SalesOrderLineTableReferences),
      SalesOrderLineData,
      PrefetchHooks Function({bool salesOrderId, bool productId})
    >;
typedef $$SongTableCreateCompanionBuilder =
    SongCompanion Function({
      Value<int> id,
      required String name,
      required bool locked,
      required bool published,
      Value<String?> imagePath,
      Value<String?> description,
      Value<String?> note,
      Value<String?> youtubeCode,
      Value<String?> youtubeVideoInfo,
      required int albumId,
    });
typedef $$SongTableUpdateCompanionBuilder =
    SongCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<bool> locked,
      Value<bool> published,
      Value<String?> imagePath,
      Value<String?> description,
      Value<String?> note,
      Value<String?> youtubeCode,
      Value<String?> youtubeVideoInfo,
      Value<int> albumId,
    });

final class $$SongTableReferences
    extends BaseReferences<_$SharedDatabase, $SongTable, SongData> {
  $$SongTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AlbumTable _albumIdTable(_$SharedDatabase db) =>
      db.album.createAlias($_aliasNameGenerator(db.song.albumId, db.album.id));

  $$AlbumTableProcessedTableManager get albumId {
    final $_column = $_itemColumn<int>('album_id')!;

    final manager = $$AlbumTableTableManager(
      $_db,
      $_db.album,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_albumIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SongTableFilterComposer extends Composer<_$SharedDatabase, $SongTable> {
  $$SongTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get published => $composableBuilder(
    column: $table.published,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get youtubeCode => $composableBuilder(
    column: $table.youtubeCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get youtubeVideoInfo => $composableBuilder(
    column: $table.youtubeVideoInfo,
    builder: (column) => ColumnFilters(column),
  );

  $$AlbumTableFilterComposer get albumId {
    final $$AlbumTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.albumId,
      referencedTable: $db.album,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlbumTableFilterComposer(
            $db: $db,
            $table: $db.album,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SongTableOrderingComposer
    extends Composer<_$SharedDatabase, $SongTable> {
  $$SongTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get published => $composableBuilder(
    column: $table.published,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get youtubeCode => $composableBuilder(
    column: $table.youtubeCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get youtubeVideoInfo => $composableBuilder(
    column: $table.youtubeVideoInfo,
    builder: (column) => ColumnOrderings(column),
  );

  $$AlbumTableOrderingComposer get albumId {
    final $$AlbumTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.albumId,
      referencedTable: $db.album,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlbumTableOrderingComposer(
            $db: $db,
            $table: $db.album,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SongTableAnnotationComposer
    extends Composer<_$SharedDatabase, $SongTable> {
  $$SongTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get locked =>
      $composableBuilder(column: $table.locked, builder: (column) => column);

  GeneratedColumn<bool> get published =>
      $composableBuilder(column: $table.published, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get youtubeCode => $composableBuilder(
    column: $table.youtubeCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get youtubeVideoInfo => $composableBuilder(
    column: $table.youtubeVideoInfo,
    builder: (column) => column,
  );

  $$AlbumTableAnnotationComposer get albumId {
    final $$AlbumTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.albumId,
      referencedTable: $db.album,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlbumTableAnnotationComposer(
            $db: $db,
            $table: $db.album,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SongTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $SongTable,
          SongData,
          $$SongTableFilterComposer,
          $$SongTableOrderingComposer,
          $$SongTableAnnotationComposer,
          $$SongTableCreateCompanionBuilder,
          $$SongTableUpdateCompanionBuilder,
          (SongData, $$SongTableReferences),
          SongData,
          PrefetchHooks Function({bool albumId})
        > {
  $$SongTableTableManager(_$SharedDatabase db, $SongTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SongTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SongTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SongTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> locked = const Value.absent(),
                Value<bool> published = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> youtubeCode = const Value.absent(),
                Value<String?> youtubeVideoInfo = const Value.absent(),
                Value<int> albumId = const Value.absent(),
              }) => SongCompanion(
                id: id,
                name: name,
                locked: locked,
                published: published,
                imagePath: imagePath,
                description: description,
                note: note,
                youtubeCode: youtubeCode,
                youtubeVideoInfo: youtubeVideoInfo,
                albumId: albumId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required bool locked,
                required bool published,
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> youtubeCode = const Value.absent(),
                Value<String?> youtubeVideoInfo = const Value.absent(),
                required int albumId,
              }) => SongCompanion.insert(
                id: id,
                name: name,
                locked: locked,
                published: published,
                imagePath: imagePath,
                description: description,
                note: note,
                youtubeCode: youtubeCode,
                youtubeVideoInfo: youtubeVideoInfo,
                albumId: albumId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$SongTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({albumId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (albumId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.albumId,
                                referencedTable: $$SongTableReferences
                                    ._albumIdTable(db),
                                referencedColumn: $$SongTableReferences
                                    ._albumIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SongTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $SongTable,
      SongData,
      $$SongTableFilterComposer,
      $$SongTableOrderingComposer,
      $$SongTableAnnotationComposer,
      $$SongTableCreateCompanionBuilder,
      $$SongTableUpdateCompanionBuilder,
      (SongData, $$SongTableReferences),
      SongData,
      PrefetchHooks Function({bool albumId})
    >;
typedef $$SupplierTypeTableCreateCompanionBuilder =
    SupplierTypeCompanion Function({
      Value<int> id,
      required String code,
      required String name,
    });
typedef $$SupplierTypeTableUpdateCompanionBuilder =
    SupplierTypeCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
    });

final class $$SupplierTypeTableReferences
    extends
        BaseReferences<_$SharedDatabase, $SupplierTypeTable, SupplierTypeData> {
  $$SupplierTypeTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SupplierTable, List<SupplierData>>
  _supplierRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.supplier,
    aliasName: $_aliasNameGenerator(
      db.supplierType.id,
      db.supplier.supplierTypeId,
    ),
  );

  $$SupplierTableProcessedTableManager get supplierRefs {
    final manager = $$SupplierTableTableManager(
      $_db,
      $_db.supplier,
    ).filter((f) => f.supplierTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_supplierRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SupplierTypeTableFilterComposer
    extends Composer<_$SharedDatabase, $SupplierTypeTable> {
  $$SupplierTypeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> supplierRefs(
    Expression<bool> Function($$SupplierTableFilterComposer f) f,
  ) {
    final $$SupplierTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.supplier,
      getReferencedColumn: (t) => t.supplierTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableFilterComposer(
            $db: $db,
            $table: $db.supplier,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SupplierTypeTableOrderingComposer
    extends Composer<_$SharedDatabase, $SupplierTypeTable> {
  $$SupplierTypeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SupplierTypeTableAnnotationComposer
    extends Composer<_$SharedDatabase, $SupplierTypeTable> {
  $$SupplierTypeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> supplierRefs<T extends Object>(
    Expression<T> Function($$SupplierTableAnnotationComposer a) f,
  ) {
    final $$SupplierTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.supplier,
      getReferencedColumn: (t) => t.supplierTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableAnnotationComposer(
            $db: $db,
            $table: $db.supplier,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SupplierTypeTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $SupplierTypeTable,
          SupplierTypeData,
          $$SupplierTypeTableFilterComposer,
          $$SupplierTypeTableOrderingComposer,
          $$SupplierTypeTableAnnotationComposer,
          $$SupplierTypeTableCreateCompanionBuilder,
          $$SupplierTypeTableUpdateCompanionBuilder,
          (SupplierTypeData, $$SupplierTypeTableReferences),
          SupplierTypeData,
          PrefetchHooks Function({bool supplierRefs})
        > {
  $$SupplierTypeTableTableManager(_$SharedDatabase db, $SupplierTypeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplierTypeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SupplierTypeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SupplierTypeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => SupplierTypeCompanion(id: id, code: code, name: name),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
              }) =>
                  SupplierTypeCompanion.insert(id: id, code: code, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SupplierTypeTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplierRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (supplierRefs) db.supplier],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (supplierRefs)
                    await $_getPrefetchedData<
                      SupplierTypeData,
                      $SupplierTypeTable,
                      SupplierData
                    >(
                      currentTable: table,
                      referencedTable: $$SupplierTypeTableReferences
                          ._supplierRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SupplierTypeTableReferences(
                            db,
                            table,
                            p0,
                          ).supplierRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.supplierTypeId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SupplierTypeTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $SupplierTypeTable,
      SupplierTypeData,
      $$SupplierTypeTableFilterComposer,
      $$SupplierTypeTableOrderingComposer,
      $$SupplierTypeTableAnnotationComposer,
      $$SupplierTypeTableCreateCompanionBuilder,
      $$SupplierTypeTableUpdateCompanionBuilder,
      (SupplierTypeData, $$SupplierTypeTableReferences),
      SupplierTypeData,
      PrefetchHooks Function({bool supplierRefs})
    >;
typedef $$SupplierTableCreateCompanionBuilder =
    SupplierCompanion Function({
      Value<int> id,
      required String name,
      required bool active,
      required String email,
      Value<String?> address,
      Value<String?> phone,
      Value<String?> description,
      required int supplierTypeId,
      Value<String?> imagePath,
    });
typedef $$SupplierTableUpdateCompanionBuilder =
    SupplierCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<bool> active,
      Value<String> email,
      Value<String?> address,
      Value<String?> phone,
      Value<String?> description,
      Value<int> supplierTypeId,
      Value<String?> imagePath,
    });

final class $$SupplierTableReferences
    extends BaseReferences<_$SharedDatabase, $SupplierTable, SupplierData> {
  $$SupplierTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SupplierTypeTable _supplierTypeIdTable(_$SharedDatabase db) =>
      db.supplierType.createAlias(
        $_aliasNameGenerator(db.supplier.supplierTypeId, db.supplierType.id),
      );

  $$SupplierTypeTableProcessedTableManager get supplierTypeId {
    final $_column = $_itemColumn<int>('supplier_type_id')!;

    final manager = $$SupplierTypeTableTableManager(
      $_db,
      $_db.supplierType,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplierTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SupplierTableFilterComposer
    extends Composer<_$SharedDatabase, $SupplierTable> {
  $$SupplierTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  $$SupplierTypeTableFilterComposer get supplierTypeId {
    final $$SupplierTypeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierTypeId,
      referencedTable: $db.supplierType,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTypeTableFilterComposer(
            $db: $db,
            $table: $db.supplierType,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplierTableOrderingComposer
    extends Composer<_$SharedDatabase, $SupplierTable> {
  $$SupplierTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  $$SupplierTypeTableOrderingComposer get supplierTypeId {
    final $$SupplierTypeTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierTypeId,
      referencedTable: $db.supplierType,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTypeTableOrderingComposer(
            $db: $db,
            $table: $db.supplierType,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplierTableAnnotationComposer
    extends Composer<_$SharedDatabase, $SupplierTable> {
  $$SupplierTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  $$SupplierTypeTableAnnotationComposer get supplierTypeId {
    final $$SupplierTypeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierTypeId,
      referencedTable: $db.supplierType,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTypeTableAnnotationComposer(
            $db: $db,
            $table: $db.supplierType,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplierTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $SupplierTable,
          SupplierData,
          $$SupplierTableFilterComposer,
          $$SupplierTableOrderingComposer,
          $$SupplierTableAnnotationComposer,
          $$SupplierTableCreateCompanionBuilder,
          $$SupplierTableUpdateCompanionBuilder,
          (SupplierData, $$SupplierTableReferences),
          SupplierData,
          PrefetchHooks Function({bool supplierTypeId})
        > {
  $$SupplierTableTableManager(_$SharedDatabase db, $SupplierTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplierTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SupplierTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SupplierTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> supplierTypeId = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
              }) => SupplierCompanion(
                id: id,
                name: name,
                active: active,
                email: email,
                address: address,
                phone: phone,
                description: description,
                supplierTypeId: supplierTypeId,
                imagePath: imagePath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required bool active,
                required String email,
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> description = const Value.absent(),
                required int supplierTypeId,
                Value<String?> imagePath = const Value.absent(),
              }) => SupplierCompanion.insert(
                id: id,
                name: name,
                active: active,
                email: email,
                address: address,
                phone: phone,
                description: description,
                supplierTypeId: supplierTypeId,
                imagePath: imagePath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SupplierTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplierTypeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (supplierTypeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.supplierTypeId,
                                referencedTable: $$SupplierTableReferences
                                    ._supplierTypeIdTable(db),
                                referencedColumn: $$SupplierTableReferences
                                    ._supplierTypeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SupplierTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $SupplierTable,
      SupplierData,
      $$SupplierTableFilterComposer,
      $$SupplierTableOrderingComposer,
      $$SupplierTableAnnotationComposer,
      $$SupplierTableCreateCompanionBuilder,
      $$SupplierTableUpdateCompanionBuilder,
      (SupplierData, $$SupplierTableReferences),
      SupplierData,
      PrefetchHooks Function({bool supplierTypeId})
    >;
typedef $$SystemLogTableCreateCompanionBuilder =
    SystemLogCompanion Function({
      Value<int> id,
      required DateTime createDateTime,
      required String severity,
      required String content,
    });
typedef $$SystemLogTableUpdateCompanionBuilder =
    SystemLogCompanion Function({
      Value<int> id,
      Value<DateTime> createDateTime,
      Value<String> severity,
      Value<String> content,
    });

class $$SystemLogTableFilterComposer
    extends Composer<_$SharedDatabase, $SystemLogTable> {
  $$SystemLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createDateTime => $composableBuilder(
    column: $table.createDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SystemLogTableOrderingComposer
    extends Composer<_$SharedDatabase, $SystemLogTable> {
  $$SystemLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createDateTime => $composableBuilder(
    column: $table.createDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SystemLogTableAnnotationComposer
    extends Composer<_$SharedDatabase, $SystemLogTable> {
  $$SystemLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createDateTime => $composableBuilder(
    column: $table.createDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $$SystemLogTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $SystemLogTable,
          SystemLogData,
          $$SystemLogTableFilterComposer,
          $$SystemLogTableOrderingComposer,
          $$SystemLogTableAnnotationComposer,
          $$SystemLogTableCreateCompanionBuilder,
          $$SystemLogTableUpdateCompanionBuilder,
          (
            SystemLogData,
            BaseReferences<_$SharedDatabase, $SystemLogTable, SystemLogData>,
          ),
          SystemLogData,
          PrefetchHooks Function()
        > {
  $$SystemLogTableTableManager(_$SharedDatabase db, $SystemLogTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SystemLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SystemLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SystemLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createDateTime = const Value.absent(),
                Value<String> severity = const Value.absent(),
                Value<String> content = const Value.absent(),
              }) => SystemLogCompanion(
                id: id,
                createDateTime: createDateTime,
                severity: severity,
                content: content,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime createDateTime,
                required String severity,
                required String content,
              }) => SystemLogCompanion.insert(
                id: id,
                createDateTime: createDateTime,
                severity: severity,
                content: content,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SystemLogTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $SystemLogTable,
      SystemLogData,
      $$SystemLogTableFilterComposer,
      $$SystemLogTableOrderingComposer,
      $$SystemLogTableAnnotationComposer,
      $$SystemLogTableCreateCompanionBuilder,
      $$SystemLogTableUpdateCompanionBuilder,
      (
        SystemLogData,
        BaseReferences<_$SharedDatabase, $SystemLogTable, SystemLogData>,
      ),
      SystemLogData,
      PrefetchHooks Function()
    >;
typedef $$TeacherPositionTableCreateCompanionBuilder =
    TeacherPositionCompanion Function({
      required String id,
      required String name,
      Value<int> rowid,
    });
typedef $$TeacherPositionTableUpdateCompanionBuilder =
    TeacherPositionCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> rowid,
    });

final class $$TeacherPositionTableReferences
    extends
        BaseReferences<
          _$SharedDatabase,
          $TeacherPositionTable,
          TeacherPositionData
        > {
  $$TeacherPositionTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TeacherTable, List<TeacherData>>
  _teacherRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.teacher,
    aliasName: $_aliasNameGenerator(
      db.teacherPosition.id,
      db.teacher.teacherPositionId,
    ),
  );

  $$TeacherTableProcessedTableManager get teacherRefs {
    final manager = $$TeacherTableTableManager($_db, $_db.teacher).filter(
      (f) => f.teacherPositionId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_teacherRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TeacherPositionTableFilterComposer
    extends Composer<_$SharedDatabase, $TeacherPositionTable> {
  $$TeacherPositionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> teacherRefs(
    Expression<bool> Function($$TeacherTableFilterComposer f) f,
  ) {
    final $$TeacherTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.teacherPositionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherTableFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TeacherPositionTableOrderingComposer
    extends Composer<_$SharedDatabase, $TeacherPositionTable> {
  $$TeacherPositionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TeacherPositionTableAnnotationComposer
    extends Composer<_$SharedDatabase, $TeacherPositionTable> {
  $$TeacherPositionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> teacherRefs<T extends Object>(
    Expression<T> Function($$TeacherTableAnnotationComposer a) f,
  ) {
    final $$TeacherTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.teacherPositionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherTableAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TeacherPositionTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $TeacherPositionTable,
          TeacherPositionData,
          $$TeacherPositionTableFilterComposer,
          $$TeacherPositionTableOrderingComposer,
          $$TeacherPositionTableAnnotationComposer,
          $$TeacherPositionTableCreateCompanionBuilder,
          $$TeacherPositionTableUpdateCompanionBuilder,
          (TeacherPositionData, $$TeacherPositionTableReferences),
          TeacherPositionData,
          PrefetchHooks Function({bool teacherRefs})
        > {
  $$TeacherPositionTableTableManager(
    _$SharedDatabase db,
    $TeacherPositionTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeacherPositionTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeacherPositionTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeacherPositionTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TeacherPositionCompanion(id: id, name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => TeacherPositionCompanion.insert(
                id: id,
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TeacherPositionTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({teacherRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (teacherRefs) db.teacher],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (teacherRefs)
                    await $_getPrefetchedData<
                      TeacherPositionData,
                      $TeacherPositionTable,
                      TeacherData
                    >(
                      currentTable: table,
                      referencedTable: $$TeacherPositionTableReferences
                          ._teacherRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TeacherPositionTableReferences(
                            db,
                            table,
                            p0,
                          ).teacherRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.teacherPositionId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TeacherPositionTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $TeacherPositionTable,
      TeacherPositionData,
      $$TeacherPositionTableFilterComposer,
      $$TeacherPositionTableOrderingComposer,
      $$TeacherPositionTableAnnotationComposer,
      $$TeacherPositionTableCreateCompanionBuilder,
      $$TeacherPositionTableUpdateCompanionBuilder,
      (TeacherPositionData, $$TeacherPositionTableReferences),
      TeacherPositionData,
      PrefetchHooks Function({bool teacherRefs})
    >;
typedef $$UniversityTableCreateCompanionBuilder =
    UniversityCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      required String nameInEnglish,
      required bool active,
      required bool locked,
      Value<String?> imagePath,
      Value<String?> description,
      Value<String?> note,
    });
typedef $$UniversityTableUpdateCompanionBuilder =
    UniversityCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<String> nameInEnglish,
      Value<bool> active,
      Value<bool> locked,
      Value<String?> imagePath,
      Value<String?> description,
      Value<String?> note,
    });

final class $$UniversityTableReferences
    extends BaseReferences<_$SharedDatabase, $UniversityTable, UniversityData> {
  $$UniversityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TeacherTable, List<TeacherData>>
  _teacherRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.teacher,
    aliasName: $_aliasNameGenerator(db.university.id, db.teacher.universityId),
  );

  $$TeacherTableProcessedTableManager get teacherRefs {
    final manager = $$TeacherTableTableManager(
      $_db,
      $_db.teacher,
    ).filter((f) => f.universityId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_teacherRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UniversityTableFilterComposer
    extends Composer<_$SharedDatabase, $UniversityTable> {
  $$UniversityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameInEnglish => $composableBuilder(
    column: $table.nameInEnglish,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> teacherRefs(
    Expression<bool> Function($$TeacherTableFilterComposer f) f,
  ) {
    final $$TeacherTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.universityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherTableFilterComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UniversityTableOrderingComposer
    extends Composer<_$SharedDatabase, $UniversityTable> {
  $$UniversityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameInEnglish => $composableBuilder(
    column: $table.nameInEnglish,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UniversityTableAnnotationComposer
    extends Composer<_$SharedDatabase, $UniversityTable> {
  $$UniversityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get nameInEnglish => $composableBuilder(
    column: $table.nameInEnglish,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<bool> get locked =>
      $composableBuilder(column: $table.locked, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  Expression<T> teacherRefs<T extends Object>(
    Expression<T> Function($$TeacherTableAnnotationComposer a) f,
  ) {
    final $$TeacherTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.teacher,
      getReferencedColumn: (t) => t.universityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherTableAnnotationComposer(
            $db: $db,
            $table: $db.teacher,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UniversityTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $UniversityTable,
          UniversityData,
          $$UniversityTableFilterComposer,
          $$UniversityTableOrderingComposer,
          $$UniversityTableAnnotationComposer,
          $$UniversityTableCreateCompanionBuilder,
          $$UniversityTableUpdateCompanionBuilder,
          (UniversityData, $$UniversityTableReferences),
          UniversityData,
          PrefetchHooks Function({bool teacherRefs})
        > {
  $$UniversityTableTableManager(_$SharedDatabase db, $UniversityTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UniversityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UniversityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UniversityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> nameInEnglish = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<bool> locked = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => UniversityCompanion(
                id: id,
                code: code,
                name: name,
                nameInEnglish: nameInEnglish,
                active: active,
                locked: locked,
                imagePath: imagePath,
                description: description,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                required String nameInEnglish,
                required bool active,
                required bool locked,
                Value<String?> imagePath = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => UniversityCompanion.insert(
                id: id,
                code: code,
                name: name,
                nameInEnglish: nameInEnglish,
                active: active,
                locked: locked,
                imagePath: imagePath,
                description: description,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UniversityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({teacherRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (teacherRefs) db.teacher],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (teacherRefs)
                    await $_getPrefetchedData<
                      UniversityData,
                      $UniversityTable,
                      TeacherData
                    >(
                      currentTable: table,
                      referencedTable: $$UniversityTableReferences
                          ._teacherRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UniversityTableReferences(
                            db,
                            table,
                            p0,
                          ).teacherRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.universityId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UniversityTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $UniversityTable,
      UniversityData,
      $$UniversityTableFilterComposer,
      $$UniversityTableOrderingComposer,
      $$UniversityTableAnnotationComposer,
      $$UniversityTableCreateCompanionBuilder,
      $$UniversityTableUpdateCompanionBuilder,
      (UniversityData, $$UniversityTableReferences),
      UniversityData,
      PrefetchHooks Function({bool teacherRefs})
    >;
typedef $$TeacherTableCreateCompanionBuilder =
    TeacherCompanion Function({
      Value<int> id,
      required String fullName,
      required DateTime birthday,
      required String genderId,
      required String teacherPositionId,
      required bool locked,
      required bool active,
      required int universityId,
      Value<String?> countryId,
      Value<String?> youtubeVideoCode,
      required String email,
      Value<String?> skype,
      Value<String?> facebook,
      Value<String?> phoneNumber,
      Value<String?> description,
      Value<String?> note,
      Value<String?> imagePath,
    });
typedef $$TeacherTableUpdateCompanionBuilder =
    TeacherCompanion Function({
      Value<int> id,
      Value<String> fullName,
      Value<DateTime> birthday,
      Value<String> genderId,
      Value<String> teacherPositionId,
      Value<bool> locked,
      Value<bool> active,
      Value<int> universityId,
      Value<String?> countryId,
      Value<String?> youtubeVideoCode,
      Value<String> email,
      Value<String?> skype,
      Value<String?> facebook,
      Value<String?> phoneNumber,
      Value<String?> description,
      Value<String?> note,
      Value<String?> imagePath,
    });

final class $$TeacherTableReferences
    extends BaseReferences<_$SharedDatabase, $TeacherTable, TeacherData> {
  $$TeacherTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GenderTable _genderIdTable(_$SharedDatabase db) => db.gender
      .createAlias($_aliasNameGenerator(db.teacher.genderId, db.gender.id));

  $$GenderTableProcessedTableManager get genderId {
    final $_column = $_itemColumn<String>('gender_id')!;

    final manager = $$GenderTableTableManager(
      $_db,
      $_db.gender,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_genderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TeacherPositionTable _teacherPositionIdTable(_$SharedDatabase db) =>
      db.teacherPosition.createAlias(
        $_aliasNameGenerator(
          db.teacher.teacherPositionId,
          db.teacherPosition.id,
        ),
      );

  $$TeacherPositionTableProcessedTableManager get teacherPositionId {
    final $_column = $_itemColumn<String>('teacher_position_id')!;

    final manager = $$TeacherPositionTableTableManager(
      $_db,
      $_db.teacherPosition,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teacherPositionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UniversityTable _universityIdTable(_$SharedDatabase db) =>
      db.university.createAlias(
        $_aliasNameGenerator(db.teacher.universityId, db.university.id),
      );

  $$UniversityTableProcessedTableManager get universityId {
    final $_column = $_itemColumn<int>('university_id')!;

    final manager = $$UniversityTableTableManager(
      $_db,
      $_db.university,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_universityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CountryTable _countryIdTable(_$SharedDatabase db) => db.country
      .createAlias($_aliasNameGenerator(db.teacher.countryId, db.country.id));

  $$CountryTableProcessedTableManager? get countryId {
    final $_column = $_itemColumn<String>('country_id');
    if ($_column == null) return null;
    final manager = $$CountryTableTableManager(
      $_db,
      $_db.country,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_countryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TeacherTableFilterComposer
    extends Composer<_$SharedDatabase, $TeacherTable> {
  $$TeacherTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthday => $composableBuilder(
    column: $table.birthday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get youtubeVideoCode => $composableBuilder(
    column: $table.youtubeVideoCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get skype => $composableBuilder(
    column: $table.skype,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get facebook => $composableBuilder(
    column: $table.facebook,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  $$GenderTableFilterComposer get genderId {
    final $$GenderTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.genderId,
      referencedTable: $db.gender,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GenderTableFilterComposer(
            $db: $db,
            $table: $db.gender,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeacherPositionTableFilterComposer get teacherPositionId {
    final $$TeacherPositionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherPositionId,
      referencedTable: $db.teacherPosition,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherPositionTableFilterComposer(
            $db: $db,
            $table: $db.teacherPosition,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UniversityTableFilterComposer get universityId {
    final $$UniversityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universityId,
      referencedTable: $db.university,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversityTableFilterComposer(
            $db: $db,
            $table: $db.university,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CountryTableFilterComposer get countryId {
    final $$CountryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.country,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountryTableFilterComposer(
            $db: $db,
            $table: $db.country,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TeacherTableOrderingComposer
    extends Composer<_$SharedDatabase, $TeacherTable> {
  $$TeacherTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthday => $composableBuilder(
    column: $table.birthday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get locked => $composableBuilder(
    column: $table.locked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get youtubeVideoCode => $composableBuilder(
    column: $table.youtubeVideoCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get skype => $composableBuilder(
    column: $table.skype,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get facebook => $composableBuilder(
    column: $table.facebook,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  $$GenderTableOrderingComposer get genderId {
    final $$GenderTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.genderId,
      referencedTable: $db.gender,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GenderTableOrderingComposer(
            $db: $db,
            $table: $db.gender,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeacherPositionTableOrderingComposer get teacherPositionId {
    final $$TeacherPositionTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherPositionId,
      referencedTable: $db.teacherPosition,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherPositionTableOrderingComposer(
            $db: $db,
            $table: $db.teacherPosition,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UniversityTableOrderingComposer get universityId {
    final $$UniversityTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universityId,
      referencedTable: $db.university,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversityTableOrderingComposer(
            $db: $db,
            $table: $db.university,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CountryTableOrderingComposer get countryId {
    final $$CountryTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.country,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountryTableOrderingComposer(
            $db: $db,
            $table: $db.country,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TeacherTableAnnotationComposer
    extends Composer<_$SharedDatabase, $TeacherTable> {
  $$TeacherTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<DateTime> get birthday =>
      $composableBuilder(column: $table.birthday, builder: (column) => column);

  GeneratedColumn<bool> get locked =>
      $composableBuilder(column: $table.locked, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<String> get youtubeVideoCode => $composableBuilder(
    column: $table.youtubeVideoCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get skype =>
      $composableBuilder(column: $table.skype, builder: (column) => column);

  GeneratedColumn<String> get facebook =>
      $composableBuilder(column: $table.facebook, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  $$GenderTableAnnotationComposer get genderId {
    final $$GenderTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.genderId,
      referencedTable: $db.gender,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GenderTableAnnotationComposer(
            $db: $db,
            $table: $db.gender,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeacherPositionTableAnnotationComposer get teacherPositionId {
    final $$TeacherPositionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherPositionId,
      referencedTable: $db.teacherPosition,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeacherPositionTableAnnotationComposer(
            $db: $db,
            $table: $db.teacherPosition,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UniversityTableAnnotationComposer get universityId {
    final $$UniversityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universityId,
      referencedTable: $db.university,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversityTableAnnotationComposer(
            $db: $db,
            $table: $db.university,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CountryTableAnnotationComposer get countryId {
    final $$CountryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countryId,
      referencedTable: $db.country,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountryTableAnnotationComposer(
            $db: $db,
            $table: $db.country,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TeacherTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $TeacherTable,
          TeacherData,
          $$TeacherTableFilterComposer,
          $$TeacherTableOrderingComposer,
          $$TeacherTableAnnotationComposer,
          $$TeacherTableCreateCompanionBuilder,
          $$TeacherTableUpdateCompanionBuilder,
          (TeacherData, $$TeacherTableReferences),
          TeacherData,
          PrefetchHooks Function({
            bool genderId,
            bool teacherPositionId,
            bool universityId,
            bool countryId,
          })
        > {
  $$TeacherTableTableManager(_$SharedDatabase db, $TeacherTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeacherTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeacherTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeacherTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<DateTime> birthday = const Value.absent(),
                Value<String> genderId = const Value.absent(),
                Value<String> teacherPositionId = const Value.absent(),
                Value<bool> locked = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> universityId = const Value.absent(),
                Value<String?> countryId = const Value.absent(),
                Value<String?> youtubeVideoCode = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String?> skype = const Value.absent(),
                Value<String?> facebook = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
              }) => TeacherCompanion(
                id: id,
                fullName: fullName,
                birthday: birthday,
                genderId: genderId,
                teacherPositionId: teacherPositionId,
                locked: locked,
                active: active,
                universityId: universityId,
                countryId: countryId,
                youtubeVideoCode: youtubeVideoCode,
                email: email,
                skype: skype,
                facebook: facebook,
                phoneNumber: phoneNumber,
                description: description,
                note: note,
                imagePath: imagePath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String fullName,
                required DateTime birthday,
                required String genderId,
                required String teacherPositionId,
                required bool locked,
                required bool active,
                required int universityId,
                Value<String?> countryId = const Value.absent(),
                Value<String?> youtubeVideoCode = const Value.absent(),
                required String email,
                Value<String?> skype = const Value.absent(),
                Value<String?> facebook = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
              }) => TeacherCompanion.insert(
                id: id,
                fullName: fullName,
                birthday: birthday,
                genderId: genderId,
                teacherPositionId: teacherPositionId,
                locked: locked,
                active: active,
                universityId: universityId,
                countryId: countryId,
                youtubeVideoCode: youtubeVideoCode,
                email: email,
                skype: skype,
                facebook: facebook,
                phoneNumber: phoneNumber,
                description: description,
                note: note,
                imagePath: imagePath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TeacherTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                genderId = false,
                teacherPositionId = false,
                universityId = false,
                countryId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (genderId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.genderId,
                                    referencedTable: $$TeacherTableReferences
                                        ._genderIdTable(db),
                                    referencedColumn: $$TeacherTableReferences
                                        ._genderIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (teacherPositionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.teacherPositionId,
                                    referencedTable: $$TeacherTableReferences
                                        ._teacherPositionIdTable(db),
                                    referencedColumn: $$TeacherTableReferences
                                        ._teacherPositionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (universityId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.universityId,
                                    referencedTable: $$TeacherTableReferences
                                        ._universityIdTable(db),
                                    referencedColumn: $$TeacherTableReferences
                                        ._universityIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (countryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.countryId,
                                    referencedTable: $$TeacherTableReferences
                                        ._countryIdTable(db),
                                    referencedColumn: $$TeacherTableReferences
                                        ._countryIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$TeacherTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $TeacherTable,
      TeacherData,
      $$TeacherTableFilterComposer,
      $$TeacherTableOrderingComposer,
      $$TeacherTableAnnotationComposer,
      $$TeacherTableCreateCompanionBuilder,
      $$TeacherTableUpdateCompanionBuilder,
      (TeacherData, $$TeacherTableReferences),
      TeacherData,
      PrefetchHooks Function({
        bool genderId,
        bool teacherPositionId,
        bool universityId,
        bool countryId,
      })
    >;
typedef $$ProjectTableCreateCompanionBuilder =
    ProjectCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      Value<String?> description,
      Value<String?> note,
    });
typedef $$ProjectTableUpdateCompanionBuilder =
    ProjectCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<String?> description,
      Value<String?> note,
    });

final class $$ProjectTableReferences
    extends BaseReferences<_$SharedDatabase, $ProjectTable, ProjectData> {
  $$ProjectTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ContributorTable, List<ContributorData>>
  _contributorRefsTable(_$SharedDatabase db) => MultiTypedResultKey.fromTable(
    db.contributor,
    aliasName: $_aliasNameGenerator(db.project.id, db.contributor.projectId),
  );

  $$ContributorTableProcessedTableManager get contributorRefs {
    final manager = $$ContributorTableTableManager(
      $_db,
      $_db.contributor,
    ).filter((f) => f.projectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_contributorRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProjectTableFilterComposer
    extends Composer<_$SharedDatabase, $ProjectTable> {
  $$ProjectTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> contributorRefs(
    Expression<bool> Function($$ContributorTableFilterComposer f) f,
  ) {
    final $$ContributorTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contributor,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContributorTableFilterComposer(
            $db: $db,
            $table: $db.contributor,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectTableOrderingComposer
    extends Composer<_$SharedDatabase, $ProjectTable> {
  $$ProjectTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProjectTableAnnotationComposer
    extends Composer<_$SharedDatabase, $ProjectTable> {
  $$ProjectTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  Expression<T> contributorRefs<T extends Object>(
    Expression<T> Function($$ContributorTableAnnotationComposer a) f,
  ) {
    final $$ContributorTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contributor,
      getReferencedColumn: (t) => t.projectId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContributorTableAnnotationComposer(
            $db: $db,
            $table: $db.contributor,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $ProjectTable,
          ProjectData,
          $$ProjectTableFilterComposer,
          $$ProjectTableOrderingComposer,
          $$ProjectTableAnnotationComposer,
          $$ProjectTableCreateCompanionBuilder,
          $$ProjectTableUpdateCompanionBuilder,
          (ProjectData, $$ProjectTableReferences),
          ProjectData,
          PrefetchHooks Function({bool contributorRefs})
        > {
  $$ProjectTableTableManager(_$SharedDatabase db, $ProjectTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => ProjectCompanion(
                id: id,
                code: code,
                name: name,
                description: description,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => ProjectCompanion.insert(
                id: id,
                code: code,
                name: name,
                description: description,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProjectTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({contributorRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (contributorRefs) db.contributor],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (contributorRefs)
                    await $_getPrefetchedData<
                      ProjectData,
                      $ProjectTable,
                      ContributorData
                    >(
                      currentTable: table,
                      referencedTable: $$ProjectTableReferences
                          ._contributorRefsTable(db),
                      managerFromTypedResult: (p0) => $$ProjectTableReferences(
                        db,
                        table,
                        p0,
                      ).contributorRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.projectId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProjectTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $ProjectTable,
      ProjectData,
      $$ProjectTableFilterComposer,
      $$ProjectTableOrderingComposer,
      $$ProjectTableAnnotationComposer,
      $$ProjectTableCreateCompanionBuilder,
      $$ProjectTableUpdateCompanionBuilder,
      (ProjectData, $$ProjectTableReferences),
      ProjectData,
      PrefetchHooks Function({bool contributorRefs})
    >;
typedef $$ContributorTableCreateCompanionBuilder =
    ContributorCompanion Function({
      Value<int> id,
      required int projectId,
      required int appUserId,
    });
typedef $$ContributorTableUpdateCompanionBuilder =
    ContributorCompanion Function({
      Value<int> id,
      Value<int> projectId,
      Value<int> appUserId,
    });

final class $$ContributorTableReferences
    extends
        BaseReferences<_$SharedDatabase, $ContributorTable, ContributorData> {
  $$ContributorTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectTable _projectIdTable(_$SharedDatabase db) =>
      db.project.createAlias(
        $_aliasNameGenerator(db.contributor.projectId, db.project.id),
      );

  $$ProjectTableProcessedTableManager get projectId {
    final $_column = $_itemColumn<int>('project_id')!;

    final manager = $$ProjectTableTableManager(
      $_db,
      $_db.project,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AppUserTable _appUserIdTable(_$SharedDatabase db) =>
      db.appUser.createAlias(
        $_aliasNameGenerator(db.contributor.appUserId, db.appUser.id),
      );

  $$AppUserTableProcessedTableManager get appUserId {
    final $_column = $_itemColumn<int>('app_user_id')!;

    final manager = $$AppUserTableTableManager(
      $_db,
      $_db.appUser,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_appUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ContributorTableFilterComposer
    extends Composer<_$SharedDatabase, $ContributorTable> {
  $$ContributorTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectTableFilterComposer get projectId {
    final $$ProjectTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.project,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectTableFilterComposer(
            $db: $db,
            $table: $db.project,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AppUserTableFilterComposer get appUserId {
    final $$AppUserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appUserId,
      referencedTable: $db.appUser,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableFilterComposer(
            $db: $db,
            $table: $db.appUser,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContributorTableOrderingComposer
    extends Composer<_$SharedDatabase, $ContributorTable> {
  $$ContributorTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectTableOrderingComposer get projectId {
    final $$ProjectTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.project,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectTableOrderingComposer(
            $db: $db,
            $table: $db.project,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AppUserTableOrderingComposer get appUserId {
    final $$AppUserTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appUserId,
      referencedTable: $db.appUser,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableOrderingComposer(
            $db: $db,
            $table: $db.appUser,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContributorTableAnnotationComposer
    extends Composer<_$SharedDatabase, $ContributorTable> {
  $$ContributorTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$ProjectTableAnnotationComposer get projectId {
    final $$ProjectTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectId,
      referencedTable: $db.project,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectTableAnnotationComposer(
            $db: $db,
            $table: $db.project,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AppUserTableAnnotationComposer get appUserId {
    final $$AppUserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appUserId,
      referencedTable: $db.appUser,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppUserTableAnnotationComposer(
            $db: $db,
            $table: $db.appUser,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContributorTableTableManager
    extends
        RootTableManager<
          _$SharedDatabase,
          $ContributorTable,
          ContributorData,
          $$ContributorTableFilterComposer,
          $$ContributorTableOrderingComposer,
          $$ContributorTableAnnotationComposer,
          $$ContributorTableCreateCompanionBuilder,
          $$ContributorTableUpdateCompanionBuilder,
          (ContributorData, $$ContributorTableReferences),
          ContributorData,
          PrefetchHooks Function({bool projectId, bool appUserId})
        > {
  $$ContributorTableTableManager(_$SharedDatabase db, $ContributorTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContributorTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContributorTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContributorTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> projectId = const Value.absent(),
                Value<int> appUserId = const Value.absent(),
              }) => ContributorCompanion(
                id: id,
                projectId: projectId,
                appUserId: appUserId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int projectId,
                required int appUserId,
              }) => ContributorCompanion.insert(
                id: id,
                projectId: projectId,
                appUserId: appUserId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ContributorTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({projectId = false, appUserId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (projectId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.projectId,
                                referencedTable: $$ContributorTableReferences
                                    ._projectIdTable(db),
                                referencedColumn: $$ContributorTableReferences
                                    ._projectIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (appUserId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.appUserId,
                                referencedTable: $$ContributorTableReferences
                                    ._appUserIdTable(db),
                                referencedColumn: $$ContributorTableReferences
                                    ._appUserIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ContributorTableProcessedTableManager =
    ProcessedTableManager<
      _$SharedDatabase,
      $ContributorTable,
      ContributorData,
      $$ContributorTableFilterComposer,
      $$ContributorTableOrderingComposer,
      $$ContributorTableAnnotationComposer,
      $$ContributorTableCreateCompanionBuilder,
      $$ContributorTableUpdateCompanionBuilder,
      (ContributorData, $$ContributorTableReferences),
      ContributorData,
      PrefetchHooks Function({bool projectId, bool appUserId})
    >;

class $SharedDatabaseManager {
  final _$SharedDatabase _db;
  $SharedDatabaseManager(this._db);
  $$AlbumTableTableManager get album =>
      $$AlbumTableTableManager(_db, _db.album);
  $$EmployeePositionTableTableManager get employeePosition =>
      $$EmployeePositionTableTableManager(_db, _db.employeePosition);
  $$CompanyTableTableManager get company =>
      $$CompanyTableTableManager(_db, _db.company);
  $$DepartmentTableTableManager get department =>
      $$DepartmentTableTableManager(_db, _db.department);
  $$EmployeeTableTableManager get employee =>
      $$EmployeeTableTableManager(_db, _db.employee);
  $$AppUserTableTableManager get appUser =>
      $$AppUserTableTableManager(_db, _db.appUser);
  $$BookTableTableManager get book => $$BookTableTableManager(_db, _db.book);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db, _db.category);
  $$CountryTableTableManager get country =>
      $$CountryTableTableManager(_db, _db.country);
  $$CouponTypeTableTableManager get couponType =>
      $$CouponTypeTableTableManager(_db, _db.couponType);
  $$CouponTableTableManager get coupon =>
      $$CouponTableTableManager(_db, _db.coupon);
  $$CurrencyTableTableManager get currency =>
      $$CurrencyTableTableManager(_db, _db.currency);
  $$CustomerTableTableManager get customer =>
      $$CustomerTableTableManager(_db, _db.customer);
  $$EmploymentHistoryTableTableManager get employmentHistory =>
      $$EmploymentHistoryTableTableManager(_db, _db.employmentHistory);
  $$FootballPlayerTableTableManager get footballPlayer =>
      $$FootballPlayerTableTableManager(_db, _db.footballPlayer);
  $$GenderTableTableManager get gender =>
      $$GenderTableTableManager(_db, _db.gender);
  $$LanguageTableTableManager get language =>
      $$LanguageTableTableManager(_db, _db.language);
  $$LessonTableTableManager get lesson =>
      $$LessonTableTableManager(_db, _db.lesson);
  $$NoteTableTableManager get note => $$NoteTableTableManager(_db, _db.note);
  $$NotificationMessageTableTableManager get notificationMessage =>
      $$NotificationMessageTableTableManager(_db, _db.notificationMessage);
  $$PaymentGatewayTableTableManager get paymentGateway =>
      $$PaymentGatewayTableTableManager(_db, _db.paymentGateway);
  $$ProductTableTableManager get product =>
      $$ProductTableTableManager(_db, _db.product);
  $$SalesOrderTableTableManager get salesOrder =>
      $$SalesOrderTableTableManager(_db, _db.salesOrder);
  $$SalesOrderLineTableTableManager get salesOrderLine =>
      $$SalesOrderLineTableTableManager(_db, _db.salesOrderLine);
  $$SongTableTableManager get song => $$SongTableTableManager(_db, _db.song);
  $$SupplierTypeTableTableManager get supplierType =>
      $$SupplierTypeTableTableManager(_db, _db.supplierType);
  $$SupplierTableTableManager get supplier =>
      $$SupplierTableTableManager(_db, _db.supplier);
  $$SystemLogTableTableManager get systemLog =>
      $$SystemLogTableTableManager(_db, _db.systemLog);
  $$TeacherPositionTableTableManager get teacherPosition =>
      $$TeacherPositionTableTableManager(_db, _db.teacherPosition);
  $$UniversityTableTableManager get university =>
      $$UniversityTableTableManager(_db, _db.university);
  $$TeacherTableTableManager get teacher =>
      $$TeacherTableTableManager(_db, _db.teacher);
  $$ProjectTableTableManager get project =>
      $$ProjectTableTableManager(_db, _db.project);
  $$ContributorTableTableManager get contributor =>
      $$ContributorTableTableManager(_db, _db.contributor);
}

mixin _$BestSellingDAOMixin on DatabaseAccessor<SharedDatabase> {
  $EmployeePositionTable get employeePosition =>
      attachedDatabase.employeePosition;
  $CompanyTable get company => attachedDatabase.company;
  $DepartmentTable get department => attachedDatabase.department;
  $EmployeeTable get employee => attachedDatabase.employee;
  $CustomerTable get customer => attachedDatabase.customer;
  $SalesOrderTable get salesOrder => attachedDatabase.salesOrder;
  $CategoryTable get category => attachedDatabase.category;
  $ProductTable get product => attachedDatabase.product;
  $SalesOrderLineTable get salesOrderLine => attachedDatabase.salesOrderLine;
  BestSellingDAOManager get managers => BestSellingDAOManager(this);
}

class BestSellingDAOManager {
  final _$BestSellingDAOMixin _db;
  BestSellingDAOManager(this._db);
  $$EmployeePositionTableTableManager get employeePosition =>
      $$EmployeePositionTableTableManager(
        _db.attachedDatabase,
        _db.employeePosition,
      );
  $$CompanyTableTableManager get company =>
      $$CompanyTableTableManager(_db.attachedDatabase, _db.company);
  $$DepartmentTableTableManager get department =>
      $$DepartmentTableTableManager(_db.attachedDatabase, _db.department);
  $$EmployeeTableTableManager get employee =>
      $$EmployeeTableTableManager(_db.attachedDatabase, _db.employee);
  $$CustomerTableTableManager get customer =>
      $$CustomerTableTableManager(_db.attachedDatabase, _db.customer);
  $$SalesOrderTableTableManager get salesOrder =>
      $$SalesOrderTableTableManager(_db.attachedDatabase, _db.salesOrder);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db.attachedDatabase, _db.category);
  $$ProductTableTableManager get product =>
      $$ProductTableTableManager(_db.attachedDatabase, _db.product);
  $$SalesOrderLineTableTableManager get salesOrderLine =>
      $$SalesOrderLineTableTableManager(
        _db.attachedDatabase,
        _db.salesOrderLine,
      );
}

mixin _$SupplierDAOMixin on DatabaseAccessor<SharedDatabase> {
  $SupplierTypeTable get supplierType => attachedDatabase.supplierType;
  $SupplierTable get supplier => attachedDatabase.supplier;
  SupplierDAOManager get managers => SupplierDAOManager(this);
}

class SupplierDAOManager {
  final _$SupplierDAOMixin _db;
  SupplierDAOManager(this._db);
  $$SupplierTypeTableTableManager get supplierType =>
      $$SupplierTypeTableTableManager(_db.attachedDatabase, _db.supplierType);
  $$SupplierTableTableManager get supplier =>
      $$SupplierTableTableManager(_db.attachedDatabase, _db.supplier);
}

mixin _$SupplierTypeDAOMixin on DatabaseAccessor<SharedDatabase> {
  $SupplierTypeTable get supplierType => attachedDatabase.supplierType;
  SupplierTypeDAOManager get managers => SupplierTypeDAOManager(this);
}

class SupplierTypeDAOManager {
  final _$SupplierTypeDAOMixin _db;
  SupplierTypeDAOManager(this._db);
  $$SupplierTypeTableTableManager get supplierType =>
      $$SupplierTypeTableTableManager(_db.attachedDatabase, _db.supplierType);
}

mixin _$AlbumDAOMixin on DatabaseAccessor<SharedDatabase> {
  $AlbumTable get album => attachedDatabase.album;
  AlbumDAOManager get managers => AlbumDAOManager(this);
}

class AlbumDAOManager {
  final _$AlbumDAOMixin _db;
  AlbumDAOManager(this._db);
  $$AlbumTableTableManager get album =>
      $$AlbumTableTableManager(_db.attachedDatabase, _db.album);
}

mixin _$BookDAOMixin on DatabaseAccessor<SharedDatabase> {
  $BookTable get book => attachedDatabase.book;
  BookDAOManager get managers => BookDAOManager(this);
}

class BookDAOManager {
  final _$BookDAOMixin _db;
  BookDAOManager(this._db);
  $$BookTableTableManager get book =>
      $$BookTableTableManager(_db.attachedDatabase, _db.book);
}

mixin _$CategoryDAOMixin on DatabaseAccessor<SharedDatabase> {
  $CategoryTable get category => attachedDatabase.category;
  CategoryDAOManager get managers => CategoryDAOManager(this);
}

class CategoryDAOManager {
  final _$CategoryDAOMixin _db;
  CategoryDAOManager(this._db);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db.attachedDatabase, _db.category);
}

mixin _$AppUserDAOMixin on DatabaseAccessor<SharedDatabase> {
  $EmployeePositionTable get employeePosition =>
      attachedDatabase.employeePosition;
  $CompanyTable get company => attachedDatabase.company;
  $DepartmentTable get department => attachedDatabase.department;
  $EmployeeTable get employee => attachedDatabase.employee;
  $AppUserTable get appUser => attachedDatabase.appUser;
  AppUserDAOManager get managers => AppUserDAOManager(this);
}

class AppUserDAOManager {
  final _$AppUserDAOMixin _db;
  AppUserDAOManager(this._db);
  $$EmployeePositionTableTableManager get employeePosition =>
      $$EmployeePositionTableTableManager(
        _db.attachedDatabase,
        _db.employeePosition,
      );
  $$CompanyTableTableManager get company =>
      $$CompanyTableTableManager(_db.attachedDatabase, _db.company);
  $$DepartmentTableTableManager get department =>
      $$DepartmentTableTableManager(_db.attachedDatabase, _db.department);
  $$EmployeeTableTableManager get employee =>
      $$EmployeeTableTableManager(_db.attachedDatabase, _db.employee);
  $$AppUserTableTableManager get appUser =>
      $$AppUserTableTableManager(_db.attachedDatabase, _db.appUser);
}

mixin _$CompanyDAOMixin on DatabaseAccessor<SharedDatabase> {
  $CompanyTable get company => attachedDatabase.company;
  CompanyDAOManager get managers => CompanyDAOManager(this);
}

class CompanyDAOManager {
  final _$CompanyDAOMixin _db;
  CompanyDAOManager(this._db);
  $$CompanyTableTableManager get company =>
      $$CompanyTableTableManager(_db.attachedDatabase, _db.company);
}

mixin _$CountryDAOMixin on DatabaseAccessor<SharedDatabase> {
  $CountryTable get country => attachedDatabase.country;
  CountryDAOManager get managers => CountryDAOManager(this);
}

class CountryDAOManager {
  final _$CountryDAOMixin _db;
  CountryDAOManager(this._db);
  $$CountryTableTableManager get country =>
      $$CountryTableTableManager(_db.attachedDatabase, _db.country);
}

mixin _$CouponDAOMixin on DatabaseAccessor<SharedDatabase> {
  $CouponTypeTable get couponType => attachedDatabase.couponType;
  $CouponTable get coupon => attachedDatabase.coupon;
  CouponDAOManager get managers => CouponDAOManager(this);
}

class CouponDAOManager {
  final _$CouponDAOMixin _db;
  CouponDAOManager(this._db);
  $$CouponTypeTableTableManager get couponType =>
      $$CouponTypeTableTableManager(_db.attachedDatabase, _db.couponType);
  $$CouponTableTableManager get coupon =>
      $$CouponTableTableManager(_db.attachedDatabase, _db.coupon);
}

mixin _$CouponTypeDAOMixin on DatabaseAccessor<SharedDatabase> {
  $CouponTypeTable get couponType => attachedDatabase.couponType;
  CouponTypeDAOManager get managers => CouponTypeDAOManager(this);
}

class CouponTypeDAOManager {
  final _$CouponTypeDAOMixin _db;
  CouponTypeDAOManager(this._db);
  $$CouponTypeTableTableManager get couponType =>
      $$CouponTypeTableTableManager(_db.attachedDatabase, _db.couponType);
}

mixin _$CurrencyDAOMixin on DatabaseAccessor<SharedDatabase> {
  $CurrencyTable get currency => attachedDatabase.currency;
  CurrencyDAOManager get managers => CurrencyDAOManager(this);
}

class CurrencyDAOManager {
  final _$CurrencyDAOMixin _db;
  CurrencyDAOManager(this._db);
  $$CurrencyTableTableManager get currency =>
      $$CurrencyTableTableManager(_db.attachedDatabase, _db.currency);
}

mixin _$CustomerDAOMixin on DatabaseAccessor<SharedDatabase> {
  $CustomerTable get customer => attachedDatabase.customer;
  CustomerDAOManager get managers => CustomerDAOManager(this);
}

class CustomerDAOManager {
  final _$CustomerDAOMixin _db;
  CustomerDAOManager(this._db);
  $$CustomerTableTableManager get customer =>
      $$CustomerTableTableManager(_db.attachedDatabase, _db.customer);
}

mixin _$DepartmentDAOMixin on DatabaseAccessor<SharedDatabase> {
  $CompanyTable get company => attachedDatabase.company;
  $DepartmentTable get department => attachedDatabase.department;
  DepartmentDAOManager get managers => DepartmentDAOManager(this);
}

class DepartmentDAOManager {
  final _$DepartmentDAOMixin _db;
  DepartmentDAOManager(this._db);
  $$CompanyTableTableManager get company =>
      $$CompanyTableTableManager(_db.attachedDatabase, _db.company);
  $$DepartmentTableTableManager get department =>
      $$DepartmentTableTableManager(_db.attachedDatabase, _db.department);
}

mixin _$EmployeeDAOMixin on DatabaseAccessor<SharedDatabase> {
  $EmployeePositionTable get employeePosition =>
      attachedDatabase.employeePosition;
  $CompanyTable get company => attachedDatabase.company;
  $DepartmentTable get department => attachedDatabase.department;
  $EmployeeTable get employee => attachedDatabase.employee;
  EmployeeDAOManager get managers => EmployeeDAOManager(this);
}

class EmployeeDAOManager {
  final _$EmployeeDAOMixin _db;
  EmployeeDAOManager(this._db);
  $$EmployeePositionTableTableManager get employeePosition =>
      $$EmployeePositionTableTableManager(
        _db.attachedDatabase,
        _db.employeePosition,
      );
  $$CompanyTableTableManager get company =>
      $$CompanyTableTableManager(_db.attachedDatabase, _db.company);
  $$DepartmentTableTableManager get department =>
      $$DepartmentTableTableManager(_db.attachedDatabase, _db.department);
  $$EmployeeTableTableManager get employee =>
      $$EmployeeTableTableManager(_db.attachedDatabase, _db.employee);
}

mixin _$EmployeePositionDAOMixin on DatabaseAccessor<SharedDatabase> {
  $EmployeePositionTable get employeePosition =>
      attachedDatabase.employeePosition;
  EmployeePositionDAOManager get managers => EmployeePositionDAOManager(this);
}

class EmployeePositionDAOManager {
  final _$EmployeePositionDAOMixin _db;
  EmployeePositionDAOManager(this._db);
  $$EmployeePositionTableTableManager get employeePosition =>
      $$EmployeePositionTableTableManager(
        _db.attachedDatabase,
        _db.employeePosition,
      );
}

mixin _$EmploymentHistoryDAOMixin on DatabaseAccessor<SharedDatabase> {
  $EmployeePositionTable get employeePosition =>
      attachedDatabase.employeePosition;
  $CompanyTable get company => attachedDatabase.company;
  $DepartmentTable get department => attachedDatabase.department;
  $EmployeeTable get employee => attachedDatabase.employee;
  $EmploymentHistoryTable get employmentHistory =>
      attachedDatabase.employmentHistory;
  EmploymentHistoryDAOManager get managers => EmploymentHistoryDAOManager(this);
}

class EmploymentHistoryDAOManager {
  final _$EmploymentHistoryDAOMixin _db;
  EmploymentHistoryDAOManager(this._db);
  $$EmployeePositionTableTableManager get employeePosition =>
      $$EmployeePositionTableTableManager(
        _db.attachedDatabase,
        _db.employeePosition,
      );
  $$CompanyTableTableManager get company =>
      $$CompanyTableTableManager(_db.attachedDatabase, _db.company);
  $$DepartmentTableTableManager get department =>
      $$DepartmentTableTableManager(_db.attachedDatabase, _db.department);
  $$EmployeeTableTableManager get employee =>
      $$EmployeeTableTableManager(_db.attachedDatabase, _db.employee);
  $$EmploymentHistoryTableTableManager get employmentHistory =>
      $$EmploymentHistoryTableTableManager(
        _db.attachedDatabase,
        _db.employmentHistory,
      );
}

mixin _$FootballPlayerDAOMixin on DatabaseAccessor<SharedDatabase> {
  $CountryTable get country => attachedDatabase.country;
  $FootballPlayerTable get footballPlayer => attachedDatabase.footballPlayer;
  FootballPlayerDAOManager get managers => FootballPlayerDAOManager(this);
}

class FootballPlayerDAOManager {
  final _$FootballPlayerDAOMixin _db;
  FootballPlayerDAOManager(this._db);
  $$CountryTableTableManager get country =>
      $$CountryTableTableManager(_db.attachedDatabase, _db.country);
  $$FootballPlayerTableTableManager get footballPlayer =>
      $$FootballPlayerTableTableManager(
        _db.attachedDatabase,
        _db.footballPlayer,
      );
}

mixin _$GenderDAOMixin on DatabaseAccessor<SharedDatabase> {
  $GenderTable get gender => attachedDatabase.gender;
  GenderDAOManager get managers => GenderDAOManager(this);
}

class GenderDAOManager {
  final _$GenderDAOMixin _db;
  GenderDAOManager(this._db);
  $$GenderTableTableManager get gender =>
      $$GenderTableTableManager(_db.attachedDatabase, _db.gender);
}

mixin _$LanguageDAOMixin on DatabaseAccessor<SharedDatabase> {
  $LanguageTable get language => attachedDatabase.language;
  LanguageDAOManager get managers => LanguageDAOManager(this);
}

class LanguageDAOManager {
  final _$LanguageDAOMixin _db;
  LanguageDAOManager(this._db);
  $$LanguageTableTableManager get language =>
      $$LanguageTableTableManager(_db.attachedDatabase, _db.language);
}

mixin _$LessonDAOMixin on DatabaseAccessor<SharedDatabase> {
  $BookTable get book => attachedDatabase.book;
  $LessonTable get lesson => attachedDatabase.lesson;
  LessonDAOManager get managers => LessonDAOManager(this);
}

class LessonDAOManager {
  final _$LessonDAOMixin _db;
  LessonDAOManager(this._db);
  $$BookTableTableManager get book =>
      $$BookTableTableManager(_db.attachedDatabase, _db.book);
  $$LessonTableTableManager get lesson =>
      $$LessonTableTableManager(_db.attachedDatabase, _db.lesson);
}

mixin _$NoteDAOMixin on DatabaseAccessor<SharedDatabase> {
  $NoteTable get note => attachedDatabase.note;
  NoteDAOManager get managers => NoteDAOManager(this);
}

class NoteDAOManager {
  final _$NoteDAOMixin _db;
  NoteDAOManager(this._db);
  $$NoteTableTableManager get note =>
      $$NoteTableTableManager(_db.attachedDatabase, _db.note);
}

mixin _$PaymentGatewayDAOMixin on DatabaseAccessor<SharedDatabase> {
  $PaymentGatewayTable get paymentGateway => attachedDatabase.paymentGateway;
  PaymentGatewayDAOManager get managers => PaymentGatewayDAOManager(this);
}

class PaymentGatewayDAOManager {
  final _$PaymentGatewayDAOMixin _db;
  PaymentGatewayDAOManager(this._db);
  $$PaymentGatewayTableTableManager get paymentGateway =>
      $$PaymentGatewayTableTableManager(
        _db.attachedDatabase,
        _db.paymentGateway,
      );
}

mixin _$ProductDAOMixin on DatabaseAccessor<SharedDatabase> {
  $CategoryTable get category => attachedDatabase.category;
  $ProductTable get product => attachedDatabase.product;
  ProductDAOManager get managers => ProductDAOManager(this);
}

class ProductDAOManager {
  final _$ProductDAOMixin _db;
  ProductDAOManager(this._db);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db.attachedDatabase, _db.category);
  $$ProductTableTableManager get product =>
      $$ProductTableTableManager(_db.attachedDatabase, _db.product);
}

mixin _$SalesOrderDAOMixin on DatabaseAccessor<SharedDatabase> {
  $EmployeePositionTable get employeePosition =>
      attachedDatabase.employeePosition;
  $CompanyTable get company => attachedDatabase.company;
  $DepartmentTable get department => attachedDatabase.department;
  $EmployeeTable get employee => attachedDatabase.employee;
  $CustomerTable get customer => attachedDatabase.customer;
  $SalesOrderTable get salesOrder => attachedDatabase.salesOrder;
  SalesOrderDAOManager get managers => SalesOrderDAOManager(this);
}

class SalesOrderDAOManager {
  final _$SalesOrderDAOMixin _db;
  SalesOrderDAOManager(this._db);
  $$EmployeePositionTableTableManager get employeePosition =>
      $$EmployeePositionTableTableManager(
        _db.attachedDatabase,
        _db.employeePosition,
      );
  $$CompanyTableTableManager get company =>
      $$CompanyTableTableManager(_db.attachedDatabase, _db.company);
  $$DepartmentTableTableManager get department =>
      $$DepartmentTableTableManager(_db.attachedDatabase, _db.department);
  $$EmployeeTableTableManager get employee =>
      $$EmployeeTableTableManager(_db.attachedDatabase, _db.employee);
  $$CustomerTableTableManager get customer =>
      $$CustomerTableTableManager(_db.attachedDatabase, _db.customer);
  $$SalesOrderTableTableManager get salesOrder =>
      $$SalesOrderTableTableManager(_db.attachedDatabase, _db.salesOrder);
}

mixin _$SalesOrderLineDAOMixin on DatabaseAccessor<SharedDatabase> {
  $EmployeePositionTable get employeePosition =>
      attachedDatabase.employeePosition;
  $CompanyTable get company => attachedDatabase.company;
  $DepartmentTable get department => attachedDatabase.department;
  $EmployeeTable get employee => attachedDatabase.employee;
  $CustomerTable get customer => attachedDatabase.customer;
  $SalesOrderTable get salesOrder => attachedDatabase.salesOrder;
  $CategoryTable get category => attachedDatabase.category;
  $ProductTable get product => attachedDatabase.product;
  $SalesOrderLineTable get salesOrderLine => attachedDatabase.salesOrderLine;
  SalesOrderLineDAOManager get managers => SalesOrderLineDAOManager(this);
}

class SalesOrderLineDAOManager {
  final _$SalesOrderLineDAOMixin _db;
  SalesOrderLineDAOManager(this._db);
  $$EmployeePositionTableTableManager get employeePosition =>
      $$EmployeePositionTableTableManager(
        _db.attachedDatabase,
        _db.employeePosition,
      );
  $$CompanyTableTableManager get company =>
      $$CompanyTableTableManager(_db.attachedDatabase, _db.company);
  $$DepartmentTableTableManager get department =>
      $$DepartmentTableTableManager(_db.attachedDatabase, _db.department);
  $$EmployeeTableTableManager get employee =>
      $$EmployeeTableTableManager(_db.attachedDatabase, _db.employee);
  $$CustomerTableTableManager get customer =>
      $$CustomerTableTableManager(_db.attachedDatabase, _db.customer);
  $$SalesOrderTableTableManager get salesOrder =>
      $$SalesOrderTableTableManager(_db.attachedDatabase, _db.salesOrder);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db.attachedDatabase, _db.category);
  $$ProductTableTableManager get product =>
      $$ProductTableTableManager(_db.attachedDatabase, _db.product);
  $$SalesOrderLineTableTableManager get salesOrderLine =>
      $$SalesOrderLineTableTableManager(
        _db.attachedDatabase,
        _db.salesOrderLine,
      );
}

mixin _$SongDAOMixin on DatabaseAccessor<SharedDatabase> {
  $AlbumTable get album => attachedDatabase.album;
  $SongTable get song => attachedDatabase.song;
  SongDAOManager get managers => SongDAOManager(this);
}

class SongDAOManager {
  final _$SongDAOMixin _db;
  SongDAOManager(this._db);
  $$AlbumTableTableManager get album =>
      $$AlbumTableTableManager(_db.attachedDatabase, _db.album);
  $$SongTableTableManager get song =>
      $$SongTableTableManager(_db.attachedDatabase, _db.song);
}

mixin _$SystemLogDAOMixin on DatabaseAccessor<SharedDatabase> {
  $SystemLogTable get systemLog => attachedDatabase.systemLog;
  SystemLogDAOManager get managers => SystemLogDAOManager(this);
}

class SystemLogDAOManager {
  final _$SystemLogDAOMixin _db;
  SystemLogDAOManager(this._db);
  $$SystemLogTableTableManager get systemLog =>
      $$SystemLogTableTableManager(_db.attachedDatabase, _db.systemLog);
}

mixin _$TeacherDAOMixin on DatabaseAccessor<SharedDatabase> {
  $GenderTable get gender => attachedDatabase.gender;
  $TeacherPositionTable get teacherPosition => attachedDatabase.teacherPosition;
  $UniversityTable get university => attachedDatabase.university;
  $CountryTable get country => attachedDatabase.country;
  $TeacherTable get teacher => attachedDatabase.teacher;
  TeacherDAOManager get managers => TeacherDAOManager(this);
}

class TeacherDAOManager {
  final _$TeacherDAOMixin _db;
  TeacherDAOManager(this._db);
  $$GenderTableTableManager get gender =>
      $$GenderTableTableManager(_db.attachedDatabase, _db.gender);
  $$TeacherPositionTableTableManager get teacherPosition =>
      $$TeacherPositionTableTableManager(
        _db.attachedDatabase,
        _db.teacherPosition,
      );
  $$UniversityTableTableManager get university =>
      $$UniversityTableTableManager(_db.attachedDatabase, _db.university);
  $$CountryTableTableManager get country =>
      $$CountryTableTableManager(_db.attachedDatabase, _db.country);
  $$TeacherTableTableManager get teacher =>
      $$TeacherTableTableManager(_db.attachedDatabase, _db.teacher);
}

mixin _$TeacherPositionDAOMixin on DatabaseAccessor<SharedDatabase> {
  $TeacherPositionTable get teacherPosition => attachedDatabase.teacherPosition;
  TeacherPositionDAOManager get managers => TeacherPositionDAOManager(this);
}

class TeacherPositionDAOManager {
  final _$TeacherPositionDAOMixin _db;
  TeacherPositionDAOManager(this._db);
  $$TeacherPositionTableTableManager get teacherPosition =>
      $$TeacherPositionTableTableManager(
        _db.attachedDatabase,
        _db.teacherPosition,
      );
}

mixin _$UniversityDAOMixin on DatabaseAccessor<SharedDatabase> {
  $UniversityTable get university => attachedDatabase.university;
  UniversityDAOManager get managers => UniversityDAOManager(this);
}

class UniversityDAOManager {
  final _$UniversityDAOMixin _db;
  UniversityDAOManager(this._db);
  $$UniversityTableTableManager get university =>
      $$UniversityTableTableManager(_db.attachedDatabase, _db.university);
}

mixin _$ProjectDAOMixin on DatabaseAccessor<SharedDatabase> {
  $ProjectTable get project => attachedDatabase.project;
  ProjectDAOManager get managers => ProjectDAOManager(this);
}

class ProjectDAOManager {
  final _$ProjectDAOMixin _db;
  ProjectDAOManager(this._db);
  $$ProjectTableTableManager get project =>
      $$ProjectTableTableManager(_db.attachedDatabase, _db.project);
}

mixin _$ContributorDAOMixin on DatabaseAccessor<SharedDatabase> {
  $ProjectTable get project => attachedDatabase.project;
  $EmployeePositionTable get employeePosition =>
      attachedDatabase.employeePosition;
  $CompanyTable get company => attachedDatabase.company;
  $DepartmentTable get department => attachedDatabase.department;
  $EmployeeTable get employee => attachedDatabase.employee;
  $AppUserTable get appUser => attachedDatabase.appUser;
  $ContributorTable get contributor => attachedDatabase.contributor;
  ContributorDAOManager get managers => ContributorDAOManager(this);
}

class ContributorDAOManager {
  final _$ContributorDAOMixin _db;
  ContributorDAOManager(this._db);
  $$ProjectTableTableManager get project =>
      $$ProjectTableTableManager(_db.attachedDatabase, _db.project);
  $$EmployeePositionTableTableManager get employeePosition =>
      $$EmployeePositionTableTableManager(
        _db.attachedDatabase,
        _db.employeePosition,
      );
  $$CompanyTableTableManager get company =>
      $$CompanyTableTableManager(_db.attachedDatabase, _db.company);
  $$DepartmentTableTableManager get department =>
      $$DepartmentTableTableManager(_db.attachedDatabase, _db.department);
  $$EmployeeTableTableManager get employee =>
      $$EmployeeTableTableManager(_db.attachedDatabase, _db.employee);
  $$AppUserTableTableManager get appUser =>
      $$AppUserTableTableManager(_db.attachedDatabase, _db.appUser);
  $$ContributorTableTableManager get contributor =>
      $$ContributorTableTableManager(_db.attachedDatabase, _db.contributor);
}

mixin _$NotificationMessageDAOMixin on DatabaseAccessor<SharedDatabase> {
  $NotificationMessageTable get notificationMessage =>
      attachedDatabase.notificationMessage;
  NotificationMessageDAOManager get managers =>
      NotificationMessageDAOManager(this);
}

class NotificationMessageDAOManager {
  final _$NotificationMessageDAOMixin _db;
  NotificationMessageDAOManager(this._db);
  $$NotificationMessageTableTableManager get notificationMessage =>
      $$NotificationMessageTableTableManager(
        _db.attachedDatabase,
        _db.notificationMessage,
      );
}

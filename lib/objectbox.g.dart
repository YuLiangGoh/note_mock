// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'class/entity/note.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 531084985353965989),
      name: 'Note',
      lastPropertyId: const obx_int.IdUid(6, 2240214260090583529),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 6736386721331550059),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 2601102833018513042),
            name: 'content',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 1718683890740524023),
            name: 'createdAt',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 2240214260090583529),
            name: 'typeId',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(1, 531084985353965989),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [9177920410492610451, 6488819772178184025],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Note: obx_int.EntityDefinition<Note>(
        model: _entities[0],
        toOneRelations: (Note object) => [],
        toManyRelations: (Note object) => {},
        getId: (Note object) => object.id,
        setId: (Note object, int id) {
          object.id = id;
        },
        objectToFB: (Note object, fb.Builder fbb) {
          final contentOffset =
              object.content == null ? null : fbb.writeString(object.content!);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(2, contentOffset);
          fbb.addInt64(3, object.createdAt?.millisecondsSinceEpoch);
          fbb.addInt64(5, object.typeId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final createdAtValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final contentParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 8);
          final createdAtParam = createdAtValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(createdAtValue);
          final object = Note(
              id: idParam, content: contentParam, createdAt: createdAtParam)
            ..typeId = const fb.Int64Reader()
                .vTableGetNullable(buffer, rootOffset, 14);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Note] entity fields to define ObjectBox queries.
class Note_ {
  /// See [Note.id].
  static final id = obx.QueryIntegerProperty<Note>(_entities[0].properties[0]);

  /// See [Note.content].
  static final content =
      obx.QueryStringProperty<Note>(_entities[0].properties[1]);

  /// See [Note.createdAt].
  static final createdAt =
      obx.QueryDateProperty<Note>(_entities[0].properties[2]);

  /// See [Note.typeId].
  static final typeId =
      obx.QueryIntegerProperty<Note>(_entities[0].properties[3]);
}

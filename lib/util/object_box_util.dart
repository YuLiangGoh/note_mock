import 'package:note_mock/class/entity/note.dart';
import 'package:note_mock/class/enum/note_type.dart';
import 'package:note_mock/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;
  late final Box<Note> _noteBox;

  ObjectBox._create(this.store) {
    _noteBox = Box<Note>(store);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store =
        await openStore(directory: p.join(docsDir.path, "obx-example"));
    return ObjectBox._create(store);
  }

  Future<void> addNote(NoteType type, String content) => _noteBox.putAsync(Note(
        type: type,
        content: content,
        createdAt: DateTime.now(),
      ));
  
  Future<void> updateNote(Note note) => _noteBox.putAsync(note);

  List<Note> getAllNotesByType(NoteType type) {
    return _noteBox
        .query(Note_.typeId.equals(type.index))
        .order(Note_.createdAt, flags: Order.descending)
        .build()
        .find();
  }

  void deleteAllNotes() {
    _noteBox.removeAll();
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:note_mock/class/enum/note_type.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  @Id()
  int id = 0;

  @Transient()
  NoteType? type;

  String? content;

  @Property(type: PropertyType.date)
  DateTime? createdAt;

  Note({
    this.id = 0,
    this.content,
    this.createdAt,
  });

  int? get typeId {
    _ensureStableEnumValues();
    return type?.index;
  }

  set typeId(int? value) {
    _ensureStableEnumValues();
    if (value == null) {
      type = null;
    } else {
      type = NoteType.values[value]; // throws a RangeError if not found

      // or if you want to handle unknown values gracefully:
      type = value >= 0 && value < NoteType.values.length
          ? NoteType.values[value]
          : NoteType.unknown;
    }
  }

  void _ensureStableEnumValues() {
    assert(NoteType.workAndStudy.index == 0);
    assert(NoteType.life.index == 1);
    assert(NoteType.healthAndWellness.index == 2);
    assert(NoteType.unknown.index == 3);
  }
}

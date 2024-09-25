// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:note_mock/class/enum/note_type.dart';

class AddNoteViewModel {
  NoteType? noteType;
  String? content;
  
  AddNoteViewModel({
    this.noteType,
    this.content,
  });

  AddNoteViewModel copyWith({
    NoteType? noteType,
    String? content,
  }) {
    return AddNoteViewModel(
      noteType: noteType ?? this.noteType,
      content: content ?? this.content,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:note_mock/class/entity/note.dart';

class NoteViewModel {
  List<Note> workAndStudyNotes;
  List<Note> lifeNotes;
  List<Note> healthAndWellnessNotes;
  
  NoteViewModel({
    required this.workAndStudyNotes,
    required this.lifeNotes,
    required this.healthAndWellnessNotes,
  });

  NoteViewModel copyWith({
    List<Note>? workAndStudyNotes,
    List<Note>? lifeNotes,
    List<Note>? healthAndWellnessNotes,
  }) {
    return NoteViewModel(
      workAndStudyNotes: workAndStudyNotes ?? this.workAndStudyNotes,
      lifeNotes: lifeNotes ?? this.lifeNotes,
      healthAndWellnessNotes: healthAndWellnessNotes ?? this.healthAndWellnessNotes,
    );
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/class/enum/note_type.dart';
import 'package:note_mock/class/view_model/note_view_model.dart';

final noteProvider =
    StateNotifierProvider<NoteController, NoteViewModel>((ref) {
  return NoteController();
});

class NoteController extends StateNotifier<NoteViewModel> {
  NoteController()
      : super(NoteViewModel(
          workAndStudyNotes: [],
          lifeNotes: [],
          healthAndWellnessNotes: [],
        ));

  void getAllNotes() {
    state = state.copyWith(
      workAndStudyNotes: objectbox.getAllNotesByType(NoteType.workAndStudy),
      lifeNotes: objectbox.getAllNotesByType(NoteType.life),
      healthAndWellnessNotes:
          objectbox.getAllNotesByType(NoteType.healthAndWellness),
    );
  }
}

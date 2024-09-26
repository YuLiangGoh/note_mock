import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/app/app_route.dart';
import 'package:note_mock/class/entity/note.dart';
import 'package:note_mock/class/enum/note_type.dart';
import 'package:note_mock/controller/note_controller.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class AddNoteController {
  AddNoteController._();

  static final formKey = GlobalKey<FormState>();
  static late ValueNotifier<NoteType> noteTypeNotifier;
  static late TextEditingController textEditingControllerContent;

  static void init({NoteType? type, String? content}) {
    noteTypeNotifier = useState(type ?? NoteType.workAndStudy);
    textEditingControllerContent =
        useTextEditingController(text: content ?? '');
  }

  static Future<void> createNote(WidgetRef ref) async {
    try {
      if (formKey.currentState!.validate()) {
        await objectbox.addNote(
            noteTypeNotifier.value, textEditingControllerContent.text.trim());

        if (!globalContext.mounted) {
          return;
        }

        ref.read(noteProvider.notifier).getAllNotes();

        AppRoute.popPage();
      }
    } on Exception catch (e) {
      PanaraInfoDialog.show(
        globalContext,
        title: "Create Failed",
        message: "Failed to create note. Please try again. Error : $e",
        buttonText: "Okay",
        onTapDismiss: () {
          AppRoute.popPage();
        },
        panaraDialogType: PanaraDialogType.error,
        barrierDismissible: false,
      );
    }
  }

  static Future<void> updateNote(Note note, WidgetRef ref) async {
    try {
      if (formKey.currentState!.validate()) {
        note.type = noteTypeNotifier.value;
        note.content = textEditingControllerContent.text.trim();

        await objectbox.updateNote(note);

        if (!globalContext.mounted) {
          return;
        }

        ref.read(noteProvider.notifier).getAllNotes();

        AppRoute.popPage();
      }
    } on Exception catch (e) {
      PanaraInfoDialog.show(
        globalContext,
        title: "Create Failed",
        message: "Failed to create note. Please try again. Error : $e",
        buttonText: "Okay",
        onTapDismiss: () {
          AppRoute.popPage();
        },
        panaraDialogType: PanaraDialogType.error,
        barrierDismissible: false,
      );
    }
  }
}

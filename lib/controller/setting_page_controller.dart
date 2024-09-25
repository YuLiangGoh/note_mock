import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/app/app_route.dart';
import 'package:note_mock/controller/note_controller.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class SettingPageController {
  SettingPageController._();

  static void deleteAllNotes(WidgetRef ref) {
    PanaraInfoDialog.show(
      globalContext,
      title: "Remove All Notes",
      message: "Are you sure you want to remove all notes?",
      buttonText: "Confirm",
      onTapDismiss: () {
        AppRoute.popPage();

        objectbox.deleteAllNotes();

        ref.read(noteProvider.notifier).getAllNotes();

        PanaraInfoDialog.show(
          globalContext,
          title: "Success",
          message: "All notes have been removed.",
          buttonText: "Okay",
          onTapDismiss: () {
            AppRoute.popPage();
          },
          panaraDialogType: PanaraDialogType.success,
          barrierDismissible: false,
        );
      },
      panaraDialogType: PanaraDialogType.error,
      barrierDismissible: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_mock/app/app_constant.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/class/entity/note.dart';
import 'package:note_mock/class/enum/note_type.dart';
import 'package:note_mock/components/app_bar/app_bar.dart';
import 'package:note_mock/components/buttons/primary_button.dart';
import 'package:note_mock/controller/add_note_controller.dart';

class AddEditNotePage extends HookConsumerWidget {
  const AddEditNotePage({super.key, this.note});

  final Note? note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AddNoteController.init(
      type: note?.type,
      content: note?.content,
    );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        appBar: AppTitleBar(title: note != null ? 'Edit Note' : 'New note'),
        body: Container(
          padding:
              EdgeInsets.only(top: 68.h + MediaQuery.of(context).padding.top),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.cloudBurst,
                AppColor.jaggerApprox,
                AppColor.revolverApprox,
                AppColor.grapeApprox,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 1.sh - 68.h - MediaQuery.of(context).padding.top,
            ),
            child: Container(
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: AddNoteController.formKey,
                child: Column(
                  children: [
                    gapHeight20,
                    DropdownButtonFormField(
                      value: note == null
                          ? null
                          : AddNoteController.noteTypeNotifier.value,
                      hint: Text(
                        'Choose a category',
                        style: textStyleW400(
                          fontSize: 14,
                          color: AppColor.white.withOpacity(0.9),
                        ),
                      ),
                      selectedItemBuilder: (context) {
                        return [
                          Text(
                            NoteType.workAndStudy.name,
                            style: textStyleW400(fontSize: 14),
                          ),
                          Text(
                            NoteType.life.name,
                            style: textStyleW400(fontSize: 14),
                          ),
                          Text(
                            NoteType.healthAndWellness.name,
                            style: textStyleW400(fontSize: 14),
                          ),
                        ];
                      },
                      icon: RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: AppColor.white,
                          size: 24.r,
                        ),
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        fillColor: AppColor.white.withOpacity(0.05),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.white.withOpacity(0.12),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.white.withOpacity(0.12),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColor.errorRed,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColor.errorRed,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: NoteType.workAndStudy,
                          child: Text(NoteType.workAndStudy.name),
                        ),
                        DropdownMenuItem(
                          value: NoteType.life,
                          child: Text(NoteType.life.name),
                        ),
                        DropdownMenuItem(
                          value: NoteType.healthAndWellness,
                          child: Text(NoteType.healthAndWellness.name),
                        ),
                      ],
                      onChanged: (value) {
                        if (value == null) return;
                        AddNoteController.noteTypeNotifier.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please choose a category';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    gapHeight16,
                    TextFormField(
                      maxLines: 8,
                      maxLength: 200,
                      style: textStyleW400(
                        fontSize: 14,
                        color: AppColor.white.withOpacity(0.9),
                      ),
                      controller:
                          AddNoteController.textEditingControllerContent,
                      decoration: InputDecoration(
                        counterStyle: textStyleW400(
                          fontSize: 11,
                          color: AppColor.white.withOpacity(0.9),
                        ),
                        hintText: 'Please input note content',
                        hintStyle: textStyleW400(
                          fontSize: 14,
                          color: AppColor.white.withOpacity(0.9),
                        ),
                        fillColor: AppColor.white.withOpacity(0.05),
                        filled: true,
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColor.errorRed,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.white.withOpacity(0.12),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.white.withOpacity(0.12),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColor.errorRed,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input note content';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationItem(ref),
      ),
    );
  }

  Widget bottomNavigationItem(WidgetRef ref) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.haiti.withOpacity(0.85),
            AppColor.haiti1.withOpacity(0.85),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Center(
        child: PrimaryButton(
          title: 'Save',
          onPressed: () => note == null
              ? AddNoteController.createNote(ref)
              : AddNoteController.updateNote(note!, ref),
        ),
      ),
    );
  }
}

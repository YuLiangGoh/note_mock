enum NoteType {
  workAndStudy,
  life,
  healthAndWellness,
  unknown;

  String get name {
    switch (this) {
      case NoteType.workAndStudy:
        return 'Work and study';
      case NoteType.life:
        return 'Life';
      case NoteType.healthAndWellness:
        return 'Health and wellness';
      default:
        return 'Unknown';
    }
  }
}


final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description, time, isInRecycleBin, isImportant
  ];

  static final String id = 'id';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
  static final String isInRecycleBin = 'isInRecycleBin';
  static final String isImportant = 'isImportant';

}

class Note {
  final int? id;
  final String? title;
  final String? description;
  final DateTime createdTime;
  bool? isSelected;
  bool? isInRecycleBin;
  bool? isImportant;

  Note({
    this.id,
    this.title,
    this.description,
    required this.createdTime,
    this.isSelected = false,
    this.isInRecycleBin = false,
    this.isImportant = false,
  });

  Note copy({
    int? id,
    String? title,
    String? description,
    DateTime? createdTime,
    bool? isInRecycleBin,
    bool? isImportant,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
        isInRecycleBin: isInRecycleBin ?? this.isInRecycleBin,
        isImportant: isImportant ?? this.isImportant,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        title: json[NoteFields.title] as String,
        description: json[NoteFields.description] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
        isImportant: json[NoteFields.isImportant] == 1 ? true : false,
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.description: description,
        NoteFields.time: createdTime.toIso8601String(),
        NoteFields.isInRecycleBin: isInRecycleBin,
        NoteFields.isImportant: isImportant,
      };
}

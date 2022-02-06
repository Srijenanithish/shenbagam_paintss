final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, isImportant, logged_in, api_key, api_secret, time,
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String logged_in = 'logged_in';
  static final String api_key = 'api_key';
  static final String api_secret = 'api_secret';

  static final String time = 'time';
}

class Note {
  final int? id;
  final bool isImportant;
  final bool logged_in;
  final String api_key;
  final String api_secret;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.isImportant,
    required this.logged_in,
    required this.api_key,
    required this.api_secret,
    required this.createdTime,
  });

  Note copy({
    int? id,
    bool? isImportant,
    bool? logged_in,
    String? api_key,
    String? api_secret,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        logged_in: logged_in ?? this.logged_in,
        api_key: api_key ?? this.api_key,
        api_secret: api_secret ?? this.api_secret,
        createdTime: createdTime ?? this.createdTime,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        isImportant: json[NoteFields.isImportant] == 1,
        logged_in: json[NoteFields.isImportant] == 0,
        api_key: json[NoteFields.api_key] as String,
        api_secret: json[NoteFields.api_secret] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.isImportant: isImportant ? 1 : 0,
        NoteFields.logged_in: logged_in ? 1 : 0,
        NoteFields.api_key: api_key,
        NoteFields.api_secret: api_secret,
        NoteFields.time: createdTime.toIso8601String(),
      };
}

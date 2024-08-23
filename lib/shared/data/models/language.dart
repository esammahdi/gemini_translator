
class Language {
  final String name;
  final String code;

  const Language._(this.name, this.code);

  static const ENGLISH = Language._('English', 'en');
  static const TURKISH = Language._('Turkish', 'tr');
  static const ARABIC = Language._('Arabic', 'ar');

  static const values = [ENGLISH, TURKISH, ARABIC];

  static Language? fromLanguageCode(String? code) {
    return values.firstWhere((language) => language.code == code);
  }

  @override
  String toString() => name;
}
class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;
  Language({
    required this.id,
    required this.name,
    required this.flag,
    required this.languageCode,
});
  static List<Language> languageList(){
    return <Language> [
      Language(id: 1, name: "English", flag: '2', languageCode: '2'),
      Language(id: 2, name: "Kazakh", flag: '2', languageCode: '2'),
      Language(id: 3, name: "English", flag: '2', languageCode: '2'),
    ];
  }
}
class LastRead {
  static final LastRead _instance = LastRead._internal();
  factory LastRead() => _instance;
  LastRead._internal();

  String? namaLastRead;
  int? ayatLastRead;

  void updateLastRead(String nama, int ayat) {
    namaLastRead = nama;
    ayatLastRead = ayat;

    print(namaLastRead);
    print(ayatLastRead);
  }
}

import 'dart:io';

import 'soal.dart';

main() {
  var classsoal = Soal();
  List<dynamic> soal = classsoal.getSoal;
  List<String> jawaban = [];
  String? jawab;
  String? key;
  String? yt;
  List<String> abjad = ['A', 'B', 'C', 'D'];
  int numbersoal = 1;
  soal.shuffle();
  int point = 0;

  void _answer() {
    key = soal[numbersoal]['key'].toString().toLowerCase().replaceAll(" ", "");
    jawaban = [
      soal[numbersoal]['key'].toString(),
      soal[numbersoal]['A'].toString(),
      soal[numbersoal]['B'].toString(),
      soal[numbersoal]['C'].toString(),
    ];
    jawaban.shuffle();
  }

  void _reset() {
    point = 0;
    numbersoal = 1;
    _answer();
  }

  void _cekJawaban(int jawabanSaya) {
    String jwb = jawaban[jawabanSaya].toLowerCase().replaceAll(" ", "");
    if (key == jwb) {
      point += 10;
    }
    numbersoal += 1;
    _answer();
  }

  _answer();
  do {
    _reset();
    do {
      print("\x1B[2J\x1B[0;0H");
      print("======" * 10);
      print("\x1B[33mSoal Nomor ${numbersoal} \x1B[0m");
      print(
          "\x1B[32m" + soal[numbersoal]['question'].toString() + "....\x1B[0m");
      print("======" * 10);
      jawaban.asMap().forEach((index, element) {
        print("\x1B[32m" +
            abjad[index] +
            ".\x1B[0m\x1B[35m" +
            element +
            "\x1B[0m");
      });
      print("======" * 10);

      do {
        stdout.write("\x1B[33mMasukan Jawaban Kamu : \x1B[0m");
        jawab = stdin.readLineSync().toString().toUpperCase();
      } while (abjad.contains(jawab) == false);

      // jika inputan benar
      _cekJawaban(abjad.indexOf(jawab));
    } while (numbersoal <= 10);

    print("\x1B[2J\x1B[0;0H");
    print("======" * 10);
    print("\x1B[33mPoint Yang Kamu Dapat Sebanyak ${point}\x1B[0m");
    print("\x1B[32mBenar : ${point / 10}\x1B[0m");
    print("\x1B[31mSalah : ${10 - (point / 10)}\x1B[0m");
    print("======" * 10);

    stdout.write("\x1B[33mApakah Kamu Ingin Main Lagi (Y/N) : \x1B[0m");
    yt = stdin.readLineSync().toString().toUpperCase();
  } while (yt == 'Y');

  print("\x1B[2J\x1B[0;0H");
  print("======" * 10);
  print("\x1B[33mTerima Kasih Suhu :>\x1B[0m");
  print("======" * 10);
}

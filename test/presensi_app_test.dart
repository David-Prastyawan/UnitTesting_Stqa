import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presensi_app/main.dart';

void main() {
  testWidgets('PresensiPage widget test', (WidgetTester tester) async {
    // Build aplikasi dan memicu frame.
    await tester.pumpWidget(MyApp());

    // Memverifikasi bahwa aplikasi dimulai pada PresensiPage.
    expect(find.text('Presensi Siswa'), findsOneWidget);
    expect(find.byType(PresensiPage), findsOneWidget);

    // Data tiruan untuk pengujian
    List<String> students = [
      'Prayoga Poleng',
      'Ryanda Poleng',
      'Fahri Brontoseno',
      'David Prastyawan'
    ];

    // Memverifikasi keberadaan siswa dalam daftar
    for (var student in students) {
      expect(find.text(student), findsOneWidget);
    }

    // Status kehadiran awal seharusnya false untuk semua siswa
    for (var student in students) {
      expect(find.text('$student: Tidak Hadir'), findsOneWidget);
    }

    // Mengetuk tombol 'Hadir' untuk siswa pertama
    await tester.tap(find.widgetWithText(ElevatedButton, 'Hadir').first);
    await tester.pump();

    // Memverifikasi bahwa status kehadiran diperbarui
    expect(find.text('Prayoga Poleng: Hadir'), findsOneWidget);

    // Mengetuk tombol 'Tidak Hadir' untuk siswa kedua
    await tester.tap(find.widgetWithText(ElevatedButton, 'Tidak Hadir').first);
    await tester.pump();

    // Memverifikasi bahwa status kehadiran diperbarui
    expect(find.text('Ryanda Poleng: Tidak Hadir'), findsOneWidget);

    // Memeriksa apakah status kehadiran siswa lainnya tetap 'Tidak Hadir'
    for (var student in students.skip(2)) {
      expect(find.text('$student: Tidak Hadir'), findsOneWidget);
    }
  });
}

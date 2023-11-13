import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presensi Siswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PresensiPage(),
    );
  }
}

class PresensiPage extends StatefulWidget {
  @override
  _PresensiPageState createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  List<String> students = [
    'Prayoga Poleng',
    'Ryanda Poleng',
    'Fahri Brontoseno',
    'David Prastyawan',
  ];

  Map<String, bool> attendance = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presensi Siswa'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return ListTile(
                  title: Text(student),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            attendance[student] = true; // Hadir
                          });
                        },
                        child: Text('Hadir'),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            attendance[student] = false; // Tidak Hadir
                          });
                        },
                        child: Text('Tidak Hadir'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Hasil Presensi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                final status = attendance[student] ?? false;
                return ListTile(
                  title: Text('$student: ${status ? 'Hadir' : 'Tidak Hadir'}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

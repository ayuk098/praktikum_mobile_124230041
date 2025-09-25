import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            StudentCard(
              name: 'John Doe',
              id: '123456',
              major: 'Informatika',
            ),
            StudentCard(
              name: 'Jane Smith',
              id: '654321',
              major: 'Sistem Informasi',
            ),
          ],
        ),
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final String name;
  final String id;
  final String major;

  const StudentCard({
    required this.name,
    required this.id,
    required this.major,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama: $name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('NIM: $id'),
            SizedBox(height: 8),
            Text('Jurusan: $major'),
          ],
        ),
      ),
    );
  }
}
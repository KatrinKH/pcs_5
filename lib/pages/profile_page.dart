import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Профиль')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('ФИО', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            const Text('Хомик Екатерина Андреевна', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            const Text('Группа', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            const Text('ЭФБО-06-22', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            const Text('Номер телефона', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            const Text('+7 (123) 456-78-90', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            const Text('Почта', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            const Text('example@gmail.com', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
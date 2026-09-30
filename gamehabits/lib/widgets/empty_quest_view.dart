import 'package:flutter/material.dart';

class EmptyQuestView extends StatelessWidget {
  const EmptyQuestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Pusatkan secara vertikal
        children: [
          Icon(Icons.inbox, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Belum ada quest hari ini.\nWaktunya bersantai!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

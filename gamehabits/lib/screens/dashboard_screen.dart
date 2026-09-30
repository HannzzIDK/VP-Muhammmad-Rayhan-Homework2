import 'package:flutter/material.dart';

import '../models/quest.dart';
import '../widgets/empty_quest_view.dart';
import '../widgets/quest_section.dart';
import '../widgets/user_stats_header.dart';

class DashboardScreen extends StatefulWidget {
  // 1. Tambahkan super.key di sini
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int userLevel = 1;
  int currentExp = 0;
  int coins = 0;

  List<Quest> activeQuests = [];

  // 2. Gunakan initState untuk mengisi dummy data saat layar pertama kali dimuat
  @override
  void initState() {
    super.initState();
    activeQuests = [
      // Sesuaikan parameter ini dengan model Quest yang sudah Anda buat
      Quest(
        id: '1',
        title: 'Selesaikan Tugas Flutter',
        isMainQuest: true,
        expReward: 60,
        coinReward: 50,
      ),
      Quest(
        id: '2',
        title: 'Baca Dokumentasi 15 Menit',
        isMainQuest: false,
        expReward: 20,
        coinReward: 10,
      ),
      Quest(
        id: '3',
        title: 'Push ke GitHub',
        isMainQuest: true,
        expReward: 50,
        coinReward: 20,
      ),
    ];
  }

  void _claimReward(int questIndex) {
    setState(() {
      Quest claimedQuest = activeQuests[questIndex];
      // Cegah klaim berulang jika quest sudah selesai
      if (claimedQuest.isCompleted) return;

      currentExp += claimedQuest.expReward;
      coins += claimedQuest.coinReward;
      claimedQuest.isCompleted = true;

      if (currentExp >= 100) {
        userLevel++;
        currentExp -= 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quest Dashboard')),
      body: Column(
        children: [
          // 1. Panggil Widget Header Anda di sini
          UserStatsHeader(level: userLevel, exp: currentExp, coins: coins),

          // 2. Daftar Quest atau Layar Kosong
          Expanded(
            child: activeQuests.isEmpty
                ? const EmptyQuestView()
                : QuestSelection(quests: activeQuests, onClaim: _claimReward),
          ),
        ],
      ),
    );
  }
}

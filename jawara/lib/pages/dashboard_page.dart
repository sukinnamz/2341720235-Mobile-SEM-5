// lib/pages/dashboard_page.dart (Final Version)

import 'package:flutter/material.dart';
import '../widgets/app_sidebar.dart';
import '../widgets/dashboard/dashboard_menu_content.dart'; // Impor konten dinamis
import '../constants/app_colors.dart'; // Impor warna

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0; // State untuk Bottom Navigation Bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: const AppSidebar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreetingCard(),
            const SizedBox(height: 20),
            // PANGGIL WIDGET KONTEN DINAMIS BERDASARKAN INDEX
            DashboardMenuContent(menuIndex: _currentIndex),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // --- Header dan Bottom Nav tetap di sini ---

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Selamat datang, Admin!',
        style: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      iconTheme: const IconThemeData(color: AppColors.accentBlue),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildGreetingCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: AppColors.backgroundLight,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.waving_hand, color: AppColors.primaryBlue),
            SizedBox(width: 10),
            Text(
              "Anda mengelola Dashboard Keuangan.",
              style: TextStyle(fontSize: 16, color: AppColors.textColor),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() => _currentIndex = index);
      },
      selectedItemColor: AppColors.accentBlue,
      unselectedItemColor: Colors.grey[500],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: 'Keuangan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_note_outlined),
          label: 'Kegiatan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups_2_outlined),
          label: 'Kependudukan',
        ),
      ],
    );
  }
}

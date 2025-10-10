// lib/pages/auth_page.dart

import 'package:flutter/material.dart';
import '../widgets/auth_toggle_buttons.dart';
import '../widgets/login_content.dart';
import '../widgets/register_content.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int _selectedTabIndex = 0; // State untuk mengontrol tab yang aktif

  // Fungsi untuk mengubah state, dipanggil dari AuthToggleButtons dan RegisterContent
  void _handleTabChange(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  // Konten Kartu Putih (dibagi menjadi Header Card & Scrollable Content)
                  child: _buildMainContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Bagian Header dan Background (tetap sama)
  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3A82F8), Color(0xFF2A62D9)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      // ... (Kode Header Jawara Pintar)
      child: const Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 26,
            child: Icon(
              Icons.book_outlined,
              color: Color(0xFF3A82F8),
              size: 32,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jawara Pintar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Sinergi Digital, Kemajuan Bersama',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Konten utama dengan Toggle Buttons di luar ScrollView
  Widget _buildMainContent() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 24.0,
              right: 24.0,
              bottom: 24.0,
            ),
            // Tombol Toggle di sini, DI LUAR ScrollView
            child: AuthToggleButtons(
              selectedIndex: _selectedTabIndex,
              onTabChange: _handleTabChange,
            ),
          ),

          // Area Konten Form yang Dapat Di-scroll
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _selectedTabIndex == 0
                    ? const LoginContent()
                    : RegisterContent(
                        onRegisterSuccess: () => _handleTabChange(0),
                      ), // Teruskan callback
              ),
            ),
          ),
        ],
      ),
    );
  }
}

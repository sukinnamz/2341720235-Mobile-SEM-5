// lib/widgets/app_sidebar.dart

import 'package:flutter/material.dart';

class AppSidebar extends StatefulWidget {
  const AppSidebar({super.key});

  @override
  State<AppSidebar> createState() => _AppSidebarState();
}

class _AppSidebarState extends State<AppSidebar> {
  // State untuk melacak item menu yang aktif
  String _selectedMenu = 'Tambah Pengguna';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF7F8FA), // Warna background sidebar
      elevation: 1,
      child: Column(
        children: [
          // Header
          _buildHeader(),

          // Daftar Menu
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuTitle("Menu"),
                _buildMenuItem(
                  icon: Icons.dashboard_outlined,
                  title: "Dashboard",
                ),
                _buildMenuItem(
                  icon: Icons.people_outline,
                  title: "Data Warga & Rumah",
                ),
                _buildMenuItem(
                  icon: Icons.subdirectory_arrow_right_outlined,
                  title: "Pemasukan",
                ),
                _buildMenuItem(
                  icon: Icons.subdirectory_arrow_left_outlined,
                  title: "Pengeluaran",
                ),
                _buildMenuItem(
                  icon: Icons.article_outlined,
                  title: "Laporan Keuangan",
                ),
                _buildMenuItem(
                  icon: Icons.campaign_outlined,
                  title: "Kegiatan & Broadcast",
                ),
                _buildMenuItem(
                  icon: Icons.chat_bubble_outline,
                  title: "Pesan Warga",
                ),
                _buildMenuItem(
                  icon: Icons.person_add_alt_1_outlined,
                  title: "Penerimaan Warga",
                ),
                _buildMenuItem(
                  icon: Icons.switch_account_outlined,
                  title: "Mutasi Keluarga",
                ),
                _buildMenuItem(
                  icon: Icons.history_outlined,
                  title: "Log Aktifitas",
                ),

                // Menu Dropdown (ExpansionTile)
                _buildExpansionMenu(),

                _buildMenuItem(
                  icon: Icons.swap_horiz_outlined,
                  title: "Channel Transfer",
                ),
              ],
            ),
          ),

          // Footer (Profil Pengguna)
          _buildFooter(),
        ],
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildHeader() {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFF6259EA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.book_outlined,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            "Jawara Pintar.",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Colors.grey[600],
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildMenuItem({required IconData icon, required String title}) {
    final bool isSelected = _selectedMenu == title;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedMenu = title;
        });
        // TODO: Tambahkan logika navigasi di sini
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF6259EA).withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF6259EA) : Colors.grey[700],
              size: 22,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected
                      ? const Color(0xFF6259EA)
                      : const Color(0xFF444444),
                  fontSize: 15,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[600], size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionMenu() {
    // Cek apakah salah satu sub-menu aktif untuk membuat menu utama tetap terbuka
    final bool isExpanded =
        _selectedMenu == 'Daftar Pengguna' ||
        _selectedMenu == 'Tambah Pengguna';

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        key: GlobalKey(), // Kunci untuk menjaga state
        initiallyExpanded: isExpanded,
        leading: Icon(
          Icons.manage_accounts_outlined,
          color: Colors.grey[700],
          size: 22,
        ),
        title: const Text(
          "Manajemen Pengguna",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF444444),
            fontSize: 15,
          ),
        ),
        trailing: const Icon(Icons.expand_more, size: 20),
        tilePadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 4),
        childrenPadding: const EdgeInsets.only(
          left: 30,
        ), // Indentasi untuk sub-menu
        children: [
          _buildSubMenuItem("Daftar Pengguna"),
          _buildSubMenuItem("Tambah Pengguna"),
        ],
      ),
    );
  }

  Widget _buildSubMenuItem(String title) {
    final bool isSelected = _selectedMenu == title;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedMenu = title;
        });
        // TODO: Tambahkan logika navigasi di sini
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF6259EA).withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected
                    ? const Color(0xFF6259EA)
                    : const Color(0xFF444444),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFF6259EA),
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: const Text(
          "Admin Jawara",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(
          "admin1@gmail.com",
          style: TextStyle(color: Colors.grey[600], fontSize: 13),
        ),
        trailing: Icon(Icons.unfold_more, color: Colors.grey[600]),
        onTap: () {
          // Aksi untuk profil
        },
      ),
    );
  }
}

// lib/widgets/dashboard/dashboard_menu_content.dart

import 'package:flutter/material.dart';
import 'summary_value_card.dart';
import 'total_transaction_card.dart';
import 'monthly_chart_card.dart';
import '../../constants/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardMenuContent extends StatelessWidget {
  final int menuIndex;

  const DashboardMenuContent({super.key, required this.menuIndex});

  @override
  Widget build(BuildContext context) {
    if (menuIndex == 0) {
      // --- Dashboard Keuangan ---
      return _buildKeuanganDashboard();
    } else if (menuIndex == 1) {
      // --- Dashboard Kegiatan ---
      return _buildKegiatanDashboard();
    } else {
      // --- Dashboard Kependudukan ---
      return _buildKependudukanDashboard();
    }
  }

  Widget _buildKeuanganDashboard() {
    // Data Dummy untuk Chart (Y = nilai uang, X = bulan)
    final List<FlSpot> incomeSpots = [
      const FlSpot(0, 30),
      const FlSpot(1, 55),
      const FlSpot(2, 45),
      const FlSpot(3, 70),
      const FlSpot(4, 60),
      const FlSpot(5, 80),
      const FlSpot(6, 95),
    ];
    final List<FlSpot> expenseSpots = [
      const FlSpot(0, 20),
      const FlSpot(1, 40),
      const FlSpot(2, 30),
      const FlSpot(3, 50),
      const FlSpot(4, 40),
      const FlSpot(5, 60),
      const FlSpot(6, 75),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TotalTransactionCard(transactionCount: 4),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: SummaryValueCard(
                title: "Total Pemasukan",
                value: "Rp 100 Jt",
                color: AppColors.backgroundLight,
                icon: Icons.arrow_downward_rounded,
                iconColor: AppColors.darkBlue,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SummaryValueCard(
                title: "Total Pengeluaran",
                value: "Rp 70 Jt",
                color: AppColors.backgroundLight,
                icon: Icons.arrow_upward_rounded,
                iconColor: AppColors.primaryBlue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        MonthlyChartCard(title: "📈 Pemasukan per Bulan", spots: incomeSpots),
        const SizedBox(height: 24),
        MonthlyChartCard(
          title: "📉 Pengeluaran per Bulan",
          spots: expenseSpots,
        ),
      ],
    );
  }

  Widget _buildKegiatanDashboard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TotalTransactionCard(transactionCount: 15),
        const SizedBox(height: 16),
        SummaryValueCard(
          title: "Kegiatan Terlaksana",
          value: "12",
          color: Colors.green.shade100,
          icon: Icons.check_circle_outline,
          iconColor: Colors.green.shade700,
        ),
        const SizedBox(height: 16),
        SummaryValueCard(
          title: "Kegiatan Mendatang",
          value: "3",
          color: Colors.orange.shade100,
          icon: Icons.event_available_outlined,
          iconColor: Colors.orange.shade700,
        ),
      ],
    );
  }

  Widget _buildKependudukanDashboard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TotalTransactionCard(transactionCount: 200),
        const SizedBox(height: 16),
        SummaryValueCard(
          title: "Total Kepala Keluarga",
          value: "50 KK",
          color: Colors.purple.shade100,
          icon: Icons.family_restroom_outlined,
          iconColor: Colors.purple.shade700,
        ),
        const SizedBox(height: 16),
        SummaryValueCard(
          title: "Mutasi Bulan Ini",
          value: "3",
          color: Colors.red.shade100,
          icon: Icons.swap_horiz_outlined,
          iconColor: Colors.red.shade700,
        ),
      ],
    );
  }
}

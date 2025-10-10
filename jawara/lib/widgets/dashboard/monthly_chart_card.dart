// lib/widgets/dashboard/monthly_chart_card.dart

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../constants/app_colors.dart'; // Import warna

class MonthlyChartCard extends StatelessWidget {
  final String title;
  final List<FlSpot> spots; // Data chart yang akan ditampilkan

  const MonthlyChartCard({super.key, required this.title, required this.spots});

  @override
  Widget build(BuildContext context) {
    bool isIncome = title.contains("Pemasukan");

    // Penentuan warna berdasarkan jenis chart
    Color lineColor = isIncome ? Colors.green.shade400 : AppColors.darkBlue;
    Color gradientColor = isIncome
        ? Colors.green.shade100
        : AppColors.primaryBlue.withOpacity(0.3);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 200,
              padding: const EdgeInsets.only(right: 18, top: 18),
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 100, // Misal, maksimal 100 Juta
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitleWidgets,
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: leftTitleWidgets,
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: lineColor,
                      barWidth: 3,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [gradientColor, Colors.white],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper untuk label di bawah (Bulan)
Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 10);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Jan', style: style);
      break;
    case 2:
      text = const Text('Mar', style: style);
      break;
    case 4:
      text = const Text('Mei', style: style);
      break;
    case 6:
      text = const Text('Jul', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}

// Helper untuk label di samping (Nilai)
Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 10);
  String text;
  if (value == 0) {
    text = '0';
  } else if (value == 50) {
    text = '50 Jt';
  } else if (value == 100) {
    text = '100 Jt';
  } else {
    return Container();
  }
  return Text(text, style: style, textAlign: TextAlign.left);
}

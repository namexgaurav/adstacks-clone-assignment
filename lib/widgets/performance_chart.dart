import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/contants/theme/app_theme.dart';

class PerformanceChart extends StatelessWidget {
  final bool isMobile;
  const PerformanceChart({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Over  All Performance',
                    style: GoogleFonts.poppins(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'The Years',
                    style: GoogleFonts.poppins(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  if (isMobile) ...[
                    _buildLegend(AppColors.chartPink, 'Pending Done'),
                    const SizedBox(width: 16),
                    _buildLegend(AppColors.chartPurple, 'Project Done'),
                  ],
                ],
              ),
              if (!isMobile) ...[
                const Spacer(),
                _buildLegend(AppColors.chartPink, 'Pending Done'),
                const SizedBox(width: 16),
                _buildLegend(AppColors.chartPurple, 'Project Done'),
              ],
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 10,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.white.withValues(alpha: 0.05),
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      interval: 10,
                      getTitlesWidget: (value, meta) => Text(
                        '${value.toInt()}',
                        style: GoogleFonts.poppins(
                          color: AppColors.textMuted,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        const years = [
                          '2015',
                          '2016',
                          '2017',
                          '2018',
                          '2019',
                          '2020',
                        ];
                        if (value.toInt() < 0 ||
                            value.toInt() >= years.length) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            years[value.toInt()],
                            style: GoogleFonts.poppins(
                              color: AppColors.textMuted,
                              fontSize: 11,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minY: 0,
                maxY: 60,
                lineBarsData: [
                  // Pending Done (pink)
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 32),
                      FlSpot(1, 28),
                      FlSpot(2, 42),
                      FlSpot(3, 38),
                      FlSpot(4, 45),
                      FlSpot(5, 32),
                    ],
                    isCurved: true,
                    color: AppColors.chartPink,
                    barWidth: 2.5,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.chartPink.withValues(alpha: 0.08),
                    ),
                  ),
                  // Project Done (purple)
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 22),
                      FlSpot(1, 25),
                      FlSpot(2, 35),
                      FlSpot(3, 55),
                      FlSpot(4, 38),
                      FlSpot(5, 30),
                    ],
                    isCurved: true,
                    color: AppColors.chartPurple,
                    barWidth: 2.5,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.chartPurple.withValues(alpha: 0.12),
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (_) => AppColors.accentPurple,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          '${spot.y.toInt()}',
                          GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: AppColors.textSecondary,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

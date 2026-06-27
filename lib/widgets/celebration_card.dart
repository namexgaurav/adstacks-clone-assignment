import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/contants/theme/app_theme.dart';

class CelebrationCard extends StatelessWidget {
  final String title;
  final List<String> emojis;
  final int total;
  final String buttonLabel;
  final VoidCallback? onButton;

  const CelebrationCard({
    super.key,
    required this.title,
    required this.emojis,
    required this.total,
    required this.buttonLabel,
    this.onButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('✨', style: TextStyle(fontSize: 16)),
              const SizedBox(width: 6),
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 6),
              const Text('✨', style: TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              // Avatar emojis
              ...emojis.map(
                (emoji) => Container(
                  width: 44,
                  height: 44,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.bgSecondary,
                    border: Border.all(
                      color: AppColors.accentPurple.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(emoji, style: const TextStyle(fontSize: 22)),
                  ),
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.poppins(
                      color: AppColors.textMuted,
                      fontSize: 11,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 1,
                        height: 30,
                        color: AppColors.textMuted.withOpacity(0.3),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      Text(
                        '$total',
                        style: GoogleFonts.poppins(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        color: AppColors.textMuted.withOpacity(0.3),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onButton,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPurple,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.send_rounded, size: 16),
              label: Text(
                buttonLabel,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

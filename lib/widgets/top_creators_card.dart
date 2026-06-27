import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/contants/theme/app_theme.dart';
import '../models/app_data.dart';

class TopCreatorsCard extends StatelessWidget {
  const TopCreatorsCard({super.key});

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
          Text(
            'Top Creators',
            style: GoogleFonts.poppins(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          // Table header
          Row(
            children: [
              Expanded(flex: 3, child: _headerText('Name')),
              Expanded(flex: 2, child: _headerText('Artworks')),
              Expanded(flex: 2, child: _headerText('Rating')),
            ],
          ),
          const SizedBox(height: 12),
          ...AppData.creators.map((c) => _buildCreatorRow(c)),
        ],
      ),
    );
  }

  Widget _headerText(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: AppColors.textMuted,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildCreatorRow(Creator creator) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7B5CF0), Color(0xFFE879A0)],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      creator.avatarEmoji,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    creator.username,
                    style: GoogleFonts.poppins(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${creator.artworks}',
              style: GoogleFonts.poppins(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: LinearProgressIndicator(
              value: creator.rating,
              backgroundColor: AppColors.bgSecondary,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.accentPurple,
              ),
              minHeight: 6,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}

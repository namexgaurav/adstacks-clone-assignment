import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/contants/theme/app_theme.dart';
import '../models/app_data.dart';

class AllProjectsCard extends StatelessWidget {
  const AllProjectsCard({super.key});

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
            'All Projects',
            style: GoogleFonts.poppins(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ...AppData.projects.asMap().entries.map((entry) {
            return _buildProjectItem(entry.value, entry.key == 0);
          }),
        ],
      ),
    );
  }

  Widget _buildProjectItem(Project project, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.selectedProject.withOpacity(0.15)
            : AppColors.bgSecondary,
        borderRadius: BorderRadius.circular(14),
        border: isSelected
            ? Border.all(color: AppColors.selectedProject.withOpacity(0.4))
            : null,
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: isSelected
                  ? const LinearGradient(
                      colors: [Color(0xFFE84393), Color(0xFF7B5CF0)],
                    )
                  : const LinearGradient(
                      colors: [Color(0xFF3A3D6B), Color(0xFF252845)],
                    ),
            ),
            child: const Center(
              child: Text('🔗', style: TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: GoogleFonts.poppins(
                    color: isSelected
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  project.subtitle,
                  style: GoogleFonts.poppins(
                    color: isSelected
                        ? AppColors.textPrimary.withOpacity(0.7)
                        : AppColors.textMuted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.edit_outlined,
            size: 16,
            color: isSelected ? AppColors.textPrimary : AppColors.textMuted,
          ),
        ],
      ),
    );
  }
}

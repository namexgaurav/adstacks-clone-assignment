import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/contants/theme/app_theme.dart';

class DashboardTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onMenuTap;

  const DashboardTopBar({super.key, this.title = 'Home', this.onMenuTap});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      color: AppColors.bgPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (onMenuTap != null)
            IconButton(
              onPressed: onMenuTap,
              icon: const Icon(Icons.menu_rounded, color: AppColors.textDark),
            ),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: AppColors.textDark,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
          const SizedBox(width: 24),
          // Search bar
          Container(
            height: 44,
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: AppColors.bgCard,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const SizedBox(width: 14),
                const Icon(Icons.search, color: AppColors.textMuted, size: 18),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    style: GoogleFonts.poppins(
                      color: AppColors.textPrimary,
                      fontSize: 13,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: GoogleFonts.poppins(
                        color: AppColors.textMuted,
                        fontSize: 13,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

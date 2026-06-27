import 'package:adstacks_media/core/contants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/contants/theme/app_theme.dart';

class SidebarNav extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const SidebarNav({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  State<SidebarNav> createState() => _SidebarNavState();
}

class _SidebarNavState extends State<SidebarNav> {
  bool _adstacksExpanded = true;
  bool _financeExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      color: AppColors.bgSidebar,
      child: Column(
        children: [
          _buildLogo(),
          const Divider(color: Color(0xFFE5E7EB), height: 1),
          _buildProfile(),
          const Divider(color: Color(0xFFE5E7EB), height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(Icons.home_rounded, 'Home', 0),
                  _buildNavItem(Icons.people_outline_rounded, 'Employees', 1),
                  _buildNavItem(Icons.checklist_rounded, 'Attendance', 2),
                  _buildNavItem(Icons.calendar_month_outlined, 'Summary', 3),
                  _buildNavItem(Icons.info_outline_rounded, 'Information', 4),
                  const SizedBox(height: 16),
                  _buildWorkspacesHeader(),
                  _buildExpandable('Adstacks', _adstacksExpanded, () {
                    setState(() => _adstacksExpanded = !_adstacksExpanded);
                  }),
                  _buildExpandable('Finance', _financeExpanded, () {
                    setState(() => _financeExpanded = !_financeExpanded);
                  }),
                ],
              ),
            ),
          ),
          const Divider(color: Color(0xFFE5E7EB), height: 1),
          _buildNavItem(Icons.settings_outlined, 'Setting', 5),
          _buildNavItem(Icons.logout_rounded, 'Logout', 6),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      AppImages.logo,
      width: 80,
      height: 80,
      fit: BoxFit.cover,
    );
  }

  Widget _buildProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: AppColors.accentGold, width: 3),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: Image.asset(
                AppImages.women,
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Pooja Mishra',
            style: GoogleFonts.poppins(
              color: AppColors.textDark,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD1D5DB)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Admin',
              style: GoogleFonts.poppins(
                color: AppColors.textMuted,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = widget.selectedIndex == index;
    return GestureDetector(
      onTap: () => widget.onItemSelected(index),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? AppColors.bgPrimary : Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isActive ? AppColors.textDark : AppColors.textMuted,
            ),
            const SizedBox(width: 14),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: isActive
                    ? AppColors.textDark
                    : AppColors.textSidebarInactive,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkspacesHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
      child: Row(
        children: [
          Text(
            'WORKSPACES',
            style: GoogleFonts.poppins(
              color: AppColors.textMuted,
              fontWeight: FontWeight.w700,
              fontSize: 11,
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          Icon(Icons.add, size: 18, color: AppColors.textMuted),
        ],
      ),
    );
  }

  Widget _buildExpandable(String label, bool expanded, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
        child: Row(
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                color: AppColors.textSidebarInactive,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            Icon(
              expanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
              size: 18,
              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}

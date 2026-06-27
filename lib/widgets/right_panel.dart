import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/contants/theme/app_theme.dart';
import 'calendar_widget.dart';
import 'celebration_card.dart';

class RightPanel extends StatelessWidget {
  final bool isInline;
  const RightPanel({super.key, this.isInline = false});

  @override
  Widget build(BuildContext context) {
    final innerContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GENERAL 10:00 AM TO 7:00 PM',
          style: GoogleFonts.poppins(
            color: AppColors.textSecondary,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),
        const CalendarWidget(),
        const SizedBox(height: 16),
        CelebrationCard(
          title: 'Today Birthday',
          emojis: const ['🎂', '🎂'],
          total: 2,
          buttonLabel: 'Birthday Wishing',
          onButton: () {},
        ),
        const SizedBox(height: 16),
        CelebrationCard(
          title: 'Anniversary',
          emojis: const ['🎩', '🎩', '🎩'],
          total: 3,
          buttonLabel: 'Anniversary Wishing',
          onButton: () {},
        ),
        const SizedBox(height: 16),
      ],
    );

    if (isInline) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'GENERAL 10:00 AM TO 7:00 PM',
            style: GoogleFonts.poppins(
              color: AppColors.textSecondary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          const SizedBox(width: double.infinity, child: CalendarWidget()),
          const SizedBox(height: 12),
          CelebrationCard(
            title: 'Today Birthday',
            emojis: const ['🎂', '🎂'],
            total: 2,
            buttonLabel: 'Birthday Wishing',
            onButton: () {},
          ),
          const SizedBox(height: 12),
          CelebrationCard(
            title: 'Anniversary',
            emojis: const ['🎩', '🎩', '🎩'],
            total: 3,
            buttonLabel: 'Anniversary Wishing',
            onButton: () {},
          ),
        ],
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TopBar(),
          Expanded(
            child: Container(
              color: AppColors.bgRight,
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(child: innerContent),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget implements PreferredSizeWidget {
  const _TopBar();

  @override
  Size get preferredSize => const Size.fromHeight(72);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIconButton(Icons.calendar_today_outlined),
              const SizedBox(width: 8),
              Stack(
                children: [
                  _buildIconButton(Icons.notifications_none_rounded),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.accentGold,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              _buildIconButton(Icons.power_settings_new_rounded),
            ],
          ),

          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [AppColors.accentPurple, AppColors.accentPink],
              ),
            ),
            child: const Center(
              child: Text('👩‍💼', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: AppColors.textSecondary, size: 20),
    );
  }
}

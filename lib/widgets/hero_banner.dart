import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/contants/theme/app_theme.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFB06AB3), Color(0xFF7B5CF0), Color(0xFF4568DC)],
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Decorative 3D shapes (abstract polygons)
          Positioned(
            right: -20,
            top: -20,
            child: _buildShape(120, const Color(0xFF9D7FF5), 0.6, 30),
          ),
          Positioned(
            right: 60,
            bottom: -30,
            child: _buildShape(80, const Color(0xFFE879A0), 0.5, 15),
          ),
          Positioned(
            right: 160,
            top: 10,
            child: _buildShape(60, Colors.white, 0.15, 5),
          ),
          Positioned(
            right: 30,
            top: 60,
            child: _buildRing(50, AppColors.accentGold, 0.4),
          ),
          // Text content
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'ETHEREUM 2.0',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Top Rating\nProject',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Trending project and high rating\nProject Created by team.',
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.6),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Learn More.',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
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

  Widget _buildShape(double size, Color color, double opacity, double radius) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(opacity),
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildRing(double size, Color color, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(opacity), width: 8),
      ),
    );
  }
}

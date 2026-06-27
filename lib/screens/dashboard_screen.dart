import 'package:flutter/material.dart';

import '../core/contants/theme/app_theme.dart';
import '../widgets/sidebar_nav.dart';
import '../widgets/top_bar.dart';
import '../widgets/hero_banner.dart';
import '../widgets/projects_card.dart';
import '../widgets/top_creators_card.dart';
import '../widgets/performance_chart.dart';
import '../widgets/right_panel.dart';

// Breakpoints
class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedNavIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < Breakpoints.mobile;
        final isTablet =
            width >= Breakpoints.mobile && width < Breakpoints.desktop;
        final isDesktop = width >= Breakpoints.desktop;

        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: AppColors.bgPrimary,
          drawer: (isMobile || isTablet)
              ? Drawer(
                  child: SidebarNav(
                    selectedIndex: _selectedNavIndex,
                    onItemSelected: (i) {
                      setState(() => _selectedNavIndex = i);
                      Navigator.pop(context);
                    },
                  ),
                )
              : null,
          body: Row(
            children: [
              // Sidebar (desktop only)
              if (isDesktop)
                SidebarNav(
                  selectedIndex: _selectedNavIndex,
                  onItemSelected: (i) => setState(() => _selectedNavIndex = i),
                ),

              // Main content
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Center scroll area
                    Expanded(
                      child: _buildMainContent(isMobile, isTablet, isDesktop),
                    ),
                    // Right panel (desktop only)
                    if (isDesktop) const RightPanel(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMainContent(bool isMobile, bool isTablet, bool isDesktop) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Column(
        children: [
          // Hero banner
          DashboardTopBar(
            title: 'Home',
            onMenuTap: (!isDesktop)
                ? () => _scaffoldKey.currentState?.openDrawer()
                : null,
          ),
          const HeroBanner(),
          SizedBox(height: isMobile ? 12 : 20),

          // Projects + Creators row
          if (isMobile) _buildMobileStack() else _buildProjectsCreatorsRow(),

          SizedBox(height: isMobile ? 12 : 20),

          // Performance chart
          PerformanceChart(isMobile: isMobile),

          // Right panel content (mobile/tablet only, below chart)
          if (isMobile || isTablet) ...[
            const SizedBox(height: 20),
            _buildMobileRightPanel(),
          ],

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMobileStack() {
    return const Column(
      children: [AllProjectsCard(), SizedBox(height: 12), TopCreatorsCard()],
    );
  }

  Widget _buildProjectsCreatorsRow() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: const AllProjectsCard()),
          const SizedBox(width: 20),
          Expanded(child: const TopCreatorsCard()),
        ],
      ),
    );
  }

  Widget _buildMobileRightPanel() {
    return const RightPanel(isInline: true);
  }
}

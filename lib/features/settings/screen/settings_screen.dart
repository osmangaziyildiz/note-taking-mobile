import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notetakingapp/core/di/service_locator.dart';
import 'package:notetakingapp/core/localization/localization_manager.dart';
import 'package:notetakingapp/core/network/connection_service.dart';
import 'package:notetakingapp/core/services/local_note_service.dart';
import 'package:notetakingapp/core/theme/app_colors.dart';
import 'package:notetakingapp/core/theme/bloc/theme_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_bloc.dart';
import 'package:notetakingapp/features/auth/bloc/auth/auth_event.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(context),
              SizedBox(height: 32.h),

              // Preferences Section
              _buildSection(
                context: context,
                title: 'Preferences'.localized,
                children: [
                  _buildPreferenceItem(
                    context: context,
                    icon: Icons.palette_outlined,
                    title: 'Theme'.localized,
                    subtitle:
                        context.watch<ThemeBloc>().state.themeMode ==
                            ThemeMode.dark
                        ? 'Dark'
                        : 'Light',
                    onTap: () {
                      final bloc = context.read<ThemeBloc>();
                      final mode = bloc.state.themeMode;
                      final next = mode == ThemeMode.dark
                          ? ThemeMode.light
                          : ThemeMode.dark;
                      bloc.add(ThemeEvent.changed(next));
                    },
                  ),
                  _buildPreferenceItem(
                    context: context,
                    icon: Icons.language_outlined,
                    title: 'Language'.localized,
                    subtitle: _languageDisplay(
                      LocalizationManager.getCurrentLanguage(),
                    ),
                    onTap: () => _showLanguageSheet(context),
                  ),
                ],
              ),

              SizedBox(height: 32.h),

              // About Section
              _buildSection(
                context: context,
                title: 'About'.localized,
                children: [
                  _buildAboutItem(
                    context: context,
                    icon: Icons.info_outline,
                    title: 'About Notetaking App'.localized,
                    onTap: () {},
                    subtitle: 'v1.0.0',
                  ),
                  _buildLastSyncItem(context),
                  _buildConnectionIndicator(context),
                ],
              ),

              SizedBox(height: 32.h),

              // Logout Section
              _buildLogoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConnectionIndicator(BuildContext context) {
    final service = sl<ConnectionService>();
    return StreamBuilder<bool>(
      stream: service.connectionStream,
      initialData: service.isConnected,
      builder: (context, snapshot) {
        final connected = snapshot.data ?? false;
        return ListTile(
          leading: Icon(
            connected ? Icons.wifi : Icons.wifi_off,
            color: connected ? Colors.green : Colors.red,
          ),
          title: Text('Connection status'.localized),
          subtitle: Text(
            connected ? 'Online'.localized : 'Offline'.localized,
          ),
        );
      },
    );
  }

  String _languageDisplay(String? code) {
    switch (code) {
      case 'tr-TR':
      case 'tr':
        return 'Türkçe';
      case 'en-US':
      case 'en':
        return 'English';
      default:
        return code ?? 'English';
    }
  }

  void _showLanguageSheet(BuildContext context) {
    final supported = LocalizationManager.getSupportedLanguages().toList();
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final code in supported)
                ListTile(
                  title: Text(_languageDisplay(code)),
                  trailing: LocalizationManager.getCurrentLanguage() == code
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    LocalizationManager.changeLanguage(code);
                    Navigator.of(ctx).pop();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLastSyncItem(BuildContext context) {
    return FutureBuilder<DateTime?>(
      future: sl<LocalNoteService>().getLastSyncTime(),
      builder: (context, snapshot) {
        final date = snapshot.data;
        final subtitle = _formatLastSync(date);
        return ListTile(
          leading: const Icon(Icons.sync),
          title: Text('Last sync'.localized),
          subtitle: Text(subtitle),
        );
      },
    );
  }

  String _formatLastSync(DateTime? dt) {
    if (dt == null) return 'Never'.localized;
    final local = dt.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    final y = local.year.toString();
    final m = two(local.month);
    final d = two(local.day);
    final hh = two(local.hour);
    final mm = two(local.minute);
    return '$y-$m-$d $hh:$mm';
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        // Ortalanmış başlık
        Center(
          child: Text(
            'Settings'.localized,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Sola yaslı geri butonu
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () => context.router.maybePop(),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
      ],
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required List<Widget> children,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.localized,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        Card(
          elevation: 8,
          color: isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF5F5F5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              for (int i = 0; i < children.length; i++) ...[
                // Her satır
                children[i],
                // Sonuncu değilse divider
                if (i != children.length - 1) const Divider(height: 1),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreferenceItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title.localized,
        style: TextStyle(fontSize: 16.sp),
      ),
      // Sağ tarafa metin + ikon (veya özel trailing) yerleştir
      trailing:
          trailing ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (subtitle != null)
                Text(
                  subtitle.localized,
                  style: TextStyle(fontSize: 12.sp, color: AppColors.grey),
                ),
              SizedBox(width: 8.h),
              Icon(Icons.arrow_forward_ios, size: 16.h),
            ],
          ),
      onTap: onTap,
    );
  }

  Widget _buildAboutItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8.h),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
      title: Text(title.localized),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 8,
      color: isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF5F5F5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(8.h),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Icon(
              Icons.logout,
              color: Colors.white,
              size: 20.h,
            ),
          ),
          title: Text(
            'Logout'.localized,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.red,
            ),
          ),
          onTap: () {
            _showLogoutDialog(context);
          },
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'.localized),
          content: Text('Are you sure you want to logout?'.localized),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'.localized),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<AuthBloc>().add(const AuthEvent.logout());
              },
              child: Text('Logout'.localized),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Profile', style: TextStyle(color: AppTheme.textPrimary, fontSize: 26, fontWeight: FontWeight.w800)),
          Container(width: 42, height: 42, decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.settings_outlined, color: AppTheme.textPrimary, size: 20)),
        ]),
        const SizedBox(height: 24),
        Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(20)), child: Column(children: [
          Row(children: [
            Container(width: 64, height: 64, decoration: BoxDecoration(color: AppTheme.primary.withOpacity(0.2), shape: BoxShape.circle, border: Border.all(color: AppTheme.primary, width: 2)),
              child: const Icon(Icons.person, color: AppTheme.primary, size: 34)),
            const SizedBox(width: 16),
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Alex Johnson', style: TextStyle(color: AppTheme.textPrimary, fontSize: 18, fontWeight: FontWeight.w800)),
              SizedBox(height: 4),
              Text('Keep pushing your limits!', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
            ])),
            const Icon(Icons.edit_outlined, color: AppTheme.primary, size: 20),
          ]),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _s('Age','28'), _div(), _s('Height','175 cm'), _div(), _s('Weight','72.5 kg'), _div(), _s('BMI','23.7'),
          ]),
        ])),
        const SizedBox(height: 24),
        Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(18)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Goals', style: TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w700, fontSize: 16)),
            Text('Edit', style: TextStyle(color: AppTheme.primary, fontSize: 13, fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(height: 14),
          const Text('Lose Weight', style: TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          const Text('Target: 68 kg', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(4), child: const LinearProgressIndicator(value: 0.72, minHeight: 8, backgroundColor: AppTheme.surfaceLighter, valueColor: AlwaysStoppedAnimation(AppTheme.primary)))),
            const SizedBox(width: 12),
            const Text('72%', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.w700, fontSize: 13)),
          ]),
        ])),
        const SizedBox(height: 24),
        Container(decoration: BoxDecoration(color: AppTheme.surfaceLight, borderRadius: BorderRadius.circular(18)), child: Column(children: [
          Icons.emoji_events_outlined, Icons.shield_outlined, Icons.history,
          Icons.straighten, Icons.settings_outlined, Icons.help_outline,
        ].asMap().entries.map((e) {
          const labels = ['Achievements','Badges','Workout History','Measurements','Settings','Help & Support'];
          return Column(children: [
            ListTile(
              leading: Icon(e.value, color: AppTheme.textSecondary, size: 22),
              title: Text(labels[e.key], style: const TextStyle(color: AppTheme.textPrimary, fontSize: 15)),
              trailing: const Icon(Icons.arrow_forward_ios, color: AppTheme.textMuted, size: 14),
              onTap: () {},
            ),
            if (e.key < 5) Divider(height: 1, color: AppTheme.surfaceLighter, indent: 56),
          ]);
        }).toList())),
      ]))),
    );
  }

  Widget _s(String l, String v) => Column(children: [
    Text(v, style: const TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w800, fontSize: 16)),
    const SizedBox(height: 2),
    Text(l, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
  ]);
  Widget _div() => Container(width: 1, height: 32, color: AppTheme.surfaceLighter);
}

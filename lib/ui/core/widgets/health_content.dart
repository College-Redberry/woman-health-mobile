import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woman_health/ui/core/theme/app_theme.dart';

class HealthSection {
  final String title;
  final List<String>? paragraphs;
  final List<String>? bullets;
  final bool highlight;

  const HealthSection({
    required this.title,
    this.paragraphs,
    this.bullets,
    this.highlight = false,
  });
}

class HealthContent extends StatelessWidget {
  final List<String>? intro;
  final List<HealthSection> sections;
  final String? warning;
  final List<String>? references;

  const HealthContent({
    super.key,
    this.intro,
    this.sections = const [],
    this.warning,
    this.references,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (intro != null && intro!.isNotEmpty)
            _Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: intro!
                    .map((p) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            p,
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                              height: 1.5,
                              color: AppColors.foreground.withValues(alpha: 0.85),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          if (intro != null && intro!.isNotEmpty)
            const SizedBox(height: 12),
          ...sections.expand((s) => [
                _SectionCard(section: s),
                const SizedBox(height: 12),
              ]),
          if (warning != null) _WarningCard(text: warning!),
          if (references != null && references!.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Referências',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w800,
                fontSize: 14,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 6),
            ...references!.map(
              (r) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  r,
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    color: AppColors.roxo,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final Widget child;
  final Color? background;
  final Border? border;

  const _Card({required this.child, this.background, this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background ?? AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: border,
        boxShadow: background == null
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}

class _SectionCard extends StatelessWidget {
  final HealthSection section;

  const _SectionCard({required this.section});

  @override
  Widget build(BuildContext context) {
    final highlighted = section.highlight;
    return _Card(
      background: highlighted ? AppColors.rosaLight : null,
      border: highlighted
          ? Border.all(color: AppColors.rosa.withValues(alpha: 0.4))
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w800,
              fontSize: 15,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          if (section.paragraphs != null)
            ...section.paragraphs!.map(
              (p) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  p,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    height: 1.5,
                    color: AppColors.foreground.withValues(alpha: 0.85),
                  ),
                ),
              ),
            ),
          if (section.bullets != null)
            ...section.bullets!.map(
              (b) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7, right: 8),
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: AppColors.rosa,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        b,
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          height: 1.45,
                          color: AppColors.foreground.withValues(alpha: 0.85),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _WarningCard extends StatelessWidget {
  final String text;
  const _WarningCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return _Card(
      background: AppColors.accent.withValues(alpha: 0.6),
      border: Border.all(color: AppColors.accent),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.warning_amber_rounded, color: AppColors.roxo),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.nunito(
                fontSize: 12,
                height: 1.5,
                color: AppColors.accentFg,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

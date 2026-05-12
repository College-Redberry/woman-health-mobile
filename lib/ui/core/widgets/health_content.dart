import 'package:flutter/material.dart';

class HealthSection {
  final String title;
  final List<String>? paragraphs;
  final List<String>? bullets;

  const HealthSection({
    required this.title,
    this.paragraphs,
    this.bullets,
  });
}

class HealthContent extends StatelessWidget {
  final String title;
  final List<String>? intro;
  final List<HealthSection> sections;
  final String? warning;
  final List<String>? references;

  const HealthContent({
    super.key,
    required this.title,
    this.intro,
    this.sections = const [],
    this.warning,
    this.references,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (intro != null)
                ...intro!.map((p) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(p, style: const TextStyle(fontSize: 16)),
                    )),
              ...sections.map((s) => _SectionView(section: s)),
              if (warning != null) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.amber.shade700),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.warning_amber_rounded, color: Colors.orange),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          warning!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (references != null && references!.isNotEmpty) ...[
                const SizedBox(height: 20),
                const Text(
                  'Referências',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                ...references!.map((r) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        r,
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    )),
              ],
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionView extends StatelessWidget {
  final HealthSection section;

  const _SectionView({required this.section});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          if (section.paragraphs != null)
            ...section.paragraphs!.map((p) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(p, style: const TextStyle(fontSize: 15)),
                )),
          if (section.bullets != null)
            ...section.bullets!.map((b) => Padding(
                  padding: const EdgeInsets.only(bottom: 4, left: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('•  ', style: TextStyle(fontSize: 15)),
                      Expanded(
                        child: Text(b, style: const TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),
                )),
        ],
      ),
    );
  }
}

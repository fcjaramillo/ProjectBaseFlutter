import 'package:flutter/material.dart' hide Colors;
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';
import '../../../../ui/widgets/organisms/organisms.dart';

class CitizenInvestmentScreen extends StatefulWidget {
  const CitizenInvestmentScreen({super.key});

  @override
  State<CitizenInvestmentScreen> createState() =>
      _CitizenInvestmentScreenState();
}

class _CitizenInvestmentScreenState extends State<CitizenInvestmentScreen> {
  static const double _totalBudget = 830000000000; // 830 mil millones COP
  final Map<String, int> _selections = <String, int>{};

  final List<Map<String, dynamic>> _projects = <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 'hospital',
      'name': 'Hospital de nivel 2',
      'description': 'Hospital completo con urgencias y especialidades',
      'unitCost': 50000000000.0, // 50 mil millones
      'icon': Iconsax.hospital,
      'category': 'Salud',
      'maxQuantity': 5,
    },
    <String, dynamic>{
      'id': 'centro_salud',
      'name': 'Centro de salud barrial',
      'description': 'Atencion primaria en cada comuna',
      'unitCost': 2000000000.0, // 2 mil millones
      'icon': Iconsax.health,
      'category': 'Salud',
      'maxQuantity': 20,
    },
    <String, dynamic>{
      'id': 'colegio',
      'name': 'Colegio con infraestructura completa',
      'description': 'Institucion educativa de calidad',
      'unitCost': 15000000000.0, // 15 mil millones
      'icon': Iconsax.teacher,
      'category': 'Educacion',
      'maxQuantity': 10,
    },
    <String, dynamic>{
      'id': 'biblioteca',
      'name': 'Biblioteca publica',
      'description': 'Espacio de lectura y aprendizaje',
      'unitCost': 3000000000.0, // 3 mil millones
      'icon': Iconsax.book,
      'category': 'Educacion',
      'maxQuantity': 15,
    },
    <String, dynamic>{
      'id': 'km_via',
      'name': 'Kilometro de via pavimentada',
      'description': 'Vias de calidad para los barrios',
      'unitCost': 2500000000.0, // 2.5 mil millones
      'icon': Iconsax.routing,
      'category': 'Movilidad',
      'maxQuantity': 50,
    },
    <String, dynamic>{
      'id': 'cicloruta',
      'name': 'Kilometro de cicloruta',
      'description': 'Movilidad sostenible',
      'unitCost': 800000000.0, // 800 millones
      'icon': Iconsax.activity,
      'category': 'Movilidad',
      'maxQuantity': 30,
    },
    <String, dynamic>{
      'id': 'cai',
      'name': 'CAI con tecnologia',
      'description': 'Comando de atencion inmediata',
      'unitCost': 1500000000.0, // 1.5 mil millones
      'icon': Iconsax.shield_tick,
      'category': 'Seguridad',
      'maxQuantity': 20,
    },
    <String, dynamic>{
      'id': 'camaras',
      'name': 'Sistema de 50 camaras',
      'description': 'Vigilancia con inteligencia artificial',
      'unitCost': 2000000000.0, // 2 mil millones
      'icon': Iconsax.video,
      'category': 'Seguridad',
      'maxQuantity': 10,
    },
    <String, dynamic>{
      'id': 'parque',
      'name': 'Parque recreativo',
      'description': 'Espacio verde para la comunidad',
      'unitCost': 1000000000.0, // 1 mil millones
      'icon': Iconsax.tree,
      'category': 'Cultura',
      'maxQuantity': 25,
    },
    <String, dynamic>{
      'id': 'centro_cultural',
      'name': 'Centro cultural y artistico',
      'description': 'Espacio para el arte y la cultura',
      'unitCost': 5000000000.0, // 5 mil millones
      'icon': Iconsax.music,
      'category': 'Cultura',
      'maxQuantity': 10,
    },
    <String, dynamic>{
      'id': 'vivienda',
      'name': 'Proyecto de 100 viviendas VIS',
      'description': 'Vivienda digna para familias',
      'unitCost': 10000000000.0, // 10 mil millones
      'icon': Iconsax.home,
      'category': 'Vivienda',
      'maxQuantity': 15,
    },
    <String, dynamic>{
      'id': 'acueducto',
      'name': 'Sistema de acueducto barrial',
      'description': 'Agua potable para todos',
      'unitCost': 3500000000.0, // 3.5 mil millones
      'icon': Iconsax.drop,
      'category': 'Servicios',
      'maxQuantity': 15,
    },
  ];

  double get _totalSelected {
    double total = 0;
    for (final MapEntry<String, int> entry in _selections.entries) {
      final Map<String, dynamic> project = _projects.firstWhere(
        (Map<String, dynamic> p) => p['id'] == entry.key,
      );
      total += (project['unitCost'] as double) * entry.value;
    }
    return total;
  }

  double get _remainingBudget => _totalBudget - _totalSelected;

  String _formatCurrency(double amount) {
    if (amount >= 1000000000000) {
      return '${(amount / 1000000000000).toStringAsFixed(1)} billones';
    } else if (amount >= 1000000000) {
      return '${(amount / 1000000000).toStringAsFixed(0)} mil millones';
    } else if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(0)} millones';
    }
    return NumberFormat.currency(locale: 'es_CO', symbol: r'$').format(amount);
  }

  void _updateSelection(String projectId, int quantity) {
    final Map<String, dynamic> project = _projects.firstWhere(
      (Map<String, dynamic> p) => p['id'] == projectId,
    );
    final double projectCost = project['unitCost'] as double;
    final int currentQty = _selections[projectId] ?? 0;
    final double newTotal =
        _totalSelected - (projectCost * currentQty) + (projectCost * quantity);

    if (newTotal <= _totalBudget) {
      setState(() {
        if (quantity > 0) {
          _selections[projectId] = quantity;
        } else {
          _selections.remove(projectId);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;
    final bool isTablet = responsive.width >= 768 && responsive.width < 1200;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeroSection(context, isMobile),
        _buildBudgetCounter(context, isMobile),
        _buildProjectsSection(context, isMobile, isTablet),
        _buildSummarySection(context, isMobile),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Theme.of(context).appColors.primary.strong,
            Theme.of(context).appColors.secondary.strong,
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          BaseText.noChangeSubtle(
            'TU POPAYAN',
            style: TypoSecondary.b2r.copyWith(letterSpacing: 3),
          ),
          const SizedBox(height: 16),
          BaseText.noChangeSubtle(
            'Decide Como Invertir',
            style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: BaseText.noChangeSubtle(
              'Tienes 830 mil millones de pesos para invertir en Popayan. '
              'Elige los proyectos que consideras prioritarios y construye '
              'tu vision de ciudad.',
              style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetCounter(BuildContext context, bool isMobile) {
    final double percentage = (_totalSelected / _totalBudget) * 100;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 32,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.neutral.subtle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).appColors.opacity.base,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseText(
                    'Presupuesto restante',
                    style: TypoSecondary.b3r.copyWith(
                      color: Theme.of(context).appColors.text.scale.soft,
                    ),
                  ),
                  BaseText(
                    _formatCurrency(_remainingBudget),
                    style: TypoPrimary.h3.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _remainingBudget > 0
                          ? Theme.of(context).appColors.success.strong
                          : Theme.of(context).appColors.error.strong,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  BaseText(
                    'Invertido',
                    style: TypoSecondary.b3r.copyWith(
                      color: Theme.of(context).appColors.text.scale.soft,
                    ),
                  ),
                  BaseText(
                    _formatCurrency(_totalSelected),
                    style: TypoPrimary.h4.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).appColors.primary.strong,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 12,
              backgroundColor: Theme.of(context).appColors.neutral.soft,
              valueColor: AlwaysStoppedAnimation<Color>(
                percentage < 80
                    ? Theme.of(context).appColors.success.strong
                    : percentage < 100
                        ? Theme.of(context).appColors.warning.strong
                        : Theme.of(context).appColors.error.strong,
              ),
            ),
          ),
          const SizedBox(height: 8),
          BaseText(
            '${percentage.toStringAsFixed(1)}% del presupuesto utilizado',
            style: TypoSecondary.b4r.copyWith(
              color: Theme.of(context).appColors.text.scale.soft,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection(
      BuildContext context, bool isMobile, bool isTablet) {
    final Map<String, List<Map<String, dynamic>>> groupedProjects =
        <String, List<Map<String, dynamic>>>{};

    for (final Map<String, dynamic> project in _projects) {
      final String category = project['category'] as String;
      groupedProjects.putIfAbsent(category, () => <Map<String, dynamic>>[]);
      groupedProjects[category]!.add(project);
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionHeader(
            title: 'Proyectos Disponibles',
            subtitle: 'Selecciona la cantidad de cada proyecto que deseas.',
          ),
          const SizedBox(height: 32),
          ...groupedProjects.entries.map(
            (MapEntry<String, List<Map<String, dynamic>>> entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseText(
                    entry.key,
                    style:
                        TypoSubtitles.s1.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ...entry.value.map(
                    (Map<String, dynamic> project) => _ProjectCard(
                      id: project['id'] as String,
                      name: project['name'] as String,
                      description: project['description'] as String,
                      unitCost: project['unitCost'] as double,
                      icon: project['icon'] as IconData,
                      maxQuantity: project['maxQuantity'] as int,
                      selectedQuantity: _selections[project['id']] ?? 0,
                      remainingBudget: _remainingBudget,
                      onQuantityChanged: (int qty) =>
                          _updateSelection(project['id'] as String, qty),
                      formatCurrency: _formatCurrency,
                      isMobile: isMobile,
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSummarySection(BuildContext context, bool isMobile) {
    if (_selections.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.tertiary.subtle,
      ),
      child: Column(
        children: <Widget>[
          Icon(
            Iconsax.receipt_1,
            size: 48,
            color: Theme.of(context).appColors.primary.strong,
          ),
          const SizedBox(height: 24),
          BaseText(
            'Tu Inversion en Popayan',
            style: TypoPrimary.h3.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).appColors.neutral.subtle,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: <Widget>[
                  ..._selections.entries.map(
                    (MapEntry<String, int> entry) {
                      final Map<String, dynamic> project = _projects.firstWhere(
                        (Map<String, dynamic> p) => p['id'] == entry.key,
                      );
                      final double subtotal =
                          (project['unitCost'] as double) * entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: BaseText(
                                '${entry.value}x ${project['name']}',
                                style: TypoSecondary.b2r,
                              ),
                            ),
                            BaseText(
                              _formatCurrency(subtotal),
                              style: TypoSecondary.b2r
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      BaseText(
                        'TOTAL INVERTIDO',
                        style:
                            TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
                      ),
                      BaseText.primary(
                        _formatCurrency(_totalSelected),
                        style:
                            TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Save to Supabase
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Tu inversion ha sido registrada'),
                  backgroundColor: Theme.of(context).appColors.success.strong,
                ),
              );
            },
            icon: const Icon(Iconsax.tick_circle),
            label: const Text('Guardar mi inversion'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).appColors.primary.strong,
              foregroundColor:
                  Theme.of(context).appColors.neutralNoChange.subtle,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 32 : 48,
                vertical: isMobile ? 16 : 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.id,
    required this.name,
    required this.description,
    required this.unitCost,
    required this.icon,
    required this.maxQuantity,
    required this.selectedQuantity,
    required this.remainingBudget,
    required this.onQuantityChanged,
    required this.formatCurrency,
    required this.isMobile,
  });

  final String id;
  final String name;
  final String description;
  final double unitCost;
  final IconData icon;
  final int maxQuantity;
  final int selectedQuantity;
  final double remainingBudget;
  final void Function(int) onQuantityChanged;
  final String Function(double) formatCurrency;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final bool canAdd =
        remainingBudget >= unitCost && selectedQuantity < maxQuantity;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.neutral.subtle,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selectedQuantity > 0
              ? Theme.of(context).appColors.primary.strong
              : Theme.of(context).appColors.neutral.soft,
          width: selectedQuantity > 0 ? 2 : 1,
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).appColors.primary.soft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 24,
              color: Theme.of(context).appColors.primary.strong,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BaseText(
                  name,
                  style: TypoSecondary.b2r.copyWith(fontWeight: FontWeight.bold),
                ),
                BaseText(
                  description,
                  style: TypoSecondary.b4r.copyWith(
                    color: Theme.of(context).appColors.text.scale.soft,
                  ),
                ),
                const SizedBox(height: 4),
                BaseText.primary(
                  formatCurrency(unitCost),
                  style: TypoSecondary.b3r.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Quantity controls
          Row(
            children: <Widget>[
              IconButton(
                onPressed: selectedQuantity > 0
                    ? () => onQuantityChanged(selectedQuantity - 1)
                    : null,
                icon: const Icon(Iconsax.minus),
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).appColors.neutral.soft,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: BaseText(
                  selectedQuantity.toString(),
                  style: TypoSubtitles.s1.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed:
                    canAdd ? () => onQuantityChanged(selectedQuantity + 1) : null,
                icon: const Icon(Iconsax.add),
                style: IconButton.styleFrom(
                  backgroundColor: canAdd
                      ? Theme.of(context).appColors.primary.soft
                      : Theme.of(context).appColors.neutral.soft,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

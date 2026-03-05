part of 'citizen_investment_screen.dart';

class CitizenInvestmentScreen extends ConsumerStatefulWidget {
  const CitizenInvestmentScreen({super.key});

  @override
  ConsumerState<CitizenInvestmentScreen> createState() =>
      _CitizenInvestmentScreenState();
}

class _CitizenInvestmentScreenState
    extends ConsumerState<CitizenInvestmentScreen> {
  String _formatCurrency(int amount) {
    final double amountD = amount.toDouble();
    if (amountD >= 1000000000000) {
      return '${(amountD / 1000000000000).toStringAsFixed(1)} billones';
    } else if (amountD >= 1000000000) {
      return '${(amountD / 1000000000).toStringAsFixed(0)} mil millones';
    } else if (amountD >= 1000000) {
      return '${(amountD / 1000000).toStringAsFixed(0)} millones';
    }
    return NumberFormat.currency(locale: 'es_CO', symbol: r'$')
        .format(amountD);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(citizenInvestmentViewModelProvider.notifier)
          .loadProjects();
    });
  }

  @override
  Widget build(BuildContext context) {
    final CitizenInvestmentState investState =
        ref.watch(citizenInvestmentViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;
    final bool isTablet =
        responsive.width >= 768 && responsive.width < 1200;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeroSection(context, isMobile),
        _buildBudgetCounter(context, isMobile, investState),
        _buildProjectsSection(context, isMobile, isTablet, investState),
        _buildSummarySection(context, isMobile, investState),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) => Container(
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

  Widget _buildBudgetCounter(
    BuildContext context,
    bool isMobile,
    CitizenInvestmentState investState,
  ) {
    final double percentage = investState.percentUsed;

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
                    _formatCurrency(investState.remainingBudget),
                    style: TypoPrimary.h3.copyWith(
                      fontWeight: FontWeight.bold,
                      color: investState.remainingBudget > 0
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
                    _formatCurrency(investState.totalInvested),
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
    BuildContext context,
    bool isMobile,
    bool isTablet,
    CitizenInvestmentState investState,
  ) {
    if (investState.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (investState.error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: BaseText(
            investState.error!,
            style: TypoSecondary.b2r,
          ),
        ),
      );
    }

    final Map<String, List<InvestmentProject>> groupedProjects =
        <String, List<InvestmentProject>>{};

    for (final InvestmentProject project in investState.projects) {
      final String category = project.category ?? 'General';
      groupedProjects.putIfAbsent(
          category, () => <InvestmentProject>[]);
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
            (MapEntry<String, List<InvestmentProject>> entry) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BaseText(
                  entry.key,
                  style: TypoSubtitles.s1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ...entry.value.map(
                  (InvestmentProject project) => _ProjectCard(
                    project: project,
                    selectedQuantity:
                        investState.quantities[project.id] ?? 0,
                    remainingBudget: investState.remainingBudget,
                    onQuantityChanged: (int qty) => ref
                        .read(citizenInvestmentViewModelProvider.notifier)
                        .updateQuantity(project.id, qty),
                    formatCurrency: _formatCurrency,
                    isMobile: isMobile,
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummarySection(
    BuildContext context,
    bool isMobile,
    CitizenInvestmentState investState,
  ) {
    if (investState.quantities.isEmpty) {
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
                  ...investState.quantities.entries.map(
                    (MapEntry<String, int> entry) {
                      final InvestmentProject? project = investState.projects
                          .where(
                              (InvestmentProject p) => p.id == entry.key)
                          .firstOrNull;
                      if (project == null) {
                        return const SizedBox.shrink();
                      }
                      final int subtotal = project.unitCost * entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: BaseText(
                                '${entry.value}x ${project.name}',
                                style: TypoSecondary.b2r,
                              ),
                            ),
                            BaseText(
                              _formatCurrency(subtotal),
                              style: TypoSecondary.b2r.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
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
                        style: TypoSubtitles.s2
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      BaseText.primary(
                        _formatCurrency(investState.totalInvested),
                        style: TypoPrimary.h4
                            .copyWith(fontWeight: FontWeight.bold),
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Tu inversion ha sido registrada'),
                  backgroundColor:
                      Theme.of(context).appColors.success.strong,
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
    required this.project,
    required this.selectedQuantity,
    required this.remainingBudget,
    required this.onQuantityChanged,
    required this.formatCurrency,
    required this.isMobile,
  });

  final InvestmentProject project;
  final int selectedQuantity;
  final int remainingBudget;
  final void Function(int) onQuantityChanged;
  final String Function(int) formatCurrency;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final bool canAdd = remainingBudget >= project.unitCost &&
        selectedQuantity < project.maxQuantity;

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
              Iconsax.building,
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
                  project.name,
                  style: TypoSecondary.b2r
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                if (project.description != null)
                  BaseText(
                    project.description!,
                    style: TypoSecondary.b4r.copyWith(
                      color:
                          Theme.of(context).appColors.text.scale.soft,
                    ),
                  ),
                const SizedBox(height: 4),
                BaseText.primary(
                  project.formattedCost,
                  style: TypoSecondary.b3r
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: selectedQuantity > 0
                    ? () => onQuantityChanged(selectedQuantity - 1)
                    : null,
                icon: const Icon(Iconsax.minus),
                style: IconButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).appColors.neutral.soft,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: BaseText(
                  selectedQuantity.toString(),
                  style: TypoSubtitles.s1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: canAdd
                    ? () => onQuantityChanged(selectedQuantity + 1)
                    : null,
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

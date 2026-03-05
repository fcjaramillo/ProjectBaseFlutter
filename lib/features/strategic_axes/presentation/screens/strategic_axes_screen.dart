library;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../typing/entities/campaign/strategic_axis.dart';
import '../../../../typing/extensions/extensions.dart';
import '../../../../typing/result/result.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/routes/routes.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';
import '../../domain/dependencies/dependencies.dart';

part 'strategic_axes_screen.g.dart';

// ---------------------------------------------------------------------------
// State
// ---------------------------------------------------------------------------

class StrategicAxesState {
  StrategicAxesState({
    required this.axes,
    required this.isLoading,
    this.error,
  });

  final List<StrategicAxis> axes;
  final bool isLoading;
  final String? error;

  factory StrategicAxesState.initial() => StrategicAxesState(
        axes: <StrategicAxis>[],
        isLoading: false,
      );

  StrategicAxesState copyWith({
    List<StrategicAxis>? axes,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) =>
      StrategicAxesState(
        axes: axes ?? this.axes,
        isLoading: isLoading ?? this.isLoading,
        error: clearError ? null : error ?? this.error,
      );
}

// ---------------------------------------------------------------------------
// ViewModel
// ---------------------------------------------------------------------------

@riverpod
class StrategicAxesViewModel extends _$StrategicAxesViewModel {
  @override
  StrategicAxesState build() => StrategicAxesState.initial();

  Future<void> loadAxes() async {
    state = state.copyWith(isLoading: true, clearError: true);

    final ResultDef<List<StrategicAxis>> result =
        await ref.read(getStrategicAxesUseCaseProvider).call();

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al cargar los ejes estrategicos',
        );
      },
      success: (List<StrategicAxis> axes) {
        state = state.copyWith(isLoading: false, axes: axes);
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class StrategicAxesScreen extends ConsumerStatefulWidget {
  const StrategicAxesScreen({super.key});

  @override
  ConsumerState<StrategicAxesScreen> createState() =>
      _StrategicAxesScreenState();
}

class _StrategicAxesScreenState extends ConsumerState<StrategicAxesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(strategicAxesViewModelProvider.notifier).loadAxes();
    });
  }

  IconData _getAxisIcon(String? iconName) {
    switch (iconName) {
      case 'shield_tick':
        return Iconsax.shield_tick;
      case 'chart':
        return Iconsax.chart;
      case 'teacher':
        return Iconsax.teacher;
      case 'car':
        return Iconsax.car;
      default:
        return Iconsax.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    final StrategicAxesState axesState =
        ref.watch(strategicAxesViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeroSection(context, isMobile),
        _buildIntroSection(context, isMobile),
        _buildAxesSection(context, isMobile, axesState),
        _buildCtaSection(context, isMobile),
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
            'PLAN DE GOBIERNO',
            style: TypoSecondary.b2r.copyWith(letterSpacing: 3),
          ),
          const SizedBox(height: 16),
          BaseText.noChangeSubtle(
            'Ejes Estrategicos',
            style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: BaseText.noChangeSubtle(
              'Nuestra propuesta se fundamenta en pilares esenciales '
              'para transformar Popayan en la ciudad que merecemos.',
              style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: BaseText(
          'Cada eje estrategico representa un area fundamental para el '
          'desarrollo de nuestra ciudad. Hemos identificado los principales '
          'desafios y diseñado propuestas concretas para abordarlos de manera '
          'integral y sostenible.',
          style: TypoSecondary.b1r.copyWith(height: 1.8),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildAxesSection(
    BuildContext context,
    bool isMobile,
    StrategicAxesState axesState,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      child: axesState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : axesState.error != null
              ? Center(
                  child: BaseText(
                    axesState.error!,
                    style: TypoSecondary.b2r,
                  ),
                )
              : axesState.axes.isEmpty
                  ? Center(
                      child: BaseText(
                        'No hay ejes estrategicos disponibles.',
                        style: TypoSecondary.b2r,
                      ),
                    )
                  : Column(
                      children: axesState.axes
                          .asMap()
                          .entries
                          .map(
                            (MapEntry<int, StrategicAxis> entry) =>
                                _AxisDetailCard(
                              icon: _getAxisIcon(entry.value.icon),
                              title: entry.value.title,
                              subtitle: entry.value.description ?? '',
                              description: entry.value.description ?? '',
                              color: entry.value.color ??
                                  Theme.of(context).appColors.primary.strong,
                              isReversed: !isMobile && entry.key.isOdd,
                              isMobile: isMobile,
                            ),
                          )
                          .toList(),
                    ),
    );
  }

  Widget _buildCtaSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.secondary.strong,
      ),
      child: Column(
        children: <Widget>[
          BaseText.noChangeSubtle(
            'CONOCE LAS PROPUESTAS EN DETALLE',
            style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 16 : 24),
          BaseText.noChangeSubtle(
            'Explora cada una de nuestras propuestas y descubre como '
            'vamos a transformar Popayan.',
            style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 32 : 48),
          ElevatedButton.icon(
            onPressed: () => context.go(Routes.proposals),
            icon: const Icon(Iconsax.document_text),
            label: const Text('Ver todas las propuestas'),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).appColors.neutralNoChange.subtle,
              foregroundColor:
                  Theme.of(context).appColors.secondary.strong,
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

// ---------------------------------------------------------------------------
// Private widget
// ---------------------------------------------------------------------------

class _AxisDetailCard extends StatelessWidget {
  const _AxisDetailCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
    required this.isReversed,
    required this.isMobile,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String description;
  final Color color;
  final bool isReversed;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final Widget iconSection = Container(
      width: isMobile ? double.infinity : 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              size: 48,
              color: Theme.of(context).appColors.neutralNoChange.subtle,
            ),
          ),
          const SizedBox(height: 20),
          BaseText(
            title,
            style: TypoPrimary.h4.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          BaseText(
            subtitle,
            style: TypoSecondary.b2r.copyWith(
              color: Theme.of(context).appColors.text.scale.soft,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    final Widget contentSection = Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 0 : 32,
          vertical: isMobile ? 24 : 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BaseText(
              description,
              style: TypoSecondary.b1r.copyWith(height: 1.6),
            ),
          ],
        ),
      ),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 48),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.neutral.subtle,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).appColors.neutral.soft,
        ),
      ),
      child: isMobile
          ? Column(
              children: <Widget>[
                iconSection,
                contentSection,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: isReversed
                  ? <Widget>[contentSection, iconSection]
                  : <Widget>[iconSection, contentSection],
            ),
    );
  }
}

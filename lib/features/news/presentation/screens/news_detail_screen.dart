import 'package:flutter/material.dart' hide Colors;
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/routes/routes.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({required this.newsId, super.key});

  final String newsId;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    // Mock data
    final Map<String, dynamic> news = _getNewsById(newsId);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildHeader(context, isMobile, news),
          _buildContent(context, isMobile, news),
          _buildShareSection(context, isMobile),
          _buildRelatedNews(context, isMobile),
        ],
      ),
    );
  }

  Map<String, dynamic> _getNewsById(String id) => <String, dynamic>{
    'id': id,
    'title': 'William Campino presenta plan de seguridad integral',
    'category': 'Propuestas',
    'date': DateTime.now().subtract(const Duration(days: 1)),
    'content': '''
En una rueda de prensa realizada en el Centro de Convenciones de Popayan, el candidato a la alcaldia William Campino presento las principales propuestas de seguridad ciudadana que implementara de llegar a la administracion municipal.

El plan integral de seguridad contempla una inversion de mas de 45 mil millones de pesos en cuatro años , con enfasis en tecnologia, presencia policial y participacion ciudadana.

"La seguridad no es solo un tema de mas policias en las calles. Se trata de un enfoque integral que incluye prevencion, tecnologia y trabajo conjunto con la comunidad", afirmo Campino durante la presentacion.

Entre las principales propuestas se destacan:

La instalacion de 500 camaras de vigilancia con inteligencia artificial en los puntos criticos de la ciudad, conectadas a un centro de monitoreo que operara las 24 horas.

La construccion de 15 nuevos Comandos de Atencion Inmediata (CAI) dotados con tecnologia de punta para garantizar una respuesta rapida ante cualquier emergencia.

La implementacion de un sistema de patrullaje inteligente basado en analisis de datos que permita anticipar y prevenir delitos antes de que ocurran.

El fortalecimiento de los frentes de seguridad barriales con capacitacion y herramientas tecnologicas para que los ciudadanos puedan reportar situaciones sospechosas en tiempo real.

La propuesta ha sido bien recibida por los lideres comunales presentes en el evento, quienes destacaron la importancia de incluir a la comunidad en las estrategias de seguridad.

"Por primera vez vemos un plan que no solo habla de represion sino de prevencion. Eso es lo que necesitamos", comento Maria Elena Rodriguez, presidenta de la Junta de Accion Comunal de la Comuna 3.

El candidato tambien anuncio que de ser elegido, conformara un consejo de seguridad ciudadana con participacion de todos los sectores para hacer seguimiento permanente a la implementacion del plan.
''',
  };

  String _formatDate(DateTime date) {
    final List<String> months = <String>[
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre',
    ];
    return '${date.day} de ${months[date.month - 1]} de ${date.year}';
  }

  Widget _buildHeader(
    BuildContext context,
    bool isMobile,
    Map<String, dynamic> news,
  ) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 80,
      vertical: isMobile ? 40 : 60,
    ),
    decoration: BoxDecoration(
      color: Theme.of(context).appColors.secondary.strong,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Breadcrumb
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () => context.go(Routes.news),
              child: BaseText.noChangeSubtle(
                'Noticias',
                style: TypoSecondary.b3r,
              ),
            ),
            BaseText.noChangeSubtle(' / ', style: TypoSecondary.b3r),
            BaseText.noChangeSubtle(
              news['category'] as String,
              style: TypoSecondary.b3r.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).appColors.primary.strong,
            borderRadius: BorderRadius.circular(20),
          ),
          child: BaseText.noChangeSubtle(
            (news['category'] as String).toUpperCase(),
            style: TypoSecondary.b4r.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        BaseText.noChangeSubtle(
          news['title'] as String,
          style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: <Widget>[
            Icon(
              Iconsax.calendar,
              size: 16,
              color: Theme.of(context).appColors.neutralNoChange.subtle,
            ),
            const SizedBox(width: 8),
            BaseText.noChangeSubtle(
              _formatDate(news['date'] as DateTime),
              style: TypoSecondary.b3r,
            ),
          ],
        ),
      ],
    ),
  );

  Widget _buildContent(
    BuildContext context,
    bool isMobile,
    Map<String, dynamic> news,
  ) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 80,
      vertical: isMobile ? 40 : 60,
    ),
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (news['content'] as String)
            .split('\n\n')
            .where((String p) => p.trim().isNotEmpty)
            .map(
              (String paragraph) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: BaseText(
                  paragraph.trim(),
                  style: TypoSecondary.b1r.copyWith(height: 1.8),
                ),
              ),
            )
            .toList(),
      ),
    ),
  );

  Widget _buildShareSection(BuildContext context, bool isMobile) => Container(
    padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 32),
    decoration: BoxDecoration(
      color: Theme.of(context).appColors.tertiary.subtle,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BaseText(
          'Compartir:',
          style: TypoSecondary.b2r.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.facebook),
          color: Theme.of(context).appColors.primary.strong,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.instagram),
          color: Theme.of(context).appColors.primary.strong,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.message),
          color: Theme.of(context).appColors.primary.strong,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.link),
          color: Theme.of(context).appColors.primary.strong,
        ),
      ],
    ),
  );

  Widget _buildRelatedNews(BuildContext context, bool isMobile) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 80,
      vertical: isMobile ? 40 : 60,
    ),
    child: Column(
      children: <Widget>[
        BaseText(
          'Mas noticias',
          style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        BaseText(
          'Mantente informado sobre nuestra campana.',
          style: TypoSecondary.b2r.copyWith(
            color: Theme.of(context).appColors.text.scale.soft,
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () => context.go(Routes.news),
          icon: const Icon(Iconsax.arrow_left),
          label: const Text('Ver todas las noticias'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).appColors.primary.strong,
            foregroundColor: Theme.of(context).appColors.neutralNoChange.subtle,
          ),
        ),
      ],
    ),
  );
}

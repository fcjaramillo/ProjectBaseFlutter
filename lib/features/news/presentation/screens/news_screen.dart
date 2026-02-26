import 'package:flutter/material.dart' hide Colors;
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';
import '../../../../ui/widgets/organisms/organisms.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String _selectedCategory = 'Todas';

  final List<String> _categories = <String>[
    'Todas',
    'Campana',
    'Propuestas',
    'Eventos',
    'Comunidad',
  ];

  final List<Map<String, dynamic>> _news = <Map<String, dynamic>>[
    <String, dynamic>{
      'title': 'William Campino presenta plan de seguridad integral',
      'summary':
          'En rueda de prensa, el candidato presento las principales '
              'propuestas de seguridad ciudadana que implementara de llegar '
              'a la alcaldia de Popayan.',
      'date': DateTime.now().subtract(const Duration(days: 1)),
      'category': 'Propuestas',
      'imageUrl': null,
      'isFeatured': true,
    },
    <String, dynamic>{
      'title': 'Gran acogida en encuentro con lideres comunales',
      'summary':
          'Mas de 200 presidentes de juntas de accion comunal asistieron '
              'al dialogo con el candidato donde se discutieron las '
              'necesidades de los barrios.',
      'date': DateTime.now().subtract(const Duration(days: 3)),
      'category': 'Eventos',
      'imageUrl': null,
      'isFeatured': false,
    },
    <String, dynamic>{
      'title': 'Campana de voluntariado supera expectativas',
      'summary':
          'El llamado a voluntarios para la campana ha tenido una respuesta '
              'masiva. Ya son mas de 1000 ciudadanos que se han sumado al '
              'equipo de trabajo.',
      'date': DateTime.now().subtract(const Duration(days: 5)),
      'category': 'Campana',
      'imageUrl': null,
      'isFeatured': false,
    },
    <String, dynamic>{
      'title': 'Propuestas de movilidad generan debate ciudadano',
      'summary':
          'Las propuestas de ciclorutas y transporte publico han generado '
              'un amplio debate entre los ciudadanos de Popayan.',
      'date': DateTime.now().subtract(const Duration(days: 7)),
      'category': 'Propuestas',
      'imageUrl': null,
      'isFeatured': false,
    },
    <String, dynamic>{
      'title': 'Recorrido por barrios del sur de la ciudad',
      'summary':
          'William Campino realizo un extenso recorrido por los barrios '
              'de la comuna 8, escuchando a los habitantes y conociendo '
              'sus necesidades.',
      'date': DateTime.now().subtract(const Duration(days: 10)),
      'category': 'Comunidad',
      'imageUrl': null,
      'isFeatured': false,
    },
    <String, dynamic>{
      'title': 'Alianza con sector educativo para mejorar colegios',
      'summary':
          'Se anuncio una alianza con rectores de colegios publicos para '
              'desarrollar un plan de mejoramiento de infraestructura educativa.',
      'date': DateTime.now().subtract(const Duration(days: 12)),
      'category': 'Propuestas',
      'imageUrl': null,
      'isFeatured': false,
    },
    <String, dynamic>{
      'title': 'Jornada de inscripcion de cedulas fue un exito',
      'summary':
          'La jornada de apoyo para la inscripcion de cedulas logro que '
              'cientos de ciudadanos pudieran registrarse para votar.',
      'date': DateTime.now().subtract(const Duration(days: 15)),
      'category': 'Campana',
      'imageUrl': null,
      'isFeatured': false,
    },
    <String, dynamic>{
      'title': 'Comerciantes del centro apoyan propuestas economicas',
      'summary':
          'El gremio de comerciantes del centro historico expreso su '
              'respaldo a las propuestas de reactivacion economica.',
      'date': DateTime.now().subtract(const Duration(days: 18)),
      'category': 'Comunidad',
      'imageUrl': null,
      'isFeatured': false,
    },
  ];

  List<Map<String, dynamic>> get _filteredNews {
    if (_selectedCategory == 'Todas') {
      return _news;
    }
    return _news
        .where((Map<String, dynamic> n) => n['category'] == _selectedCategory)
        .toList();
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
        _buildFilterSection(context, isMobile),
        _buildNewsGrid(context, isMobile, isTablet),
        _buildSubscribeSection(context, isMobile),
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
        color: Theme.of(context).appColors.secondary.strong,
      ),
      child: Column(
        children: <Widget>[
          BaseText.noChangeSubtle(
            'ACTUALIDAD',
            style: TypoSecondary.b2r.copyWith(letterSpacing: 3),
          ),
          const SizedBox(height: 16),
          BaseText.noChangeSubtle(
            'Noticias de la Campana',
            style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: BaseText.noChangeSubtle(
              'Mantente informado sobre las actividades, propuestas y '
              'avances de nuestra campana.',
              style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BaseText(
            'Filtrar por categoria:',
            style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _categories.map((String category) {
              final bool isSelected = _selectedCategory == category;
              return FilterChip(
                label: Text(category),
                selected: isSelected,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
                backgroundColor: Theme.of(context).appColors.neutral.subtle,
                selectedColor: Theme.of(context).appColors.primary.soft,
                checkmarkColor: Theme.of(context).appColors.primary.strong,
                labelStyle: TypoSecondary.b3r.copyWith(
                  color: isSelected
                      ? Theme.of(context).appColors.primary.strong
                      : null,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                side: BorderSide(
                  color: isSelected
                      ? Theme.of(context).appColors.primary.strong
                      : Theme.of(context).appColors.neutral.soft,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsGrid(BuildContext context, bool isMobile, bool isTablet) {
    final int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);
    final List<Map<String, dynamic>> news = _filteredNews;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      child: news.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: BaseText(
                  'No hay noticias en esta categoria.',
                  style: TypoSecondary.b1r,
                ),
              ),
            )
          : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: isMobile ? 1.0 : 0.85,
              ),
              itemCount: news.length,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, dynamic> item = news[index];
                return NewsCard(
                  title: item['title'] as String,
                  summary: item['summary'] as String?,
                  imageUrl: item['imageUrl'] as String?,
                  date: item['date'] as DateTime?,
                  category: item['category'] as String?,
                  isFeatured: item['isFeatured'] as bool,
                  onTap: () {},
                );
              },
            ),
    );
  }

  Widget _buildSubscribeSection(BuildContext context, bool isMobile) {
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
            Iconsax.sms,
            size: 48,
            color: Theme.of(context).appColors.primary.strong,
          ),
          const SizedBox(height: 24),
          BaseText(
            'RECIBE LAS NOTICIAS EN TU CORREO',
            style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 16 : 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: BaseText(
              'Suscribete a nuestro boletin y recibe las ultimas noticias '
              'de la campana directamente en tu correo.',
              style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Tu correo electronico',
                      filled: true,
                      fillColor: Theme.of(context).appColors.neutral.subtle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).appColors.primary.strong,
                    foregroundColor:
                        Theme.of(context).appColors.neutralNoChange.subtle,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Suscribirse'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

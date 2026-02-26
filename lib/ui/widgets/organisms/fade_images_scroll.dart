part of 'organisms.dart';

class FadeImageScrollDelegate extends StatelessWidget {
  final ScrollController scrollController;
  final List<String> images;

  // Altura total del recorrido de la animación
  final double animationHeight = 2000.0;

  const FadeImageScrollDelegate({
    required this.scrollController,
    required this.images,
  });

  double _calculateOpacity(int index, double progress, int total) {
    double segment = 1.0 / (total - 1);
    double targetPos = index * segment;
    double distance = (progress - targetPos).abs();

    // Cross-fade: La imagen es 1.0 solo en su punto exacto del segmento
    double opacity = 1.0 - (distance / segment);
    return opacity.clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Obtenemos la posición de este widget respecto a la pantalla
        final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
        final double offsetTop = renderBox?.localToGlobal(Offset.zero).dy ?? 0;
        final double screenHeight = MediaQuery.of(context).size.height;

        // Calculamos el progreso: 0.0 cuando entra en pantalla, 1.0 cuando termina el recorrido
        // El factor '- offsetTop' hace que la animación dependa de la posición real del widget
        double progress = 0.0;
        if (offsetTop <= 0) {
          progress = (offsetTop.abs() / animationHeight).clamp(0.0, 1.0);
        }

        return SizedBox(
          height: animationHeight + screenHeight, // Espacio para scrollear
          child: Stack(
            children: [
              Positioned(
                top: offsetTop < 0 ? offsetTop.abs() : 0,
                left: 0,
                right: 0,
                child: Container(
                  height: screenHeight,
                  alignment: Alignment.center,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 800,
                      maxHeight: 800,
                    ),
                    width: 800,
                    height: 800,
                    decoration: BoxDecoration(
                      //boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: List.generate(images.length, (index) {
                        return Opacity(
                          opacity: _calculateOpacity(
                            index,
                            progress,
                            images.length,
                          ),
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

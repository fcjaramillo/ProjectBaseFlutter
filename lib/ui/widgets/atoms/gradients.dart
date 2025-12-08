part of 'atoms.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({required this.name, required this.gradient, super.key});

  final Gradient gradient;
  final String name;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BaseText(name),
        SizedBox(
          height: 100,
          width: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).shadowColor,
              gradient: gradient,
            ),
          ),
        ),
      ],
    ),
  );
}

class Gradients {
  const Gradients._();

  static const Gradient radialBlackGradient = LinearGradient(
    stops: <double>[-0.5, 1],
    transform: GradientRotation(0.6),
    colors: <Color>[Color.fromRGBO(65, 66, 69, 1), Color.fromRGBO(1, 3, 0, 1)],
  );

  static const Gradient clubCardRoyalGradient = RadialGradient(
    radius: 3,
    center: Alignment.topLeft,
    colors: <Color>[Color.fromRGBO(65, 66, 69, 1), Color.fromRGBO(1, 3, 0, 1)],
  );

  static const Gradient clubCardPlatinumGradient = RadialGradient(
    radius: 3,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(138, 138, 138, 1),
      Color.fromRGBO(0, 0, 0, 1),
    ],
  );

  static const Gradient clubCardGoldGradient = RadialGradient(
    radius: 2.7,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(201, 157, 2, 1),
      Color.fromRGBO(70, 55, 0, 1),
    ],
  );

  static const Gradient clubCardSilverGradient = RadialGradient(
    radius: 2.75,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(210, 211, 213, 1),
      Color.fromRGBO(38, 42, 67, 1),
    ],
  );

  static const Gradient clubCardBronzeGradient = RadialGradient(
    radius: 2.7,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(169, 128, 65, 1),
      Color.fromRGBO(54, 35, 6, 1),
    ],
  );

  static const Gradient smallCardBronzeGradient = RadialGradient(
    radius: 10,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(169, 128, 65, 1),
      Color.fromRGBO(54, 35, 6, 1),
    ],
  );

  static const Gradient clubCardRewardGradient = RadialGradient(
    radius: 2.7,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(255, 255, 255, 1),
      Color.fromRGBO(223, 223, 223, 1),
    ],
  );

  static const Gradient clubCardBlackGradient = RadialGradient(
    radius: 3.5,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(0, 0, 0, 1),
      Color.fromRGBO(178, 178, 178, 1),
    ],
  );

  static const Gradient clubCardRoyalLongGradient = RadialGradient(
    radius: 9,
    center: Alignment.topLeft,
    colors: <Color>[Color.fromRGBO(65, 66, 69, 1), Color.fromRGBO(1, 3, 0, 1)],
  );

  static const Gradient clubCardPlatinumLongGradient = RadialGradient(
    radius: 9,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(138, 138, 138, 1),
      Color.fromRGBO(0, 0, 0, 1),
    ],
  );

  static const Gradient clubCardGoldLongGradient = RadialGradient(
    radius: 8.1,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(201, 157, 2, 1),
      Color.fromRGBO(70, 55, 0, 1),
    ],
  );

  static const Gradient clubCardSilverLongGradient = RadialGradient(
    radius: 8.25,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(210, 211, 213, 1),
      Color.fromRGBO(38, 42, 67, 1),
    ],
  );

  static const Gradient clubCardBronzeLongGradient = RadialGradient(
    radius: 8.1,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(169, 128, 65, 1),
      Color.fromRGBO(54, 35, 6, 1),
    ],
  );

  static const Gradient smallCardBronzeLongGradient = RadialGradient(
    radius: 20,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(169, 128, 65, 1),
      Color.fromRGBO(54, 35, 6, 1),
    ],
  );

  static const Gradient clubCardRewardLongGradient = RadialGradient(
    radius: 8.1,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(255, 255, 255, 1),
      Color.fromRGBO(223, 223, 223, 1),
    ],
  );

  static const Gradient clubCardBlackLongGradient = RadialGradient(
    radius: 10.5,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(0, 0, 0, 1),
      Color.fromRGBO(178, 178, 178, 1),
    ],
  );

  static const Gradient clubCardCertificateGradient = RadialGradient(
    radius: 1.5,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(245, 245, 245, 1),
      Color.fromRGBO(198, 198, 198, 1),
    ],
  );

  static Gradient imagesGradient(ThemeData theme) {
    CustomThemeColors customThemeColors = theme.extension<CustomThemeColors>()!;
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: <Color>[theme.shadowColor, customThemeColors.transparent],
    );
  }

  static const Gradient cashCardGradient = RadialGradient(
    radius: 2.8,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(0, 0, 0, 1),
      Color.fromRGBO(178, 178, 178, 1),
    ],
  );

  static const Gradient rewardCardGradient = RadialGradient(
    radius: 2.3,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(255, 186, 252, 1),
      Color.fromRGBO(255, 252, 251, 1),
    ],
  );

  static const Gradient creditsCertificateCardGradient = RadialGradient(
    radius: 1.1,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(47, 0, 183, 1),
      Color.fromRGBO(131, 0, 133, 1),
    ],
  );

  static const Gradient cashCertificateCardGradient = RadialGradient(
    radius: 3,
    center: Alignment.topLeft,
    colors: <Color>[Color.fromRGBO(0, 138, 138, 1), Color.fromRGBO(0, 0, 0, 1)],
  );

  static const Gradient nightsCertificateCardGradient = RadialGradient(
    radius: 2,
    center: Alignment.topLeft,
    colors: <Color>[
      Color.fromRGBO(12, 21, 67, 1),
      Color.fromRGBO(31, 102, 186, 1),
    ],
  );

  static const Gradient membershipCardGradient = RadialGradient(
    radius: 1.5,
    center: Alignment.topLeft,
    colors: <Color>[Color.fromRGBO(0, 0, 0, 1), Color.fromRGBO(0, 0, 0, 1)],
  );
}

part of 'atoms.dart';

class BasePendingPhoto extends StatelessWidget {
  const BasePendingPhoto({this.size, super.key});

  final double? size;

  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Image.asset(
        Pngs.pendingPhoto,
        width: size ?? double.infinity,
        height: size,
        fit: BoxFit.cover,
      ),
      SizedBox(
        width: size != null ? size! * 0.7 : null,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: BaseText.noChangeSubtle(
            L10n.of(context).gNotAvailable,
            style: TypoSubtitles.s3,
          ),
        ),
      ),
    ],
  );
}

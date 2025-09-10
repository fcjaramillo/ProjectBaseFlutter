part of 'atoms.dart';

class NotificationNumber extends StatelessWidget {
  final int? notificationNumber;
  final double? size;

  const NotificationNumber({
    this.notificationNumber,
    this.size = 18,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Visibility(
        visible: notificationNumber != 0,
        child: BaseSizedBox(
          height: size,
          width: size,
          color: Theme.of(context).colorScheme.error,
          widget: Center(
            child: BaseText.invert(
              notificationNumber.toString(),
              overflow: TextOverflow.clip,
              maxLines: 1,
              style: TypoCaption.c1.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: size! > 6 ? size! - 6 : 12,
              ),
            ),
          ),
        ),
      );
}

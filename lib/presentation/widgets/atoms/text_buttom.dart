part of 'atoms.dart';

class BaseTextButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final TextStyle? style;

  const BaseTextButton({
    required this.title,
    this.onTap,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: BaseText(
          title,
          style: style ??
              TypoLink.s.copyWith(
                decoration: TextDecoration.underline,
              ),
        ),
      );
}

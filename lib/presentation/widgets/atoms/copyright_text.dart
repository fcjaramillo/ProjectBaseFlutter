part of 'atoms.dart';

class BaseCopyrigthText extends StatelessWidget {
  const BaseCopyrigthText({super.key});

  @override
  Widget build(BuildContext context) => BaseText.subtle(
        '© 2024 Your Company. All rights reserved.',
        textAlign: TextAlign.center,
        style: TypoCaption.c1,
      );
}

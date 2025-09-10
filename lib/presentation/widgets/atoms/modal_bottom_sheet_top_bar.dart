part of 'atoms.dart';

class ModalBottomSheetTopBar extends StatelessWidget {
  const ModalBottomSheetTopBar({super.key});

  @override
  Widget build(BuildContext context) => Align(
        child: Container(
          height: 5,
          width: Layout.spaceXXL,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Layout.spaceXXS),
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
          ),
        ),
      );
}

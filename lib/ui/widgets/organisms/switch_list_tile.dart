part of 'organisms.dart';

class BaseSwitchListTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final void Function(bool) onChanged;

  const BaseSwitchListTile({
    required this.title,
    required this.isSelected,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListTileDivider(
    title: title,
    trailing: BaseSwitch(isSelected: isSelected, onChanged: onChanged),
  );
}

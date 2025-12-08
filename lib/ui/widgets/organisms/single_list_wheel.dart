part of 'organisms.dart';

class SingleListWheel<T> extends StatelessWidget {
  final List<T> items;
  final T selectedItem;
  final void Function(int) onSelectedItemChanged;
  final Orientation orientation;

  const SingleListWheel({
    required this.items,
    required this.selectedItem,
    required this.onSelectedItemChanged,
    required this.orientation,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Expanded(
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          width: Responsive.of(
            context,
          ).wp(orientation == Orientation.portrait ? 6.3 : 5),
          height: Responsive.of(
            context,
          ).hp(orientation == Orientation.portrait ? 3.8 : 5.1),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.surfaceContainerLow,
              ),
              borderRadius: CHRadius.r_2,
            ),
          ),
        ),
        ListWheelScrollView.useDelegate(
          controller: FixedExtentScrollController(
            initialItem: items.indexOf(selectedItem),
          ),
          squeeze: 0.9,
          itemExtent: 45,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: onSelectedItemChanged,
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (BuildContext context, int index) {
              if (index < 0 || index >= items.length) {
                return null;
              }

              final T item = items[index];
              final bool isSelected = items[index] == selectedItem;

              final String displayText = item is int
                  ? item.toString().padLeft(2, '0')
                  : item.toString();

              return Center(
                child: isSelected
                    ? BaseText(
                        displayText,
                        style: TypoBody.b1r,
                        textAlign: TextAlign.center,
                      )
                    : BaseText.subtle(displayText, style: TypoBody.b3r),
              );
            },
            childCount: items.length,
          ),
        ),
      ],
    ),
  );
}

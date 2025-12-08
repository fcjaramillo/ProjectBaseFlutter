part of 'molecules.dart';

class FilterTextField extends StatefulWidget {
  final TextEditingController searchController;
  final String label;
  final VoidCallback onTapFilter;
  final void Function(String)? onChanged;
  final int notifications;
  final VoidCallback clearText;

  const FilterTextField({
    required this.searchController,
    required this.label,
    required this.onTapFilter,
    required this.notifications,
    required this.clearText,
    this.onChanged,
    super.key,
  });

  @override
  State<FilterTextField> createState() => _FilterTextFieldState();
}

class _FilterTextFieldState extends State<FilterTextField> {
  Timer? _debounce;

  void _onChanged(String value) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (widget.onChanged != null) {
        widget.onChanged!.call(value);
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool showIcon = widget.searchController.text.isNotEmpty;
    return Row(
      children: <Widget>[
        Expanded(
          child: BaseTextField(
            onTapPrefixIcon: () {},
            prefixIcon: Iconsax.search_normal_1,
            controller: widget.searchController,
            label: widget.label,
            labelStyle: TypoBody.b2r.copyWith(
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            suffixIcon: showIcon ? Iconsax.close_circle5 : null,
            onTapSuffixIcon: () {
              widget.searchController.clear();
              widget.clearText();
            },
            onChanged: _onChanged,
            textStyle: TypoBody.b1r,
            borderRadius: Layout.spaceS,
          ),
        ),
      ],
    );
  }
}

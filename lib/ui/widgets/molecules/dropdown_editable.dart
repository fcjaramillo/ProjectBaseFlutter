part of 'molecules.dart';

class BaseDropdownEditable extends StatefulWidget {
  const BaseDropdownEditable({
    required this.items,
    this.isLoading = false,
    this.onTapItem,
    this.onChanged,
    this.controller,
    this.label,
    super.key,
    this.suffixIcon,
    this.suffixIconColor,
    this.prefixIcon,
    this.prefixIconColor,
  });

  final List<String> items;
  final bool isLoading;
  final void Function(String)? onTapItem;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? label;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final IconData? prefixIcon;
  final Color? prefixIconColor;

  @override
  State<BaseDropdownEditable> createState() => _BaseDropdownEditableState();
}

class _BaseDropdownEditableState extends State<BaseDropdownEditable> {
  late final ScrollController _scrollController;
  late final TextEditingController _controller;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BaseDropdownEditable oldWidget) {
    if (_overlayEntry != null && widget.items != oldWidget.items) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showOverlay();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void _showOverlay() {
    _removeOverlay();
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _onTapItem(String item) {
    _controller.text = item;
    widget.onTapItem?.call(item);
    _removeOverlay();
  }

  List<String> _getFilteredItems() => widget.items
      .where(
        (String item) =>
            item.toLowerCase().contains(_controller.text.toLowerCase()),
      )
      .toList();

  OverlayEntry _createOverlayEntry() => OverlayEntry(
    builder: (_) {
      final List<String> filteredItems = _getFilteredItems();
      final Responsive responsive = Responsive.of(context);
      final bool shrinkWrap =
          responsive.hp(30) - Layout.spaceXL >
          Layout.spaceXL * filteredItems.length;
      return Positioned.fill(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _removeOverlay,
          child: Stack(
            children: <Widget>[
              CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: const Offset(0, 60),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: responsive.hp(30),
                    maxWidth: responsive.width - Layout.spaceXXL,
                  ),
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: CHRadius.r_2,
                      side: BorderSide(
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHigh,
                      ),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: BasePadding.padding_16,
                      child: ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: shrinkWrap,
                        physics: shrinkWrap
                            ? const NeverScrollableScrollPhysics()
                            : null,
                        padding: EdgeInsets.zero,
                        itemCount: filteredItems.length,
                        itemBuilder: (_, int index) => GestureDetector(
                          onTap: () => _onTapItem(filteredItems[index]),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).extension<CustomThemeColors>()!.transparent,
                            ),
                            child: SizedBox(
                              height: Layout.spaceXL,
                              child: BaseText(
                                filteredItems[index],
                                style: TypoBody.b2r,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) => CompositedTransformTarget(
    link: _layerLink,
    child: BaseTextField(
      prefixIcon: widget.prefixIcon,
      prefixIconColor: widget.prefixIconColor,
      suffixIcon: widget.suffixIcon,
      suffixIconColor: widget.suffixIconColor,
      controller: _controller,
      label: widget.label,
      onTapTextField: widget.items.isNotEmpty ? _showOverlay : () {},
      onChanged: (String value) {
        if (widget.items.isNotEmpty) {
          _removeOverlay();
          _showOverlay();
        }
        widget.onTapItem?.call(value);
        widget.onChanged?.call(value);
      },
    ),
  );
}

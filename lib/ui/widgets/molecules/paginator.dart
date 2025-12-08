part of 'molecules.dart';

class Paginator extends StatefulWidget {
  final int initialPage;
  final int totalPages;
  final int blockSize;
  final ValueChanged<int> onPageChanged;

  const Paginator({
    required this.initialPage,
    required this.totalPages,
    required this.onPageChanged,
    super.key,
    this.blockSize = 3,
  });

  @override
  State<Paginator> createState() => _PaginatorState();
}

class _PaginatorState extends State<Paginator> {
  late int _currentPage;
  late int _blockStart;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
    _blockStart = _calculateBlockStart(_currentPage);
  }

  @override
  void didUpdateWidget(covariant Paginator oldWidget) {
    super.didUpdateWidget(oldWidget);
    int totalPages = widget.totalPages;
    int initialPage = widget.initialPage;
    int oldtotalPage = oldWidget.totalPages;
    int oldInitialPage = oldWidget.initialPage;
    if (initialPage != oldInitialPage || totalPages != oldtotalPage) {
      setState(() {
        _currentPage = widget.initialPage;
        if (_currentPage > widget.totalPages) {
          _currentPage = widget.totalPages;
        }
        _blockStart = _calculateBlockStart(_currentPage);
      });
    }
  }

  int _calculateBlockStart(int page) {
    final int blockIndex = (page - 1) ~/ widget.blockSize;
    return blockIndex * widget.blockSize + 1;
  }

  List<int> get _visiblePages {
    final int start = _blockStart;
    final int end = start + widget.blockSize - 1;
    final List<int> pages = <int>[];
    for (int i = start; i <= end && i <= widget.totalPages; i++) {
      pages.add(i);
    }
    return pages;
  }

  void _goToPage(int page) {
    setState(() {
      _currentPage = page;
      _blockStart = _calculateBlockStart(_currentPage);
    });
    widget.onPageChanged(_currentPage);
  }

  void _nextBlock() {
    final int nextStart = _blockStart + widget.blockSize;
    if (nextStart <= widget.totalPages) {
      setState(() {
        _blockStart = nextStart;
        if (_currentPage < _blockStart) {
          _currentPage = _blockStart;
        }
      });
      widget.onPageChanged(_currentPage);
    }
  }

  void _prevBlock() {
    final int prevStart = _blockStart - widget.blockSize;
    if (prevStart >= 1) {
      setState(() {
        _blockStart = prevStart;
        final int endOfBlock = _blockStart + widget.blockSize - 1;
        if (_currentPage > endOfBlock) {
          _currentPage = endOfBlock;
        }
      });
      widget.onPageChanged(_currentPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    if (widget.totalPages <= 1) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Iconsax.arrow_left_2,
              size: Layout.spaceXL,
              color: colorScheme.onSurface,
            ),
            onPressed: null,
          ),
          PageButton(
            pageNumber: '1',
            isCurrent: _currentPage == 1,
            onTap: () => _goToPage(1),
          ),
          IconButton(
            icon: Icon(
              Iconsax.arrow_right_3,
              size: Layout.spaceXL,
              color: colorScheme.onSurface,
            ),
            onPressed: null,
          ),
        ],
      );
    }

    final List<int> pages = _visiblePages;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Iconsax.arrow_left_2,
            size: Layout.spaceXL,
            color: colorScheme.onSurface,
          ),
          onPressed: _currentPage > 1
              ? () => _goToPage(_currentPage - 1)
              : null,
        ),
        if (pages.first > 1) ...<Widget>[
          PageButton(
            pageNumber: '1',
            isCurrent: 1 == _currentPage,
            onTap: () => _goToPage(1),
          ),
          InkWell(
            onTap: _prevBlock,
            child: Padding(
              padding: BasePadding.paddingH8,
              child: BaseText.subtle(
                '...',
                style: TypoCaption.c1.copyWith(fontSize: Layout.spaceL),
              ),
            ),
          ),
        ],
        for (final int p in pages)
          PageButton(
            pageNumber: p.toString(),
            isCurrent: p == _currentPage,
            onTap: () => _goToPage(p),
          ),
        if (pages.last < widget.totalPages) ...<Widget>[
          InkWell(
            onTap: _nextBlock,
            child: Padding(
              padding: BasePadding.paddingH8,
              child: BaseText.subtle(
                '...',
                style: TypoCaption.c1.copyWith(fontSize: Layout.spaceL),
              ),
            ),
          ),
          PageButton(
            pageNumber: widget.totalPages.toString(),
            isCurrent: widget.totalPages == _currentPage,
            onTap: () => _goToPage(widget.totalPages),
          ),
        ],
        IconButton(
          icon: Icon(
            Iconsax.arrow_right_3,
            size: Layout.spaceXL,
            color: colorScheme.onSurface,
          ),
          onPressed: _currentPage < widget.totalPages
              ? () => _goToPage(_currentPage + 1)
              : null,
        ),
      ],
    );
  }
}

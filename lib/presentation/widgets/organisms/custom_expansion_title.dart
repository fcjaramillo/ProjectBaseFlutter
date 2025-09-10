part of 'organisms.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class BaseCustomExpansionTileController {
  BaseCustomExpansionTileController();
  _CustomExpansionTileState? _state;

  bool get isExpanded {
    assert(_state != null);
    return _state!._isExpanded;
  }

  void expand() {
    assert(_state != null);
    if (!isExpanded) {
      _state!._toggleExpansion();
    }
  }

  void collapse() {
    assert(_state != null);
    if (isExpanded) {
      _state!._toggleExpansion();
    }
  }

  static BaseCustomExpansionTileController of(BuildContext context) {
    final _CustomExpansionTileState? result =
        context.findAncestorStateOfType<_CustomExpansionTileState>();
    if (result != null) {
      return result._tileController;
    }
    throw FlutterError.fromParts(
      <DiagnosticsNode>[
        ErrorSummary(
          '''BaseCustomExpansionTileController.of() called with a context that does not contain a ExpansionTile.''',
        ),
        ErrorDescription(
          '''No ExpansionTile ancestor could be found starting from the context that was passed to BaseCustomExpansionTileController.of(). '''
          '''This usually happens when the context provided is from the same StatefulWidget as that '''
          '''whose build function actually creates the ExpansionTile widget being sought.''',
        ),
        ErrorHint(
          '''There are several ways to avoid this problem. The simplest is to use a Builder to get a '''
          '''context that is "under" the ExpansionTile. For an example of this, please see the '''
          '''documentation for BaseCustomExpansionTileController.of():\n'''
          '  https://api.flutter.dev/flutter/material/ExpansionTile/of.html',
        ),
        ErrorHint(
          '''A more efficient solution is to split your build function into several widgets. This '''
          '''introduces a new context from which you can obtain the ExpansionTile. In this solution, '''
          '''you would have an outer widget that creates the ExpansionTile populated by instances of '''
          '''your new inner widgets, and then in these inner widgets you would use BaseCustomExpansionTileController.of().\n'''
          'An other solution is assign a GlobalKey to the ExpansionTile, '
          '''then use the key.currentState property to obtain the ExpansionTile rather than '''
          'using the BaseCustomExpansionTileController.of() function.',
        ),
        context.describeElement('The context used was'),
      ],
    );
  }

  static BaseCustomExpansionTileController? maybeOf(BuildContext context) =>
      context
          .findAncestorStateOfType<_CustomExpansionTileState>()
          ?._tileController;
}

class BaseCustomExpansionTile extends StatefulWidget {
  const BaseCustomExpansionTile({
    this.title,
    this.titleWidget,
    super.key,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
    this.titlePadding,
    this.childrenPadding,
    this.controlAffinity,
    this.controller,
    this.icon,
    this.iconColor,
    this.mainAxisAlignmentTitleExpanded,
    this.crossAxisAlignmentTitleExpanded,
    this.decorationTitle,
    this.decorationContent,
  }) : assert(
          expandedCrossAxisAlignment != CrossAxisAlignment.baseline,
          '''CrossAxisAlignment.baseline is not supported since the expanded children '''
          'are aligned in a column, not a row. Try to use another constant.',
        );

  final String? title;
  final Widget? titleWidget;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final bool initiallyExpanded;
  final bool maintainState;
  final Alignment? expandedAlignment;
  final CrossAxisAlignment? expandedCrossAxisAlignment;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? childrenPadding;
  final ListTileControlAffinity? controlAffinity;
  final BaseCustomExpansionTileController? controller;
  final Widget? icon;
  final Color? iconColor;
  final MainAxisAlignment? mainAxisAlignmentTitleExpanded;
  final CrossAxisAlignment? crossAxisAlignmentTitleExpanded;
  final Decoration? decorationTitle;
  final Decoration? decorationContent;

  @override
  State<BaseCustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<BaseCustomExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0, end: 0.5);

  late AnimationController _animationController;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;
  late BaseCustomExpansionTileController _tileController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _animationController.drive(_easeInTween);
    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));

    _isExpanded = PageStorage.maybeOf(context)?.readState(context) as bool? ??
        widget.initiallyExpanded;
    if (_isExpanded) {
      _animationController.value = 1.0;
    }

    assert(widget.controller?._state == null);
    _tileController = widget.controller ?? BaseCustomExpansionTileController();
    _tileController._state = this;
  }

  @override
  void dispose() {
    _tileController._state = null;
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    final TextDirection textDirection =
        WidgetsLocalizations.of(context).textDirection;
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final String stateHint =
        _isExpanded ? localizations.expandedHint : localizations.collapsedHint;
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
      PageStorage.maybeOf(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
    SemanticsService.announce(stateHint, textDirection);
  }

  void _handleTap() {
    _toggleExpansion();
  }

  Widget _buildIcon(BuildContext context) => RotationTransition(
        turns: _iconTurns,
        child: widget.icon ??
            Icon(
              Iconsax.arrow_down_1,
              color: widget.iconColor ?? Theme.of(context).colorScheme.outline,
            ),
      );

  Widget _buildChildren(BuildContext context, Widget? child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: _handleTap,
            child: Container(
              padding: widget.titlePadding ??
                  const EdgeInsets.symmetric(
                    horizontal: Layout.spaceM,
                    vertical: Layout.spaceS,
                  ),
              decoration: widget.decorationTitle ??
                  BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.05),
                    borderRadius:
                        !_isExpanded && _animationController.isDismissed
                            ? BaseRadius.r_2
                            : const BorderRadius.only(
                                topLeft: Radius.circular(Layout.spaceS),
                                topRight: Radius.circular(Layout.spaceS),
                              ),
                  ),
              child: Row(
                crossAxisAlignment: widget.crossAxisAlignmentTitleExpanded ??
                    CrossAxisAlignment.center,
                mainAxisAlignment: widget.mainAxisAlignmentTitleExpanded ??
                    MainAxisAlignment.center,
                children: <Widget>[
                  if (widget.controlAffinity == ListTileControlAffinity.leading)
                    _buildIcon(context),
                  if (widget.title != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Layout.spaceM,
                      ),
                      child: BaseText(
                        widget.title!,
                        style: TypoSubtitles.s3.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  if (widget.titleWidget != null)
                    Expanded(child: widget.titleWidget!),
                  if (widget.controlAffinity ==
                      ListTileControlAffinity.trailing)
                    _buildIcon(context),
                ],
              ),
            ),
          ),
          ClipRect(
            child: Align(
              alignment: widget.expandedAlignment ?? Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final ExpansionTileThemeData expansionTileTheme =
        ExpansionTileTheme.of(context);
    final bool closed = !_isExpanded && _animationController.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: DecoratedBox(
          decoration: widget.decorationContent ??
              BoxDecoration(
                border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.05),
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(Layout.spaceS),
                  bottomRight: Radius.circular(Layout.spaceS),
                ),
              ),
          child: Padding(
            padding: widget.childrenPadding ??
                expansionTileTheme.childrenPadding ??
                EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: widget.expandedCrossAxisAlignment ??
                  CrossAxisAlignment.center,
              children: widget.children,
            ),
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _animationController.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}

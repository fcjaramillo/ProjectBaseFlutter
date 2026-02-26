part of 'utils.dart';

/// Breakpoints for responsive design
class Breakpoints {
  Breakpoints._();

  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
  static const double largeDesktop = 1800;
}

/// Enhanced responsive utility class with proper breakpoints
class Responsive {
  late double _height, _width;
  late bool _isTable;

  double get height => _height;
  double get width => _width;

  bool get isTable => _isTable;

  // Device type getters
  bool get isMobile => _width < Breakpoints.mobile;
  bool get isTablet =>
      _width >= Breakpoints.mobile && _width < Breakpoints.desktop;
  bool get isDesktop => _width >= Breakpoints.desktop;
  bool get isLargeDesktop => _width >= Breakpoints.largeDesktop;

  // Simplified checks (common use cases)
  bool get isMobileOrTablet => _width < Breakpoints.desktop;
  bool get isDesktopOrLarger => _width >= Breakpoints.desktop;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    _isTable = size.shortestSide >= 600;
  }

  /// Width percentage
  double wp(double percent) => _width * percent / 100;

  /// Height percentage
  double hp(double percent) => _height * percent / 100;

  /// Responsive value based on device type
  T value<T>({
    required T mobile,
    T? tablet,
    T? desktop,
    T? largeDesktop,
  }) {
    if (isLargeDesktop && largeDesktop != null) return largeDesktop;
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }

  /// Responsive padding
  EdgeInsets padding({
    double mobile = 20,
    double? tablet,
    double? desktop,
  }) {
    final double horizontal = value<double>(
      mobile: mobile,
      tablet: tablet ?? mobile * 2,
      desktop: desktop ?? mobile * 4,
    );
    return EdgeInsets.symmetric(horizontal: horizontal);
  }

  /// Responsive horizontal padding value
  double horizontalPadding({
    double mobile = 20,
    double? tablet,
    double? desktop,
  }) =>
      value<double>(
        mobile: mobile,
        tablet: tablet ?? 40,
        desktop: desktop ?? 80,
      );

  /// Responsive vertical padding value
  double verticalPadding({
    double mobile = 40,
    double? tablet,
    double? desktop,
  }) =>
      value<double>(
        mobile: mobile,
        tablet: tablet ?? 60,
        desktop: desktop ?? 100,
      );

  /// Calculate grid columns based on screen width
  int gridColumns({
    int mobile = 1,
    int tablet = 2,
    int desktop = 3,
    int largeDesktop = 4,
  }) =>
      value<int>(
        mobile: mobile,
        tablet: tablet,
        desktop: desktop,
        largeDesktop: largeDesktop,
      );

  /// Get maximum content width for centered layouts
  double get maxContentWidth {
    if (isLargeDesktop) return 1400;
    if (isDesktop) return 1200;
    if (isTablet) return 900;
    return _width;
  }

  /// Responsive font scale factor
  double get fontScale {
    if (isLargeDesktop) return 1.1;
    if (isDesktop) return 1.0;
    if (isTablet) return 0.95;
    return 0.9;
  }

  /// Responsive spacing
  double spacing({
    double mobile = 16,
    double? tablet,
    double? desktop,
  }) =>
      value<double>(
        mobile: mobile,
        tablet: tablet ?? mobile * 1.5,
        desktop: desktop ?? mobile * 2,
      );
}

/// A widget that builds different layouts based on screen size
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    required this.mobile,
    this.tablet,
    this.desktop,
    super.key,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    if (responsive.isDesktop && desktop != null) {
      return desktop!;
    }
    if (responsive.isTablet && tablet != null) {
      return tablet!;
    }
    return mobile;
  }
}

/// A widget that shows/hides content based on screen size
class ResponsiveVisibility extends StatelessWidget {
  const ResponsiveVisibility({
    required this.child,
    this.visibleOnMobile = true,
    this.visibleOnTablet = true,
    this.visibleOnDesktop = true,
    this.replacement,
    super.key,
  });

  final Widget child;
  final bool visibleOnMobile;
  final bool visibleOnTablet;
  final bool visibleOnDesktop;
  final Widget? replacement;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    bool isVisible = true;
    if (responsive.isMobile) {
      isVisible = visibleOnMobile;
    } else if (responsive.isTablet) {
      isVisible = visibleOnTablet;
    } else {
      isVisible = visibleOnDesktop;
    }

    if (isVisible) {
      return child;
    }
    return replacement ?? const SizedBox.shrink();
  }
}

/// A responsive grid that automatically adjusts columns
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    required this.children,
    this.mobileColumns = 1,
    this.tabletColumns = 2,
    this.desktopColumns = 3,
    this.largeDesktopColumns = 4,
    this.spacing = 16,
    this.runSpacing = 16,
    this.childAspectRatio = 1.0,
    super.key,
  });

  final List<Widget> children;
  final int mobileColumns;
  final int tabletColumns;
  final int desktopColumns;
  final int largeDesktopColumns;
  final double spacing;
  final double runSpacing;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final int columns = responsive.gridColumns(
      mobile: mobileColumns,
      tablet: tabletColumns,
      desktop: desktopColumns,
      largeDesktop: largeDesktopColumns,
    );

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: children.length,
      itemBuilder: (BuildContext context, int index) => children[index],
    );
  }
}

/// A centered container with max width constraint
class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({
    required this.child,
    this.maxWidth,
    this.padding,
    super.key,
  });

  final Widget child;
  final double? maxWidth;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? responsive.maxContentWidth,
        ),
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: responsive.horizontalPadding(),
            ),
        child: child,
      ),
    );
  }
}

/// A row that converts to column on mobile
class ResponsiveRowColumn extends StatelessWidget {
  const ResponsiveRowColumn({
    required this.children,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
    this.columnMainAxisAlignment = MainAxisAlignment.start,
    this.columnCrossAxisAlignment = CrossAxisAlignment.stretch,
    this.rowSpacing = 16,
    this.columnSpacing = 16,
    this.breakpoint,
    super.key,
  });

  final List<Widget> children;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final MainAxisAlignment columnMainAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;
  final double rowSpacing;
  final double columnSpacing;
  final double? breakpoint;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool useColumn =
        responsive.width < (breakpoint ?? Breakpoints.tablet);

    if (useColumn) {
      return Column(
        mainAxisAlignment: columnMainAxisAlignment,
        crossAxisAlignment: columnCrossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildrenWithSpacing(columnSpacing, Axis.vertical),
      );
    }

    return Row(
      mainAxisAlignment: rowMainAxisAlignment,
      crossAxisAlignment: rowCrossAxisAlignment,
      children: _buildChildrenWithSpacing(rowSpacing, Axis.horizontal),
    );
  }

  List<Widget> _buildChildrenWithSpacing(double spacing, Axis axis) {
    final List<Widget> spacedChildren = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i < children.length - 1) {
        spacedChildren.add(
          axis == Axis.horizontal
              ? SizedBox(width: spacing)
              : SizedBox(height: spacing),
        );
      }
    }
    return spacedChildren;
  }
}

/// Extension for responsive EdgeInsets
extension ResponsiveEdgeInsets on EdgeInsets {
  static EdgeInsets symmetric({
    required BuildContext context,
    double horizontalMobile = 20,
    double horizontalTablet = 40,
    double horizontalDesktop = 80,
    double verticalMobile = 40,
    double verticalTablet = 60,
    double verticalDesktop = 100,
  }) {
    final Responsive responsive = Responsive.of(context);
    return EdgeInsets.symmetric(
      horizontal: responsive.value<double>(
        mobile: horizontalMobile,
        tablet: horizontalTablet,
        desktop: horizontalDesktop,
      ),
      vertical: responsive.value<double>(
        mobile: verticalMobile,
        tablet: verticalTablet,
        desktop: verticalDesktop,
      ),
    );
  }
}

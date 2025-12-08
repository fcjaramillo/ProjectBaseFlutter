part of 'ions.dart';

class SemanticColors extends Color {
  final Color? _s50;
  final Color? _s100;
  final Color? _s200;
  final Color? _s300;
  final Color? _s400;
  final Color? _s500;
  final Color? _s600;
  final Color? _s700;
  final Color? _s800;
  final Color? _s900;

  const SemanticColors(
    super.r,
    super.g,
    super.b,
    super.opacity, {
    Color? s50,
    Color? s100,
    Color? s200,
    Color? s300,
    Color? s400,
    Color? s500,
    Color? s600,
    Color? s700,
    Color? s800,
    Color? s900,
  })  : _s900 = s900,
        _s800 = s800,
        _s700 = s700,
        _s600 = s600,
        _s500 = s500,
        _s400 = s400,
        _s300 = s300,
        _s200 = s200,
        _s100 = s100,
        _s50 = s50,
        super.fromRGBO();

  Color get s50 => _s50 ?? withValues(alpha: 0.05);
  Color get s100 => _s100 ?? withValues(alpha: 0.1);
  Color get s200 => _s200 ?? withValues(alpha: 0.2);
  Color get s300 => _s300 ?? withValues(alpha: 0.3);
  Color get s400 => _s400 ?? withValues(alpha: 0.4);
  Color get s500 => _s500 ?? withValues(alpha: 0.5);
  Color get s600 => _s600 ?? withValues(alpha: 0.6);
  Color get s700 => _s700 ?? withValues(alpha: 0.7);
  Color get s800 => _s800 ?? withValues(alpha: 0.8);
  Color get s900 => _s900 ?? withValues(alpha: 0.9);
}

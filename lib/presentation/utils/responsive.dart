part of 'utils.dart';

class Responsive {
  late double _height, _width;
  late bool _isTable;

  double get height => _height;
  double get width => _width;

  bool get isTable => _isTable;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    _isTable = size.shortestSide >= 600;
  }

  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _height * percent / 100;
}

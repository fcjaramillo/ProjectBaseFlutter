part of '../templates.dart';

OverlayEntry createBaseOverlayEntry({
  required BuildContext context,
  required VoidCallback onTapOutside,
  required Widget positionedChild,
}) =>
    OverlayEntry(
      builder: (BuildContext context) => Stack(
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onTapOutside,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .extension<CustomThemeColors>()!
                      .transparent,
                ),
              ),
            ),
          ),
          positionedChild,
        ],
      ),
    );

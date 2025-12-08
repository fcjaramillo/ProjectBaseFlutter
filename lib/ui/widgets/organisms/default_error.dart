part of 'organisms.dart';

class BaseDefaultError extends StatelessWidget {
  const BaseDefaultError({this.onRefresh, this.error, super.key});

  final String? error;
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) => Padding(
    padding: BasePadding.padding_16,
    child: Visibility(
      visible: onRefresh != null,
      replacement: ErrorView(error: error),
      child: RefreshIndicator(
        onRefresh: onRefresh ?? () async {},
        child: ErrorView(error: error, refresh: true),
      ),
    ),
  );
}

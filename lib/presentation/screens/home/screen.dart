part of 'home.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static Route<void> goTo() => MaterialPageRoute<void>(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(
          name: Routes.kRouteHome,
        ),
      );

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeViewModelProvider.notifier).getExample();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);
    final HomeState state = ref.watch(homeViewModelProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: GestureDetector(
          onTap: () {
            viewModel.getExample();
            viewModel.onTap();
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(
                Layout.space24,
              ),
            ),
            child: Padding(
              padding: BasePadding.padding_24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    L10n.of(context).sHomeCanTapHere,
                    style: TypoBody.b1r,
                  ),
                  Spacing.spacingV24,
                  Text(
                    '''${L10n.of(context).sHomeGetStatusDescriptive} ${state.isCorrectGet.toString()}''',
                    style: TypoBody.b2r,
                  ),
                  Text(
                    '''${L10n.of(context).sHomeNumberClicksDescriptive} ${state.clicks}''',
                    style: TypoBody.b2r,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

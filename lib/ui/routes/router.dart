part of 'routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter appRouter(Ref ref) => GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: Routes.home,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) =>
              AppShell(child: child),
          routes: <RouteBase>[
            GoRoute(
              path: Routes.home,
              name: 'home',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const HomeScreen(),
                transitionsBuilder: (
                  BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child,
                ) =>
                    FadeTransition(opacity: animation, child: child),
              ),
            ),
            GoRoute(
              path: Routes.candidate,
              name: 'candidate',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const CandidateScreen(),
                transitionsBuilder: _fadeTransition,
              ),
            ),
            GoRoute(
              path: Routes.lifeStory,
              name: 'lifeStory',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const LifeStoryScreen(),
                transitionsBuilder: _fadeTransition,
              ),
            ),
            GoRoute(
              path: Routes.vision,
              name: 'vision',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const VisionScreen(),
                transitionsBuilder: _fadeTransition,
              ),
            ),
            GoRoute(
              path: Routes.strategicAxes,
              name: 'strategicAxes',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const StrategicAxesScreen(),
                transitionsBuilder: _fadeTransition,
              ),
            ),
            GoRoute(
              path: Routes.proposals,
              name: 'proposals',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const ProposalsScreen(),
                transitionsBuilder: _fadeTransition,
              ),
            ),
            GoRoute(
              path: Routes.proposalDetail,
              name: 'proposalDetail',
              pageBuilder: (BuildContext context, GoRouterState state) {
                final String id = state.pathParameters['id'] ?? '';
                return CustomTransitionPage<void>(
                  child: ProposalDetailScreen(proposalId: id),
                  transitionsBuilder: _fadeTransition,
                );
              },
            ),
            GoRoute(
              path: Routes.citizenInvestment,
              name: 'citizenInvestment',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const CitizenInvestmentScreen(),
                transitionsBuilder: _fadeTransition,
              ),
            ),
            GoRoute(
              path: Routes.endorsements,
              name: 'endorsements',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const EndorsementsScreen(),
                transitionsBuilder: _fadeTransition,
              ),
            ),
            GoRoute(
              path: Routes.events,
              name: 'events',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const EventsScreen(),
                transitionsBuilder: _fadeTransition,
              ),
            ),
            GoRoute(
              path: Routes.eventDetail,
              name: 'eventDetail',
              pageBuilder: (BuildContext context, GoRouterState state) {
                final String id = state.pathParameters['id'] ?? '';
                return CustomTransitionPage<void>(
                  child: EventDetailScreen(eventId: id),
                  transitionsBuilder: _fadeTransition,
                );
              },
            ),
            GoRoute(
              path: Routes.support,
              name: 'support',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const SupportScreen(),
                transitionsBuilder: _fadeTransition,
              ),
            ),
            GoRoute(
              path: Routes.news,
              name: 'news',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const NewsScreen(),
                transitionsBuilder: _fadeTransition,
              ),
            ),
            GoRoute(
              path: Routes.newsDetail,
              name: 'newsDetail',
              pageBuilder: (BuildContext context, GoRouterState state) {
                final String id = state.pathParameters['id'] ?? '';
                return CustomTransitionPage<void>(
                  child: NewsDetailScreen(newsId: id),
                  transitionsBuilder: _fadeTransition,
                );
              },
            ),
            GoRoute(
              path: Routes.media,
              name: 'media',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const MediaScreen(),
                transitionsBuilder: _fadeTransition,
              ),
            ),
            GoRoute(
              path: Routes.contact,
              name: 'contact',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const ContactScreen(),
                transitionsBuilder: _fadeTransition,
              ),
            ),
            GoRoute(
              path: Routes.territory,
              name: 'territory',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                child: const TerritoryScreen(),
                transitionsBuilder: _fadeTransition,
              ),
            ),
            GoRoute(
              path: Routes.communeDetail,
              name: 'communeDetail',
              pageBuilder: (BuildContext context, GoRouterState state) {
                final String id = state.pathParameters['id'] ?? '';
                return CustomTransitionPage<void>(
                  child: CommuneDetailScreen(communeId: id),
                  transitionsBuilder: _fadeTransition,
                );
              },
            ),
          ],
        ),
        // Redirect from legacy route
        GoRoute(
          path: Routes.kRouteHome,
          redirect: (BuildContext context, GoRouterState state) => Routes.home,
        ),
      ],
      errorBuilder: (BuildContext context, GoRouterState state) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Pagina no encontrada',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text('La ruta ${state.uri} no existe'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go(Routes.home),
                child: const Text('Volver al inicio'),
              ),
            ],
          ),
        ),
      ),
    );

Widget _fadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) =>
    FadeTransition(opacity: animation, child: child);

// Legacy router for backward compatibility
class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kRouteHome:
        return MaterialPageRoute<void>(
          builder: (_) => const HomeScreen(),
          settings: const RouteSettings(name: Routes.kRouteHome),
        );
    }
    return null;
  }
}

// Placeholder page for routes not yet implemented
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.construction,
                size: 64,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              const Text('Esta pagina esta en construccion'),
            ],
          ),
        ),
      );
}

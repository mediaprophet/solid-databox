import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seraphim/routing/scaffold_with_nav_bar.dart';

// Import all presentation screens
import 'package:seraphim/features/solid_session/presentation/login_screen.dart';
import 'package:seraphim/features/pod_storage/presentation/home_screen.dart';
import 'package:seraphim/features/records/presentation/files_screen.dart';
import 'package:seraphim/features/budget/presentation/budget_screen.dart';
import 'package:seraphim/features/case_plan/presentation/case_plan_screen.dart';
import 'package:seraphim/features/consent/presentation/consent_screen.dart';
import 'package:seraphim/features/credentials/presentation/credential_wallet_screen.dart';
import 'package:seraphim/features/receipts/presentation/receipts_screen.dart';
import 'package:seraphim/features/directory/presentation/directory_screen.dart';
import 'package:seraphim/features/referrals/presentation/referrals_screen.dart';
import 'package:seraphim/features/corrections/presentation/corrections_screen.dart';
import 'package:seraphim/features/evidence/presentation/evidence_screen.dart';
import 'package:seraphim/features/communications/presentation/communications_screen.dart';
import 'package:seraphim/features/cost_disclosure/presentation/cost_disclosure_screen.dart';
import 'package:seraphim/features/relationship_connection/presentation/relationship_connection_screen.dart';
import 'package:seraphim/features/scanner/presentation/scanner_screen.dart';

import 'package:seraphim/features/solid_session/presentation/splash_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        // Branch 0: Dashboard (Home & Files etc)
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'files',
                  builder: (context, state) => const FilesScreen(),
                ),
                GoRoute(
                  path: 'receipts',
                  builder: (context, state) => const ReceiptsScreen(),
                ),
                GoRoute(
                  path: 'directory',
                  builder: (context, state) => const DirectoryScreen(),
                ),
                GoRoute(
                  path: 'referrals',
                  builder: (context, state) => const ReferralsScreen(),
                ),
                GoRoute(
                  path: 'corrections',
                  builder: (context, state) => const CorrectionsScreen(),
                ),
                GoRoute(
                  path: 'evidence',
                  builder: (context, state) => const EvidenceScreen(),
                ),
                GoRoute(
                  path: 'communications',
                  builder: (context, state) => const CommunicationsScreen(),
                ),
                GoRoute(
                  path: 'cost_disclosure',
                  builder: (context, state) => const CostDisclosureScreen(),
                ),
                GoRoute(
                  path: 'relationship_connection',
                  builder: (context, state) => const RelationshipConnectionScreen(),
                ),
                GoRoute(
                  path: 'scan',
                  builder: (context, state) => const ScannerScreen(),
                ),
              ],
            ),
          ],
        ),
        // Branch 1: Case Plan
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/case_plan',
              builder: (context, state) => const CasePlanScreen(),
            ),
          ],
        ),
        // Branch 2: Budget
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/budget',
              builder: (context, state) => const BudgetScreen(),
            ),
          ],
        ),
        // Branch 3: Wallet (Credentials)
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/credentials',
              builder: (context, state) => const CredentialWalletScreen(),
            ),
          ],
        ),
        // Branch 4: Consent
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/consent',
              builder: (context, state) => const ConsentScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

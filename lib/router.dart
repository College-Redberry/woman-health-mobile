import 'package:go_router/go_router.dart';

import 'package:woman_health/ui/auth/widgets/login.dart';
import 'package:woman_health/ui/faq/widgets/bleeding_between_periods.dart';
import 'package:woman_health/ui/faq/widgets/breast_cancer.dart';
import 'package:woman_health/ui/faq/widgets/cervical_cancer.dart';
import 'package:woman_health/ui/faq/widgets/menu.dart';
import 'package:woman_health/ui/core/widgets/shell.dart';
import 'package:woman_health/ui/home/widgets/home.dart';
import 'package:woman_health/ui/faq/widgets/menopause.dart';
import 'package:woman_health/ui/faq/widgets/menstrual_champs.dart';
import 'package:woman_health/ui/faq/widgets/menstrual_cycle.dart';
import 'package:woman_health/ui/faq/widgets/missed_period.dart';
import 'package:woman_health/ui/faq/widgets/pain_while_urinating.dart';
import 'package:woman_health/ui/faq/widgets/pms_and_emotions.dart';
import 'package:woman_health/ui/profile/widgets/profile_page.dart';
import 'package:woman_health/ui/faq/widgets/self_care.dart';
import 'package:woman_health/ui/faq/widgets/vaginal_discharge.dart';
import 'package:woman_health/ui/faq/widgets/violence_against_women.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),

    ShellRoute(
      builder: (context, state, child) {
        return Shell(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),

        GoRoute(
          path: '/content',
          builder: (context, state) => const FaqMenuPage(),
        ),

        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),

        GoRoute(
          path: '/vaginal-discharge',
          builder: (context, state) => const VaginalDischargePage(),
        ),

        GoRoute(
          path: '/menstrual-cramps',
          builder: (context, state) => const MenstrualCrampsPage(),
        ),

        GoRoute(
          path: '/missed-period',
          builder: (context, state) => const MissedPeriodPage(),
        ),

        GoRoute(
          path: '/bleeding-between-periods',
          builder: (context, state) => const BleedingBetweenPeriodsPage(),
        ),

        GoRoute(
          path: '/pain-while-urinating',
          builder: (context, state) => const PainWhileUrinatingPage(),
        ),

        GoRoute(
          path: '/menstrual-cycle',
          builder: (context, state) => const MenstrualCyclePage(),
        ),

        GoRoute(
          path: '/pms-emotions',
          builder: (context, state) => const PmsAndEmotionsPage(),
        ),

        GoRoute(
          path: '/cervical-cancer',
          builder: (context, state) => const CervicalCancerPage(),
        ),

        GoRoute(
          path: '/breast-cancer',
          builder: (context, state) => const BreastCancerPage(),
        ),

        GoRoute(
          path: '/violence-against-women',
          builder: (context, state) => const ViolenceAgainstWomenPage(),
        ),

        GoRoute(
          path: '/perimenopause-menopause',
          builder: (context, state) => const MenopausePage(),
        ),

        GoRoute(
          path: '/self-care',
          builder: (context, state) => const SelfCarePage(),
        ),
      ],
    ),
  ],
);
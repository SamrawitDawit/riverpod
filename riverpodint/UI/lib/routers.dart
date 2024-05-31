
import 'package:go_router/go_router.dart';
import 'package:newcompiled/presentation/screens2/add_medicine_screen.dart';
import 'package:newcompiled/presentation/screens2/edit_medicine_screen.dart';
import 'package:newcompiled/presentation/screens2/list_medicine_screen.dart';
import 'package:newcompiled/presentation/screens2/login_screen.dart';
import 'package:newcompiled/presentation/screens2/main_pharma_page_screen.dart';
import 'package:newcompiled/presentation/screens2/medicine_view_screen.dart';
import 'package:newcompiled/presentation/screens2/order_list_screen.dart';
import 'package:newcompiled/presentation/screens2/order_page_screen.dart';
import 'package:newcompiled/presentation/screens2/signup_screen.dart';
import 'package:newcompiled/presentation/screens2/user_account._screen.dart';
import 'package:newcompiled/presentation/screens2/user_account_edit_screen.dart';
import 'package:newcompiled/presentation/screens2/welcome_screen.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => WelcomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignupPage(),
    ),
    GoRoute(
      path: '/mainPharma',
      builder: (context, state) {
        final isPharmacist = state.queryParams['isPharmacist'] == 'true';
        final userId = state.queryParams['user_id']!;
        return MainPharmaPage(isPharmacist: isPharmacist, user_id: userId);
      },
    ),
    GoRoute(
      path: '/orderPage',
      builder: (context, state) {
        final isEditing = state.queryParams['isEditing'] == 'true';
        final medicineId = state.queryParams['medicineId']!;
        final userId = state.queryParams['user_id']!;
        return OrderPage(isEditing: isEditing, medicineId: medicineId, user_id: userId);
      },
    ),

    GoRoute(
      path: '/main_pharma_page',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>;
        return MainPharmaPage(
          isPharmacist: params['isPharmacist'],
          user_id: params['user_id'],
        );
      },
    ),
    GoRoute(
      path: '/add_medicine',
      builder: (context, state) {
        final userId = state.extra as String;
        return AddMedicineScreen(user_id: userId);
      },
    ),
    GoRoute(
      path: '/edit_medicine',
      builder: (context, state) {
        return EditMedicineScreen();
      },
    ),
    GoRoute(
      path: '/medicine_view',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>;
        return MedicineViewPage(
          medicineItem: params['medicineItem'],
          isPharmacist: params['isPharmacist'],
          user_id: params['user_id'],
        );
      },
    ),
    GoRoute(
      path: '/list_medicine',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>;
        return ListMedicineScreen(
          isPharmacist: params['isPharmacist'],
          userId: params['userId'],
        );
      },
    ),
    GoRoute(
      path: '/order',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>;
        return OrderScreen(
          is_user: params['is_user'],
          user_id: params['user_id'],
        );
      },
    ),
    GoRoute(
      path: '/user_account',
      builder: (context, state) {
        final userId = state.extra as String;
        return UserAccount(user_id: userId);
      },
    ),
    GoRoute(
      path: '/user_account_edit',
      builder: (context, state) => UserAccountEditPage(),
    ),
  ],
);



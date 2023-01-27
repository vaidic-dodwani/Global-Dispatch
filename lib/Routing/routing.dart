import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:globaldispatch/Routing/route_names.dart';
import 'package:globaldispatch/Screens/AuthScreens/sign_in_page.dart';
import 'package:globaldispatch/Screens/AuthScreens/sign_up_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouteNames.root,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: SignInPage()

              // App.isLoggedIn ? const HomePage() : SignInPage()

              );
        },
      ),
      GoRoute(
        name: RouteNames.signIn,
        path: '/signin',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: SignInPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.signUp,
        path: '/signup',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: SignUpPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.panNumber,
        path: '/pannumber/:email',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: PanNumberPage(
              email: state.params['email']!,
            ),
          );
        },
      ),
      GoRoute(
        name: RouteNames.verifier,
        path: '/verifier/:email/:token',
        pageBuilder: (context, state) {
          return MaterialPage(
            child: VerificationChecker(
                email: state.params['email']!, token: state.params['token']!),
          );
        },
      ),
      GoRoute(
        name: RouteNames.homePage,
        path: '/homepage',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: HomePage(),
          );
        },
        routes: [
          GoRoute(
            name: RouteNames.coinPage,
            path: 'coinpage/:shortName',
            pageBuilder: (context, state) {
              log(state.params.toString());
              return MaterialPage(
                child: CoinPage(
                  shortName: state.params['shortName']!,
                ),
              );
            },
          ),
          GoRoute(
            name: RouteNames.personalDetails,
            path: 'personaldetails',
            pageBuilder: (context, state) {
              return MaterialPage(
                child: ProfilePan(),
              );
            },
          ),
          GoRoute(
            name: RouteNames.security,
            path: 'security',
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: Security(),
              );
            },
            routes: [
              GoRoute(
                name: RouteNames.changePassword,
                path: 'changepassword',
                pageBuilder: (context, state) {
                  return MaterialPage(
                    child: ChangePassword(),
                  );
                },
              ),
              GoRoute(
                name: RouteNames.phoneNumber,
                path: 'phonenumber',
                pageBuilder: (context, state) {
                  return MaterialPage(
                    child: PhoneNumberPage(),
                  );
                },
                routes: [
                  GoRoute(
                    name: RouteNames.phoneNumberOTP,
                    path: 'phonenumberOTP:/phone_number',
                    pageBuilder: (context, state) {
                      return MaterialPage(
                        child: PhoneOtpPage(
                          phoneNumber: state.params['phone_number']!,
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          )
        ],
      ),
    ],
  );
}

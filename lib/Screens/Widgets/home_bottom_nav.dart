import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globaldispatch/Riverpod/riverpod_variables.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class HomeBottomNavBar extends ConsumerWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int page = ref.watch(homeBottomNavProvider);
    return SizedBox(
      height: double.infinity,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0, left: 16, right: 16),
          child: Container(
            height: 76,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Palette.neutralBlack,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: bottomnavbaritems(page),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> bottomnavbaritems(int page) {
  return [
    InkWell(
      onTap: () {
        homeBottomNavNotifier.setPage(0);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home_filled,
            color: page == 0 ? Palette.primaryColor : Palette.neutralGrey,
          ),
          Text(
            "Home",
            style: labelMedium(
                fontColor:
                    page == 0 ? Palette.primaryColor : Palette.neutralGrey),
          )
        ],
      ),
    ),
    InkWell(
      onTap: () {
        homeBottomNavNotifier.setPage(1);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.flight_takeoff_sharp,
            color: page == 1 ? Palette.primaryColor : Palette.neutralGrey,
          ),
          Text(
            "Transit",
            style: labelMedium(
                fontColor:
                    page == 1 ? Palette.primaryColor : Palette.neutralGrey),
          )
        ],
      ),
    ),
    InkWell(
      onTap: () {
        homeBottomNavNotifier.setPage(2);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.flight_land_sharp,
            color: page == 2 ? Palette.primaryColor : Palette.neutralGrey,
          ),
          Text(
            "Shipments",
            style: labelMedium(
                fontColor:
                    page == 2 ? Palette.primaryColor : Palette.neutralGrey),
          )
        ],
      ),
    ),
  ];
}

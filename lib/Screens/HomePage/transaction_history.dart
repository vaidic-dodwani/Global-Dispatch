import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globaldispatch/Screens/Widgets/auth_heading.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class TransactionHistory extends ConsumerWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(children: [
          authTitleLargeText("History"),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
                itemCount: 15 + 1,
                itemBuilder: (context, index) {
                  if (index != 15) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Palette.neutralBlack,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        width: double.infinity,
                        height: 76,
                        child: Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                child: Center(
                                    child: SvgPicture.asset(
                                        "assests/bought_icon.svg"))),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 38,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Microsft",
                                              style: titleSmall(
                                                  fontColor:
                                                      Palette.primaryColor),
                                            ),
                                            Text("Dubai", style: labelSmall())
                                          ],
                                        ),
                                      ),
                                      Text("to", style: titleSmall()),
                                      Column(
                                        children: [
                                          Text("Tesla",
                                              style: titleSmall(
                                                  fontColor:
                                                      Palette.primaryColor)),
                                          Text("Bihar", style: labelSmall())
                                        ],
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 22.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Waiting For Approval",
                                            style: labelSmall(),
                                          ),
                                          Text(
                                            "\$696969",
                                            style: labelSmall(
                                                fontColor: Palette
                                                    .secondaryCorrectColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox(
                      height: 100,
                    );
                  }
                }),
          )
        ]),
      ),
    );
  }
}

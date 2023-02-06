import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globaldispatch/Riverpod/riverpod_variables.dart';
import 'package:globaldispatch/Screens/Widgets/auth_heading.dart';
import 'package:globaldispatch/Screens/Widgets/utilities.dart';

class AdminTransactionHistory extends ConsumerWidget {
  const AdminTransactionHistory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(getAdminTransactionHistory);

    return history.when(
      data: (data) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              authTitleLargeText("History"),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: (data.length + 1),
                  itemBuilder: (context, index) {
                    if (index != data.length) {
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                                child: Center(
                                  child: SvgPicture.asset(
                                      "assests/bought_icon.svg"),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          height: 38,
                                          child: Column(
                                            children: [
                                              Text(
                                                data[index]['source']
                                                    ['business']['name'],
                                                style: titleSmall(
                                                    fontColor:
                                                        Palette.primaryColor),
                                              ),
                                              Text(
                                                  data[index]['source']
                                                          ['location']
                                                      .toString()
                                                      .substring(
                                                          0,
                                                          data[index]['source'][
                                                                      'location']
                                                                  .toString()
                                                                  .length -
                                                              3),
                                                  style: labelSmall())
                                            ],
                                          ),
                                        ),
                                        Text("to", style: titleSmall()),
                                        Column(
                                          children: [
                                            Text(
                                                ((data[index]['destination']
                                                                ['business'] ==
                                                            null)
                                                        ? " "
                                                        : data[index]
                                                                ['destination'][
                                                            'business']['name'])
                                                    .toString(),
                                                style: titleSmall(
                                                    fontColor:
                                                        Palette.primaryColor)),
                                            Text(
                                                ((data[index]['destination']
                                                            ['business'] ==
                                                        "null")
                                                    ? data[index]
                                                        ['destination_country']
                                                    : data[index]['destination']
                                                            ['location']
                                                        .toString()
                                                        .substring(
                                                            0,
                                                            data[index]['destination']
                                                                        [
                                                                        'location']
                                                                    .toString()
                                                                    .length -
                                                                3)),
                                                style: labelSmall())
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
                                              data[index]['status'],
                                              style: labelSmall(),
                                            ),
                                            Text(
                                              data[index]['final_price'] == null
                                                  ? "${data[index]['expected_price']}"
                                                  : "${data[index]['final_price']}",
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
                  },
                ),
              )
            ],
          ),
        );
      },
      error: (er, stack) {
        return Text(er.toString(), style: titleSmall());
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

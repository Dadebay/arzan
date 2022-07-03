// ignore_for_file: file_names

import 'package:arzan/components/brandCard.dart';
import 'package:arzan/views/others/index.dart';

class BookMarkPage extends StatelessWidget {
  BookMarkPage({Key? key}) : super(key: key);
  List list = [
    "Harytlar",
    "Following Offical Users",
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: MyAppBar(
              backArrow: true,
              iconRemove: true,
              elevation: 0,
              icon: IconButton(
                icon: const Icon(
                  IconlyLight.delete,
                  color: Colors.black,
                ),
                onPressed: () {
                  showDeleteDialog(context);
                },
              ),
              name: "favorite"),
          body: Column(
            children: [
              customDivider(),
              Container(
                color: Colors.white,
                child: TabBar(
                    labelPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
                    labelStyle: const TextStyle(fontFamily: normsProSemiBold, fontSize: 17),
                    unselectedLabelStyle: const TextStyle(fontFamily: normsProMedium, fontSize: 17),
                    labelColor: kPrimaryColor,
                    isScrollable: false,
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 1,
                    indicatorPadding: const EdgeInsets.only(top: 50),
                    indicator: const BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                    indicatorColor: kPrimaryColor,
                    tabs: List.generate(
                        list.length,
                        (index) => Tab(
                              text: list[index],
                            ))),
              ),
              customDivider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TabBarView(children: [
                    const Center(
                      child: Text("Favorited Product"),
                    ),
                    GridView.builder(
                      itemCount: 12,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.5 / 3),
                      itemBuilder: (BuildContext context, int index) {
                        return BrandCard(
                          index: index,
                          name: "Page Name",
                          followed: true,
                        );
                      },
                    ),
                  ]),
                ),
              )
            ],
          )),
    );
  }
}

// ignore_for_file: file_names, deprecated_member_use

import 'package:arzan/components/searchCard.dart';
import 'package:arzan/controllers/SettingsController.dart';
import 'package:arzan/views/others/index.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'ProductProfil.dart';

class OfficialProfil extends StatefulWidget {
  const OfficialProfil({Key? key}) : super(key: key);

  @override
  State<OfficialProfil> createState() => _OfficialProfilState();
}

class _OfficialProfilState extends State<OfficialProfil> {
  final ScrollController scrollCtrl = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollCtrl.addListener(() {
      if (scrollCtrl.position.pixels > 250) {
        Get.find<SettingsController>().hidePorfilImage.value = true;
      } else if (Get.find<SettingsController>().hidePorfilImage.value == true && scrollCtrl.position.pixels < 250) {
        Get.find<SettingsController>().hidePorfilImage.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 440,
                  floating: true,
                  pinned: false,
                  snap: true,
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        topButtons(),
                        Container(
                            height: 140,
                            width: 140,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: backgroundColor),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/images/brands/1.jpg",
                                fit: BoxFit.cover,
                              ),
                            )),
                        namePart(),
                        ratingPart(),
                        customDivider()
                      ],
                    ),
                  ),
                ),
                tabbar(),
                SliverToBoxAdapter(
                  child: customDivider(),
                )
              ];
            },
            body: TabBarView(children: [
              Container(
                  color: backgroundColor,
                  child: StaggeredGridView.countBuilder(
                    staggeredTileBuilder: (index) => StaggeredTile.count(1, index % 2 == 0 ? 1.2 : 1.5),
                    mainAxisSpacing: 8, // vertical spacing between items
                    crossAxisSpacing: 8, // horizontal spacing between items
                    crossAxisCount: 2, // no. of virtual columns in grid
                    itemCount: 23,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.to(() => const ProductProfil());
                        },
                        child: SearchCard(index: index)),
                  )),
              Container(
                color: backgroundColor,
              ),
              Container(
                color: Colors.white,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return const ExpansionTile(
                      initiallyExpanded: false,
                      title: Text("Amanow Aman", style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 18)),
                      subtitle: Text(
                        "16.06.2022",
                        style: TextStyle(color: Colors.grey),
                      ),
                      childrenPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      children: [
                        Text(
                          loremImpsum,
                        ),
                      ],
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 30,
                      ),
                    );
                  },
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Padding textPart({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: kPrimaryColor,
            size: 28,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey, fontFamily: normsProMedium, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  SliverPersistentHeader tabbar() {
    return SliverPersistentHeader(
      delegate: _SliverAppBarDelegate(
        TabBar(
            isScrollable: false,
            labelPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            labelStyle: const TextStyle(fontFamily: normsProBold, fontSize: 17),
            unselectedLabelStyle: const TextStyle(fontFamily: normsProMedium, fontSize: 17),
            labelColor: kPrimaryColor,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: kPrimaryColor,
            indicatorWeight: 4,
            indicatorPadding: const EdgeInsets.only(top: 45),
            indicator: const BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            tabs: [
              Tab(
                text: "Harytlar".tr,
              ),
              Tab(
                text: "Followers".tr,
              ),
              Tab(
                text: "Teswirler".tr,
              ),
            ]),
      ),
      pinned: true,
    );
  }

  Padding namePart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "Gözellik we arassaçylyk serişdeleri",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 22),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 10),
            child: Text(
              "Ashgabat",
              style: TextStyle(color: Colors.grey, fontFamily: normsProSemiBold, fontSize: 18),
            ),
          ),
          Text(
            "Siziň üçin ähli gözellik serişdeleriniň hem-de öýe gerekli bolan himiýa harytlary saýtlar bir ýerde jemlenen. Brendowyý we ýokary hilli gözellik serişdeleri hem-de öýüňiziň arasaçylygy üçin niýetlenen himiýa harytlary gysga wagtyň içinde bu ýerde tapyp bilersiňiz, dowam edýän aksiýalardan we arzanladyşlardan habarly boluň. Hödür etmek bizden, saýlamak sizden",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(color: Colors.grey, fontFamily: normsProMedium, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Padding ratingPart() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 20, top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text("106", style: TextStyle(color: Colors.black, fontFamily: normsProBold, fontSize: 20)),
                Text(
                  "Like sany",
                  style: TextStyle(color: Colors.grey, fontFamily: normsProMedium, fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text("2578", style: TextStyle(color: Colors.black, fontFamily: normsProBold, fontSize: 20)),
                Text(
                  "Görülme sany",
                  style: TextStyle(color: Colors.grey, fontFamily: normsProMedium, fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text("50", style: TextStyle(color: Colors.black, fontFamily: normsProBold, fontSize: 20)),
                Text(
                  "Haryt sany",
                  style: TextStyle(color: Colors.grey, fontFamily: normsProMedium, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding topButtons() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        top: 20,
        right: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                IconlyLight.arrowLeft,
                color: Colors.black,
              ),
            ),
          ),
          PopupMenuButton<Text>(
              itemBuilder: (context) => <PopupMenuEntry<Text>>[
                    const PopupMenuItem<Text>(
                      child: Text('Jan etmek'),
                    ),
                    const PopupMenuItem<Text>(
                      child: Text('Sms ugrat'),
                    ),
                    const PopupMenuItem<Text>(
                      child: Text('Follow'),
                    ),
                  ]),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

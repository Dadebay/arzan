// ignore_for_file: file_names, deprecated_member_use
import 'package:arzan/components/buttons/bookmarkButton.dart';
import 'package:arzan/components/constants/constants.dart';
import 'package:arzan/components/searchCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rich_text_view/rich_text_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductProfil extends StatefulWidget {
  const ProductProfil({Key? key}) : super(key: key);

  @override
  State<ProductProfil> createState() => _ProductProfilState();
}

class _ProductProfilState extends State<ProductProfil> {
  int selectedIndex = 0;
  bool isPinned = false;

  final ScrollController _sliverScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _sliverScrollController.addListener(() {
      print(_sliverScrollController.offset);

      if (!isPinned && _sliverScrollController.hasClients && _sliverScrollController.offset >= 250.0) {
        setState(() {
          isPinned = true;
          print(isPinned);
        });
      } else if (isPinned && _sliverScrollController.hasClients && _sliverScrollController.offset <= 130.0) {
        setState(() {
          isPinned = false;
          print(isPinned);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _sliverScrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 365,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            centerTitle: true,
            backwardsCompatibility: true,
            actions: [
              isPinned
                  ? GestureDetector(
                      onTap: () {
                        // Get.back();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          IconlyLight.heart,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
            leading: isPinned
                ? GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      IconlyLight.arrowLeftCircle,
                      color: Colors.black,
                    ),
                  )
                : const SizedBox.shrink(),
            title: isPinned
                ? const Text(
                    "Haryt Ady",
                    style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold),
                  )
                : const SizedBox.shrink(),
            flexibleSpace: AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: imagePart(),
              crossFadeState: isPinned ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1000),
              sizeCurve: Curves.decelerate,
              firstCurve: Curves.decelerate,
              secondCurve: Curves.decelerate,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Haryt ady",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontFamily: normsProSemiBold),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 14),
                      color: Colors.grey.shade200,
                      height: 1,
                      width: double.infinity,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: iconWidget(icon: IconlyLight.calendar, data: "02.07.2022", color: Colors.blue.shade100)),
                        Expanded(child: iconWidget(icon: Icons.remove_red_eye_outlined, data: "1528", color: Colors.grey.shade300)),
                        Expanded(child: iconWidget(icon: Icons.thumb_up_alt_outlined, data: "578", color: Colors.red.shade200)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: backgroundColor,
              width: double.infinity,
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Maglumat",
                    style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  spec(
                    a: "Saher :",
                    b: "Ahsgabat",
                  ),
                  spec(
                    a: "Nomer :",
                    b: "+99362990344",
                  ),
                  spec(
                    a: "Imo :",
                    b: "@G_Dadebay",
                  ),
                  spec(
                    a: "Instagram :",
                    b: "@G_Dadebay",
                  ),
                  spec(
                    a: "WebSahypa :",
                    b: "www.arzan.info",
                  ),
                  spec(
                    a: "Dostawka :",
                    b: "Bar",
                  ),
                  spec(
                    a: "Hastag :",
                    b: "#Kowus #Ak_Renk #Arzan #Dostawka_Bar #Betow",
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Text(
                          "Düşündiriş : ",
                          style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          loremImpsum,
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.black54, fontFamily: normsProMedium, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: backgroundColor,
              width: double.infinity,
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(bottom: 15, top: 15),
              child: ExpansionTile(
                title: const Text(
                  "Teswirler",
                  style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 20),
                ),
                initiallyExpanded: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Lottie.asset("assets/lottie/NoComment.json", width: 250),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: borderRadius5),
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "Teswir yazmak ucin ulgama girin",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(color: kPrimaryColor, borderRadius: borderRadius5),
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "Ulgama gir",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontFamily: normsProSemiBold),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: backgroundColor,
              width: double.infinity,
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Menzes harytlar",
                  style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 22),
                ),
                StaggeredGridView.countBuilder(
                    staggeredTileBuilder: (index) => StaggeredTile.count(1, index % 2 == 0 ? 1.2 : 1.5),
                    mainAxisSpacing: 8, // vertical spacing between items
                    crossAxisSpacing: 8, // horizontal spacing between items
                    crossAxisCount: 2, // no. of virtual columns in grid
                    itemCount: 9,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => SearchCard(index: index)),
              ],
            ),
          )),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: 100,
            ),
          ),
        ],
      ),
      bottomSheet: bottomButton(),
    );
  }

  Padding spec({
    required String a,
    required String b,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              a,
              style: TextStyle(color: Colors.grey.shade400, fontFamily: normsProSemiBold, fontSize: 17),
            ),
          ),
          Expanded(
            child: RichTextView(
              text: b,
              maxLines: 3,
              onEmailClicked: (email) => print('$email clicked'),
              onHashTagClicked: (hashtag) => print('is $hashtag trending?'),
              onMentionClicked: (mention) => print('$mention clicked'),
              onUrlClicked: (url) => print('visting $url?'),
              truncate: true,
              viewLessText: 'less',
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontFamily: normsProSemiBold,
                fontSize: 17,
              ),
              linkStyle: const TextStyle(color: kPrimaryColor),
              supportedTypes: const [ParsedType.EMAIL, ParsedType.HASH, ParsedType.MENTION, ParsedType.URL, ParsedType.BOLD],
            ),
          ),
        ],
      ),
    );
  }

  Row iconWidget({required IconData icon, required String data, required Color color}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        Text(
          data,
          style: TextStyle(color: Colors.grey.shade500),
        )
      ],
    );
  }

  Container bottomButton() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: RaisedButton(
        onPressed: () {
          launch("tel://+99362990344");
        },
        elevation: 4,
        padding: const EdgeInsets.symmetric(vertical: 14),
        color: kPrimaryColor,
        shape: const RoundedRectangleBorder(borderRadius: borderRadius30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                CupertinoIcons.phone_fill,
                color: Colors.white,
              ),
            ),
            Text(
              "call".tr,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: normsProBold),
            ),
          ],
        ),
      ),
    );
  }

  Widget imagePart() {
    return SizedBox(
      height: 400,
      width: Get.size.width,
      child: Stack(
        children: [
          Positioned.fill(
            child: CarouselSlider.builder(
              itemCount: 10,
              itemBuilder: (context, index, count) {
                return Container(
                  color: Colors.red,
                  child: Image.asset(
                    "assets/images/profil/${index + 1}.png",
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                onPageChanged: (index, CarouselPageChangedReason) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                viewportFraction: 1.0,
                autoPlay: false,
                scrollDirection: Axis.vertical,
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            top: 30,
            left: 15,
            child: Center(
              child: SizedBox(
                width: 30,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimatedContainer(
                        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                        height: selectedIndex == index ? 9 : 8,
                        width: selectedIndex == index ? 9 : 8,
                        decoration: BoxDecoration(
                          color: selectedIndex == index ? Colors.black : Colors.transparent,
                          shape: BoxShape.circle,
                          border: selectedIndex == index ? Border.all(color: Colors.black, width: 0) : Border.all(color: Colors.white, width: 1.5),
                        ),
                      );
                    }),
              ),
            ),
          ),
          const Positioned(
              top: 40,
              right: 10,
              child: BookMarkButton(
                color: false,
              )),
          Positioned(
              top: 90,
              right: 10,
              child: Container(
                decoration: const BoxDecoration(color: Colors.white, borderRadius: borderRadius10),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.share,
                  color: Colors.black,
                ),
              )),
          Positioned(
              top: 40,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white, borderRadius: borderRadius10),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(IconlyLight.arrowLeftCircle),
                ),
              ))
        ],
      ),
    );
  }
}

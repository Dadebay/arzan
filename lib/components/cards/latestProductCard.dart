import 'package:arzan/components/buttons/bookmarkButton.dart';
import 'package:arzan/views/others/index.dart';

class LatestProductsCard extends StatelessWidget {
  final int index;
  const LatestProductsCard({Key? key, required this.index, required this.waitng, required this.agree, required this.rejected}) : super(key: key);
  final bool waitng;
  final bool agree;
  final bool rejected;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.size.width,
        height: 160,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200, width: 2), color: waitng ? Colors.grey.shade200 : Colors.white, borderRadius: borderRadius10),
        margin: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  height: Get.size.height,
                  width: Get.size.width,
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  child: ClipRRect(
                    borderRadius: borderRadius10,
                    child: Image.asset(
                      "assets/images/products2/${index + 1}.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Haryt Ady",
                            maxLines: 1,
                            style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 20),
                          ),
                        ),
                        waitng
                            ? Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  rejected
                                      ? IconlyLight.infoSquare
                                      : agree
                                          ? IconlyLight.tickSquare
                                          : IconlyLight.timeSquare,
                                  color: rejected
                                      ? Colors.red
                                      : agree
                                          ? kPrimaryColor
                                          : Colors.orange,
                                  size: 30,
                                ),
                              )
                            : const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(IconlyLight.heart),
                              ),
                        // const BookMarkButton(
                        //     color: false,
                        //   )
                      ],
                    ),
                    const Text(
                      "400 TMT",
                      maxLines: 1,
                      style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: 18),
                    ),
                    const Text(
                      loremImpsum,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: normsProMedium),
                    ),
                    const Text(
                      "10.06.2022  -  Official User Name",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.grey, fontSize: 13, fontFamily: normsProMedium),
                    ),
                  ],
                ))
          ],
        ));
  }
}

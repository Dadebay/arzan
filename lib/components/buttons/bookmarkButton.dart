// ignore_for_file: file_names

import 'dart:ui';

import 'package:arzan/views/others/index.dart';

class BookMarkButton extends StatefulWidget {
  const BookMarkButton({Key? key, this.color}) : super(key: key);
  final bool? color;
  @override
  State<BookMarkButton> createState() => _BookMarkButtonState();
}

class _BookMarkButtonState extends State<BookMarkButton> {
  bool bookmarkIcon = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          bookmarkIcon = !bookmarkIcon;
        });
      },
      child: widget.color == false
          ? Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white, borderRadius: borderRadius10),
              child: Icon(bookmarkIcon ? IconlyBold.heart : IconlyLight.heart, color: bookmarkIcon ? kPrimaryColor : Colors.black),
            )
          : ClipRRect(
              borderRadius: borderRadius10,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: borderRadius10),
                  child: Icon(bookmarkIcon ? IconlyBold.heart : IconlyLight.heart, color: bookmarkIcon ? kPrimaryColor : Colors.black),
                ),
              ),
            ),
    );
  }
}

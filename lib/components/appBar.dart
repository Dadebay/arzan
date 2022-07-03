// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, avoid_implementing_value_types
import 'package:arzan/views/others/index.dart';

class MyAppBar extends StatelessWidget implements PreferredSize {
  final Widget? icon;
  final bool backArrow;
  final bool iconRemove;
  final String name;
  final double? elevation;
  const MyAppBar({
    Key? key,
    this.icon,
    required this.backArrow,
    required this.iconRemove,
    required this.name,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeWidth = MediaQuery.of(context).size.width;
    return AppBar(
        elevation: elevation,
        centerTitle: true,
        leadingWidth: 60,
        leading: backArrow
            ? Padding(
                padding: const EdgeInsets.all(14.0),
                child: IconButton(
                  icon: Icon(
                    IconlyLight.arrowLeftCircle,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ))
            : SizedBox.shrink(),
        actions: [
          if (iconRemove == false)
            SizedBox.shrink()
          else
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: icon,
            )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          name.tr,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontFamily: normsProSemiBold, fontSize: sizeWidth > 800 ? 30 : 20),
        ));
  }

  @override
  Widget get child => Text("ad");

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

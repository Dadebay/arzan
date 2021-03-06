// ignore_for_file: file_names

import 'package:arzan/views/others/index.dart';

class ProfilButton extends StatelessWidget {
  final String name;
  final Function() onTap;
  final IconData icon;
  const ProfilButton({
    Key? key,
    required this.name,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        tileColor: Colors.white,
        minVerticalPadding: 23,
        title: Text(
          name.tr,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(color: Colors.black, fontFamily: normsProSemiBold),
        ),
        leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: backgroundColor.withOpacity(0.8), borderRadius: borderRadius15),
            child: Icon(
              icon,
              color: Colors.black,
            )),
        trailing: const Icon(
          IconlyLight.arrowRightCircle,
          color: Colors.black,
        ));
  }
}

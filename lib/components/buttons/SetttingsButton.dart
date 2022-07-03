// ignore_for_file: file_names

import 'package:arzan/views/others/index.dart';

class SettingButton extends StatelessWidget {
  final String name;
  final Function() onTap;
  final Widget icon;
  const SettingButton({Key? key, required this.name, required this.onTap, required this.icon}) : super(key: key);

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
      trailing: icon,
    );
  }
}

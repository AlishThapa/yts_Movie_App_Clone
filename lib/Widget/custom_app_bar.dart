import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, this.bottom,
  });
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      backgroundColor: Colors.black,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Logo-YTS.svg/1200px-Logo-YTS.svg.png'),
      ),
      actions: const [
        Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.search)),
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: Text(
                  '4K',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ))),
        Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.bar_chart)),
        Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.list_alt)),
        Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.person)),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}

import 'package:Taski/shared/widgets/horizontal_spacer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final avatarImage =
      "https://s3-alpha-sig.figma.com/img/6cd0/1d73/d411911e81e2399df614e2d7cd846b49?Expires=1736726400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lRRNXacUJVchxUIJAVTHwwfkSPU1ZoMNZBWmCXQNSZPebymxZoVc1bgYXQd1ou5cFPYXz4KtRxavmi37UuWRU9mo7STKMIxyK2clBlB9o3omJmFgFOPVr7FidGT83KH~JHxKPaoVd2H6GJfB8scmjFFDrBik5CH1ye1TRiMejKqhAhMqYWbQbIXyPztqS8Xb3XTeSAO5QDLSgnyQ-Bt8B1X7CuyYwUaGRAnq3d4eXZ9U2btUCCvuE9UYRB1LW31IM060pEfxSshAxPMLY8KkSj1rSGKq2HpKPxDFlSFqEOeZutt3dRgKgBnxjVH48qMqe-DYbdCEHYJv1tWABkpevA__";

  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 120,
      leading: Row(
        children: [
          HorizontalSpacerWidget(),
          Image.asset("assets/images/logo.png", width: 28, height: 28),
          HorizontalSpacerWidget(),
          Text(
            "Taski",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3F3D56),
            ),
          ),
        ],
      ),
      actions: [
        Text(
          "John",
          style: TextStyle(
            color: Color(0xFF3F3D56),
            fontWeight: FontWeight.w600,
          ),
        ),
        HorizontalSpacerWidget(),
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            avatarImage,
          ),
        ),
        HorizontalSpacerWidget(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_constance.dart';

class WriterItemWidget extends StatelessWidget {
  final String writerName;

  const WriterItemWidget({
    super.key,
    required this.writerName,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          AppAssets.avatar,
          width: screenSize.width*.15,
        ),
        //  CircleAvatar(
        //   backgroundImage: AssetImage(AppAssets.avatar),
        //   backgroundColor: AppConstance.primaryBackgroundColor,
        //   radius: 40,
        // ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          width: screenSize.width * .3,
          child: Text(
            writerName,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ),
      ],
    );
  }
}

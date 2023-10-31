import 'package:flutter/material.dart';
import 'package:rx_dart/constants/theme/color/colors.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/searchbar.dart';
import 'package:rx_dart/presentation/widgets/appbar/widgets/waved_container.dart';

class FlexibleSpaceAppBar extends StatelessWidget {
  const FlexibleSpaceAppBar({super.key});

  @override
  Widget build(BuildContext context) =>   FlexibleSpaceBar(
      background: Container(alignment: Alignment.bottomCenter ,padding: EdgeInsets.only(bottom: 10),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             IconButton(onPressed: (){}, icon: Icon(Icons.filter_list_sharp)),
          SearchAppBar()
        ]),
      ) );
}

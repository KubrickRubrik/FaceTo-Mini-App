import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/pages/a_home/controller/controller.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:provider/provider.dart';
part 'widgets/banner.dart';
part 'widgets/button_back.dart';
part 'widgets/logo.dart';
part 'widgets/rank.dart';
part 'widgets/list_links.dart';

/// Layout: author's page
class DownloadData extends StatelessWidget {
  const DownloadData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //? Main section
        Container(
          constraints: const BoxConstraints(minHeight: 200),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          clipBehavior: Clip.hardEdge,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //? Author Banner & Logo & Nick
              Stack(
                children: [
                  //? Banner
                  _Banner(),
                  //? Back
                  Positioned(
                    top: 10,
                    left: 10,
                    child: _ButtonBack(),
                  ),
                  //? Logo
                  Positioned(
                    bottom: 0,
                    left: 25,
                    child: _Logo(),
                  ),
                  //? Rank & Nick
                  Positioned(
                    bottom: 0,
                    left: 155,
                    right: 0,
                    child: _Rank(),
                  ),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
        const SizedBox(height: 8),
        //? Link
        const _ListLinks(),
      ],
    );
  }
}

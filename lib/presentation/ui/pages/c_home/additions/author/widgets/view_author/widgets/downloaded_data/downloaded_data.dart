import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/additions/author/author.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:facetomini/presentation/ui/components/localization/controller.dart';
import 'package:facetomini/core/config/links.dart';
import 'package:facetomini/core/config/numbers.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/controller/controller.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
part 'widgets/banner.dart';
part 'widgets/button_back.dart';
part 'widgets/description.dart';
part 'widgets/list_link.dart';
part 'widgets/logo.dart';
part 'widgets/rank.dart';
part 'widgets/subscribers.dart';
part 'widgets/view_link.dart';

/// Author's page
class DownloadedData extends StatelessWidget {
  const DownloadedData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    child: _Back(),
                  ),
                  //? Logo
                  Positioned(
                    bottom: 0,
                    left: 25,
                    child: _Logo(),
                  ),
                  //? Rank
                  Positioned(
                    bottom: 0,
                    left: 155,
                    right: 0,
                    child: _Rank(),
                  ),
                  //? Subscribers
                  _Subscribers(),
                ],
              ),
              SizedBox(height: 15),
              //? Description
              _Description(),
            ],
          ),
        ),
        const SizedBox(height: 8),
        //? View link
        const _ViewLink(),
        //? Link
        const _ListLinks(),
      ],
    );
  }
}

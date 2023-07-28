import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/pages/a_home/controller/controller.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:provider/provider.dart';

class NoneViewAuthorPage extends StatelessWidget {
  const NoneViewAuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<PagesControllerProvider>(context, listen: false).setViewInfoAuthorPage();
      },
      child: Container(
        color: const Color(0xCC000000),
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                AppIcons.spy,
                size: 80,
                color: Color(0xFFFFFFFF),
              ),
              const SizedBox(height: 10),
              Text(
                context.lcz.noneAuthorOops,
                style: const TextStyle(
                  color: Color(0xFFFF9900),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                context.lcz.noneAuthorLabel,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.lcz.titleErrorApp,
          style: context.textStyle.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                AppImages.errorApp,
                width: 200,
                height: 200,
              ),
              SizedBox(
                width: 250,
                child: Text(
                  context.lcz.errorRepairsApp,
                  textAlign: TextAlign.center,
                  // style: context.textStyle.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

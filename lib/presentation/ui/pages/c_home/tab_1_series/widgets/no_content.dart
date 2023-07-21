import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';

class NoContentPageSeries extends StatelessWidget {
  const NoContentPageSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      enableFeedback: false,
      child: Center(
        child: SizedBox(
          width: 200.0,
          child: Text(
            context.lcz.isNoContent,
            textAlign: TextAlign.center,
            style: context.textStyle.bodyLarge,
          ),
        ),
      ),
    );
  }
}

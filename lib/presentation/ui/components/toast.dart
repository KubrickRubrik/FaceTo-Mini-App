import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';

abstract final class ToastMassage {
  static void toast(BuildContext context, String title, {TypeMassage code = TypeMassage.massage, int duration = 2}) {
    // Settings
    final ({int colorBackground, int colorText}) data = switch (code) {
      TypeMassage.error => (colorBackground: 0xFFDC0037, colorText: 0xFFFFFFFF),
      TypeMassage.warning => (colorBackground: 0xFFFF9800, colorText: 0xFF000000),
      _ => (colorBackground: 0xBA000000, colorText: 0xFFFFFFFF),
    };
    // Widget
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: duration),
        elevation: 2,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            color: Color(data.colorBackground),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: -4,
              )
            ],
          ),
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Comfortaa',
              color: Color(data.colorText),
              fontWeight: FontWeight.normal,
              fontSize: 17,
              // height: 1.6,
            ),
          ),
        ),
      ),
    );
  }
}

part of '../../controller.dart';

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Selector<PagesControllerProvider, int>(
      selector: (_, Model) => Model.indexTab,
      builder: (_, indexTab, child) {
        final appBar = _makeAppBar(indexTab, context);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 50,
          decoration: (indexTab == 2)
              ? null
              : BoxDecoration(
                  color: ThemesController.getThemeData<Color>(
                    component: TypeThemeComponent.appBarBackground,
                    val: context.read<SessionProvider>().sessionUser.settings.theme,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 4.0),
                      blurRadius: 10.0,
                      spreadRadius: -8.0,
                    )
                  ],
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title appBar
              _TitleAppBar(appBar),
              // Icon button  language and theme
              if (indexTab == 0) _InfoAppBar(),
            ],
          ),
        );
      },
    );
  }

  // Set settings appBar
  _AppBarTabSettings _makeAppBar(int indexTab, BuildContext context) {
    return switch (indexTab) {
      // Series page
      0 => _AppBarTabSettings(
          indexTab: 0,
          title: context.lcz.titleSeriesPage,
          titleColor: 0xFF000000,
          indexClickBack: 0,
          colorClickBack: Colors.transparent,
          colorIconClickBack: Colors.transparent,
        ),
      // Scenes page
      1 => _AppBarTabSettings(
          indexTab: 1,
          title: context.lcz.titleScenesPage,
          titleColor: 0xFF000000,
          indexClickBack: 0,
          colorClickBack: const Color(0xFF745291),
          colorIconClickBack: const Color(0xFFffffff),
        ),
      // Scene page
      _ => _AppBarTabSettings(
          indexTab: 2,
          title: context.lcz.titleScenePage,
          titleColor: 0xFFFFFFFF,
          indexClickBack: 1,
          colorClickBack: const Color(0xFFffb102),
          colorIconClickBack: const Color(0xFF1b1e53),
        ),
    };
  }
}

/// Title appBar
class _TitleAppBar extends StatelessWidget {
  const _TitleAppBar(this.appBar);
  final _AppBarTabSettings appBar;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //? Icon tap back
        _iconBack(
          appBar,
          context,
        ),
        //? Title
        Text(
          appBar.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: ThemesController.getThemeData<Color>(
              component: TypeThemeComponent.appBarContent,
              val: context.read<SessionProvider>().sessionUser.settings.theme,
            ),
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  //  Set settings iconBack for appBar
  Widget _iconBack(_AppBarTabSettings appBar, BuildContext context) {
    // For indexTab == 2 use different style icon
    if (appBar.indexTab == 0) return const SizedBox(width: 15);
    return InkWell(
      onTap: () {
        context.read<PagesControllerProvider>().swipeBack();
      },
      enableFeedback: false,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
        width: 50,
        alignment: Alignment.center,
        child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: appBar.colorClickBack,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Icon(
            AppIcons.back,
            size: 13,
            color: appBar.colorIconClickBack,
          ),
        ),
      ),
    );
  }
}

/// Button Settings
class _InfoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //! Settings
        InkWell(
          onTap: () {
            context.read<SessionProvider>().setViewMenuSettings();
          },
          child: Container(
            width: 35,
            alignment: Alignment.center,
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                AppIcons.settings,
                size: 24,
                color: ThemesController.getThemeData<Color>(
                  component: TypeThemeComponent.appBarContent,
                  val: context.read<SessionProvider>().sessionUser.settings.theme,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 7),
      ],
    );
  }
}

// Settings for appBar
final class _AppBarTabSettings {
  final int indexTab;
  final String title;
  final int titleColor;
  final int indexClickBack;
  final Color colorClickBack;
  final Color colorIconClickBack;

  _AppBarTabSettings({
    required this.indexTab,
    required this.title,
    required this.titleColor,
    required this.indexClickBack,
    required this.colorClickBack,
    required this.colorIconClickBack,
  });
}

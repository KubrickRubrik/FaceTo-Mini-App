part of '../../controller.dart';

class _AppBar extends StatelessWidget {
  const _AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ControllerPagesProvider, int>(
      selector: (_, Model) => Model.indexTab,
      builder: (_, indexTab, child) {
        final appBar = _makeAppBar(indexTab, context);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            boxShadow: [
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
              _InfoAppBar(),
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
          indexClickBack: 0,
          colorClickBack: Colors.transparent,
          colorIconClickBack: Colors.transparent,
        ),
      // Scenes page
      1 => _AppBarTabSettings(
          indexTab: 1,
          title: context.lcz.titleScenesPage,
          indexClickBack: 0,
          colorClickBack: const Color(0xFF745291),
          colorIconClickBack: const Color(0xFFffffff),
        ),
      // Scene page
      _ => _AppBarTabSettings(
          indexTab: 2,
          title: context.lcz.titleScenePage,
          indexClickBack: 1,
          colorClickBack: const Color(0xFFffb102),
          colorIconClickBack: const Color(0xFF1b1e53),
        ),
    };
  }
}

/// Title appBar
class _TitleAppBar extends StatelessWidget {
  const _TitleAppBar(this.appBar, {super.key});
  final _AppBarTabSettings appBar;
  @override
  Widget build(BuildContext context) {
    return //! Title and icon back
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //@ Icon tap back
        _iconBack(appBar),
        //@ Title
        Text(
          appBar.title,
          overflow: TextOverflow.ellipsis,
          style: context.textStyle.titleLarge,
        ),
      ],
    );
  }

  //  Set settings iconBack fro appBar
  Widget _iconBack(_AppBarTabSettings appBar) {
    // For indexTab == 2 use different style icon
    if (appBar.indexTab == 0) return const SizedBox(width: 15);
    if (appBar.indexTab == 2) return const SizedBox(width: 15);
    return InkWell(
      onTap: () {
        // _FMD_CONTROLLER.swipeTabBack(_clickBack);
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

/// Button language and theme selected
class _InfoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //! Language
        Container(
          width: 35,
          alignment: Alignment.center,
          child: PopupMenuButton(
            elevation: 8.0,
            itemBuilder: (BuildContext context) {
              // Make menu's item for select language app
              return AppLocalization.defaultLanguage.map((language) {
                return PopupMenuItem(
                  height: 40,
                  enabled: true,
                  child: InkWell(
                    onTap: () {
                      // _FMD_AUTH.setChangeLanguage(appLang.code);
                      Navigator.pop(context, null);
                    },
                    child: Center(
                      child: Container(
                        height: 40.0,
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        // color: (Provider.of<AppSessionBloc>(context, listen: false).language.code == appLang.code)
                        //     ? const Color(0x18040672)
                        //     : const Color(0xFFFFFFFF),
                        alignment: Alignment.center,
                        child: Text(language.title),
                      ),
                    ),
                  ),
                );
              }).toList();
            },
            child: Container(
              height: 25,
              width: 25,
              alignment: Alignment.center,
              child: const Icon(
                AppIcons.language,
                color: Color(0xFF745291),
                size: 22,
              ),
            ),
          ),
        ),
        //! Sound
        InkWell(
          onTap: () {
            context.read<SessionAppProvider>().setSound();
          },
          child: Container(
            width: 35,
            alignment: Alignment.center,
            child: Selector<SessionAppProvider, bool>(
              selector: (_, Model) => Model.sessionUser.settings.enabledSound,
              builder: (_, isSound, __) {
                return Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: isSound ? const Color(0xFF745291) : const Color(0xFFA50000),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    AppIcons.sound,
                    size: 16,
                    color: (isSound) ? const Color(0xFFF8F8F8) : const Color(0xFFE7E7E7),
                  ),
                );
              },
            ),
          ),
        ),
        //! Info
        InkWell(
          onTap: () {
            // _FMD_CONTROLLER.setViewInfo();
          },
          child: Container(
            width: 35,
            alignment: Alignment.center,
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: const Color(0xFF745291),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                AppIcons.info,
                size: 16,
                color: Color(0xFFF8F8F8),
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
  final int indexClickBack;
  final Color colorClickBack;
  final Color colorIconClickBack;

  _AppBarTabSettings({
    required this.indexTab,
    required this.title,
    required this.indexClickBack,
    required this.colorClickBack,
    required this.colorIconClickBack,
  });
}

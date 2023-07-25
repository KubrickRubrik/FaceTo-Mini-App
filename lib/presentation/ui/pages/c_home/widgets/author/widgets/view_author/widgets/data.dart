part of '../view_author.dart';

class _DataAuthor extends StatelessWidget {
  const _DataAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 200),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      clipBehavior: Clip.hardEdge,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //! Author Banner & Logo & Nick
          Stack(
            children: [
              //! Banner
              Positioned(
                top: 10,
                left: 10,
                child: _Banner(),
              ),
              //! Back
              Positioned(
                top: 10,
                left: 10,
                child: _Back(),
              ),
              //! Logo
              Positioned(
                bottom: 0,
                left: 25,
                child: _Logo(),
              ),
              //! Rank
              Positioned(
                bottom: 0,
                left: 155,
                right: 0,
                child: _Rank(),
              ),
              //! Subscribers
              _Subscribers(),
            ],
          ),
          SizedBox(height: 15),
          //! Description
          _Description(),
        ],
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<AuthorProvider, StatusContent>(
      selector: (_, Model) => Model.statePage,
      builder: (_, statePage, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 65),
          child: AspectRatio(
            aspectRatio: 1.6,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFdddddd),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFFffffff)),
                image: switch (statePage) {
                  StatusContent.isLoadContent => null,
                  _ => DecorationImage(
                      image: NetworkImage(
                        ConfigLinks.parseLinks(
                          context.read<AuthorProvider>().pageData.image.banner,
                        ),
                      ),
                      fit: BoxFit.cover,
                    ),
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Back extends StatelessWidget {
  const _Back();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<PagesControllerProvider>(context, listen: false).setViewInfoAuthorPage();
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: const Color(0xAA000000),
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: const Icon(AppIcons.back),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFdddddd),
        borderRadius: BorderRadius.circular(50),
        image: (Provider.of<CM_AuthorBloc>(context).stateSpinPage == ViewStatusPage.load)
            ? null
            : DecorationImage(
                image: NetworkImage(
                  APP_LINK.parseLinks(APP_STYLE.setSizeImage('viewLogoAuthor', Provider.of<CM_AuthorBloc>(context).author.image.logo, context)),
                ),
                fit: BoxFit.cover,
              ),
        border: Border.all(width: 1.5, color: const Color(0xFFffffff)),
        boxShadow: APP_STYLE.setShadow(0xFF000000, 0.0, 1.5, 3.0, -1.0),
      ),
    );
  }
}

class _Subscribers extends StatelessWidget {
  const _Subscribers({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<AuthorProvider, StatusContent>(
        selector: (_, Model) => Model.statePage,
        builder: (_, statePage, __) {
          if (statePage == StatusContent.isLoadContent) return const SizedBox.shrink();
          if (context.read<AuthorProvider>().pageData.stat.countSub == 0) return const SizedBox.shrink();
          return Positioned(
            bottom: 70,
            left: 155,
            right: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xAA000000),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      AppIcons.users,
                      color: Color(0xFFFFFFFF),
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      ConfigNumbers.shortValue(
                        context.read<AuthorProvider>().pageData.stat.countSub,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class _Description extends StatelessWidget {
  const _Description();
  @override
  Widget build(BuildContext context) {
    return Selector<AuthorProvider, String>(
        selector: (_, Model) => Model.pageData.about,
        builder: (_, about, __) {
          if (about.isEmpty) return const SizedBox.shrink();
          return Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.topLeft,
            child: Text(
              about,
              style: context.textStyle.bodySmall,
            ),
          );
        });
  }
}

class _Rank extends StatelessWidget {
  const _Rank();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //! Nick
          Container(
            height: 35,
            alignment: Alignment.centerLeft,
            child: (Provider.of<CM_AuthorBloc>(context).stateSpinPage == ViewStatusPage.load)
                ? Container(
                    margin: const EdgeInsets.all(3),
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFdddddd),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                : Text(
                    "${Provider.of<CM_AuthorBloc>(context).author.nick}",
                    overflow: TextOverflow.ellipsis,
                    style: APP_STYLE.setFontStyle(18.0, null, null, null, FontWeight.w400, context),
                  ),
          ),
          //! Author
          Row(
            children: [
              (Provider.of<CM_AuthorBloc>(context).stateSpinPage == ViewStatusPage.load)
                  ? Container(
                      margin: const EdgeInsets.only(left: 3),
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFFdddddd),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4114E0),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: APP_STYLE.setShadow(0xFF000000, 0.0, 1.0, 3.0, -1.0),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        APP_STRING.getRankApp(Provider.of<CM_AuthorBloc>(context).author.stat.rank.id),
                        style: APP_STYLE.setFontStyle(14.0, null, null, 0xFFffffff, null, context),
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}

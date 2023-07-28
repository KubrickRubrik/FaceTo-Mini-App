part of '../downloaded_data.dart';

/// View selected user contact
class _ViewLink extends StatelessWidget {
  const _ViewLink();

  @override
  Widget build(BuildContext context) {
    return Selector<AuthorProvider, bool>(
      selector: (_, Model) => Model.isViewDescriptionLink,
      builder: (_, isView, __) {
        return switch (isView) {
          false => const SizedBox.shrink(),
          true => const _ViewLinkDescription(),
        };
      },
    );
  }
}

/// Used to add logic for displaying the author's contact view section
class _ViewLinkDescription extends StatefulWidget {
  const _ViewLinkDescription();

  @override
  State<_ViewLinkDescription> createState() => __ViewLinkDescriptionState();
}

class __ViewLinkDescriptionState extends State<_ViewLinkDescription> {
  bool isSectionScaling = false;
  bool isSectionDisplay = false;
  // Hide author contact display panel
  void hideViewLink() {
    isSectionDisplay = false;
    setState(() {});
    Future.delayed(const Duration(milliseconds: 200), () {
      isSectionScaling = false;
      setState(() {});
    }).then((value) {
      context.read<AuthorProvider>().setViewLinks(null);
    });
  }

  void displayViewLink() {
    isSectionScaling = true;
    setState(() {});
    Future.delayed(const Duration(milliseconds: 200), () {
      isSectionDisplay = true;
      setState(() {});
    });
  }

  bool isUsedRedirect() {
    return context.read<AuthorProvider>().pageData.sectionLink.link.icon.redirect == 1;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      displayViewLink();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AuthorProvider, String>(
      selector: (_, Model) => Model.pageData.sectionLink.link.address,
      builder: (_, model, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          margin: const EdgeInsets.only(bottom: 8),
          height: (isSectionScaling)
              ? isUsedRedirect()
                  ? 150
                  : 100
              : 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
            opacity: (isSectionDisplay) ? 1 : 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFFffffff),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Wrap(
                children: [
                  //? The top panel of the contacts section
                  _LabelContact(hideViewLink),
                  //? Author contact resource
                  const _AuthorContact(),
                  //? Redirect to the author's contact
                  const _RedirectToAuthorContact(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// The top panel of the author contacts section
class _LabelContact extends StatelessWidget {
  const _LabelContact(this.hideViewLink);
  final Function hideViewLink;

  @override
  Widget build(BuildContext context) {
    final authorLink = context.read<AuthorProvider>().pageData.sectionLink.link;
    return InkWell(
      onTap: () {
        hideViewLink();
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F9FC),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              spreadRadius: -1,
            ),
          ],
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            //? icon
            SizedBox(
              width: 60,
              child: Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CachedNetworkImage(
                    imageUrl: ConfigLinks.parseLinks(authorLink.icon.url),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            //? Tex
            Flexible(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  authorLink.icon.title,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            // Url
            Container(
              width: 50,
              alignment: Alignment.centerLeft,
              child: const RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  AppIcons.back,
                  color: Color(0xFF555555),
                  size: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Author contact resource
class _AuthorContact extends StatelessWidget {
  const _AuthorContact();

  @override
  Widget build(BuildContext context) {
    final linkAuthor = context.read<AuthorProvider>().pageData.sectionLink.link;
    return SizedBox(
      height: 45,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          //? icon
          const SizedBox(
            width: 60,
            child: Center(
              child: Icon(
                AppIcons.user,
                color: Color(0xFF2E2E2E),
              ),
            ),
          ),
          //? Addres
          Flexible(
            child: InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: linkAuthor.address));
                ToastMassage.toast(context, context.lcz.infoCopy);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  linkAuthor.address,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF0D5788),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          //? Cupy Url
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: linkAuthor.address));
              ToastMassage.toast(context, context.lcz.infoCopy, code: TypeMassage.warning);
            },
            child: const SizedBox(
              width: 50,
              child: Center(
                child: Icon(
                  AppIcons.copy,
                  color: Color(0xFF002BEB),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Redirect to the author's contact resource
class _RedirectToAuthorContact extends StatelessWidget {
  const _RedirectToAuthorContact();

  @override
  Widget build(BuildContext context) {
    final linkAuthor = context.read<AuthorProvider>().pageData.sectionLink.link;
    if (linkAuthor.icon.redirect != 1) return const SizedBox();
    return SizedBox(
      height: 45,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          //? Icon
          Container(
            width: 60,
            alignment: Alignment.center,
            child: const Icon(
              AppIcons.url,
              color: Color(0xFF2E2E2E),
            ),
          ),
          //? Address
          Flexible(
            child: InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: "${linkAuthor.icon.pattern}${linkAuthor.address}"));
                ToastMassage.toast(context, context.lcz.infoCopy, code: TypeMassage.warning);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${linkAuthor.icon.pattern}${linkAuthor.address}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF0D5788),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          //? Url
          InkWell(
            onTap: () {
              Future.microtask(() async {
                final path = Uri.parse("${linkAuthor.icon.pattern}${linkAuthor.address}");
                if (await canLaunchUrl(path)) {
                  await launchUrl(path);
                  return true;
                } else {
                  return false;
                }
              }).then((isLounch) {
                if (!isLounch) ToastMassage.toast(context, context.lcz.actionNotAvailable, code: TypeMassage.warning);
              });
            },
            child: Container(
              width: 50,
              alignment: Alignment.centerLeft,
              child: const Icon(
                AppIcons.next,
                color: Color(0xFF002BEB),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

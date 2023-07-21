part of '../item.dart';

//! Status series
class _StatusSeries extends StatelessWidget {
  const _StatusSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 5),
      height: 35,
      decoration: BoxDecoration(
        color: const Color(0xAA000000),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              // Provider.of<CM_WinnersBloc>(context, listen: false).viewWinners('series', Provider.of<CM_SeriesBloc>(context, listen: false).content.idSeries);
            },
            child: Container(
              width: 40,
              alignment: Alignment.center,
              child: Icon(AppIcons.timer, size: 25),
            ),
          ),
          const _Spacer(),
          Container(
            width: 40,
            alignment: Alignment.center,
            child: Builder(builder: (context) {
              var _icon = AppIcons.openTree;
              late String _tree;
              // switch (Provider.of<CM_SeriesBloc>(context, listen: false).content.typeTree) {
              //   //tournament
              //   case 1:
              //     _icon = AppIcons.openTree;
              //     break;
              //   // open
              //   case 2:
              //     _icon = AppIcons.closeTree;
              //     break;
              // }

              return InkWell(
                onTap: () {
                  // switch (Provider.of<CM_SeriesBloc>(context, listen: false).content.typeTree) {
                  //   //tournament
                  //   case 1:
                  //     _tree = APP_STRING.toastTreeOpenSeries;
                  //     break;
                  //   // open
                  //   case 2:
                  //     _tree = APP_STRING.toastTreeCloseSeries;
                  //     break;
                  // }
                  // APP_UTILITY.viewToast(101, _tree);
                },
                child: Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: Icon(_icon, size: 25),
                ),
              );
            }),
          ),
          const _Spacer(),
          Container(
            width: 40,
            alignment: Alignment.center,
            child: Builder(builder: (_) {
              IconData _icon = AppIcons.hot;
              // String _stateSeries = APP_STRING.toastCompletedNoteActiveSeries;
              int _color = 0xFFFF00FF;
              // switch (Provider.of<CM_SeriesBloc>(context, listen: false).content.userView.completed) {
              //   case -1:
              //     _icon = AppIcons.hot;
              //     _color = 0xFFFF00FF;
              //     break;
              //   case 0:
              //     _icon = AppIcons.target;
              //     _color = 0xFFFFD000;
              //     break;
              //   case 1:
              //     _icon = AppIcons.completed;
              //     _color = 0xFF9DFF00;
              //     break;
              // }
              return InkWell(
                onTap: () {
                  // switch (Provider.of<CM_SeriesBloc>(context, listen: false).content.userView.completed) {
                  //   case -1:
                  //     _stateSeries = APP_STRING.toastCompletedNoteActiveSeries;
                  //     break;
                  //   case 0:
                  //     _stateSeries = APP_STRING.toastCompletedActiveSeries;
                  //     break;
                  //   case 1:
                  //     _stateSeries = APP_STRING.toastCompletedDoneSeries;
                  //     break;
                  // }
                  // APP_UTILITY.viewToast(101, _stateSeries);
                },
                child: Container(
                  // width: 40,
                  alignment: Alignment.center,
                  child: Icon(
                    _icon,
                    color: Color(_color),
                    size: 25,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

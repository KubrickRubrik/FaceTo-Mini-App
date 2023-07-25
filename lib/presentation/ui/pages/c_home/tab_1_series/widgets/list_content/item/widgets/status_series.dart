part of '../item.dart';

//! Status series
class _StatusSeries extends StatelessWidget {
  const _StatusSeries(this.item);
  final SeriesEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: const Color(0xAA000000),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          //! Best time
          InkWell(
            onTap: () {
              // Provider.of<CM_WinnersBloc>(context, listen: false).viewWinners('series', Provider.of<CM_SeriesBloc>(context, listen: false).content.idSeries);
            },
            child: Container(
              width: 40,
              alignment: Alignment.center,
              child: const Icon(AppIcons.timer, size: 25),
            ),
          ),
          const _Spacer(),
          //! Status tree series
          Container(
            width: 40,
            alignment: Alignment.center,
            child: Builder(builder: (context) {
              final ({IconData icon, String title}) data = switch (item.typeTree) {
                1 => (icon: AppIcons.openTree, title: context.lcz.allScenesOpens),
                _ => (icon: AppIcons.closeTree, title: context.lcz.graduallyScenesOpens),
              };
              return InkWell(
                onTap: () {
                  ToastMassage.toast(context, data.title);
                },
                child: Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: Icon(data.icon, size: 25),
                ),
              );
            }),
          ),
          const _Spacer(),
          //!  Status completed series
          Container(
            width: 40,
            alignment: Alignment.center,
            child: Builder(builder: (_) {
              final ({IconData icon, int color, String title}) data = switch (item.user.stat.completed) {
                0 => (icon: AppIcons.target, color: 0xFFFFD000, title: context.lcz.seriesActive),
                1 => (icon: AppIcons.completed, color: 0xFF9DFF00, title: context.lcz.seriesCompleted),
                _ => (icon: AppIcons.hot, color: 0xFFFF00FF, title: context.lcz.seriesAvailablePlay),
              };
              return InkWell(
                onTap: () {
                  ToastMassage.toast(context, data.title);
                },
                child: Icon(
                  data.icon,
                  color: Color(data.color),
                  size: 25,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

part of '../item.dart';

//! Status series
class _StatusSeries extends StatelessWidget {
  const _StatusSeries(this.index);
  final int index;

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
              context.read<WinnersProvider>().getWinners(
                    context.read<SeriesProvider>().pageData.listSeries.elementAt(index).idSeries,
                    TypeWinnersSource.series,
                  );
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
              final series = context.read<SeriesProvider>().pageData.listSeries.elementAt(index);
              final ({IconData icon, String title}) data = switch (series.typeTree) {
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
            child: Selector<SeriesProvider, int>(
              selector: (_, Model) => Model.pageData.listSeries.elementAt(index).user.stat.completed,
              builder: (_, completed, __) {
                final ({IconData icon, int color, String title}) data = switch (completed) {
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
              },
            ),
          ),
        ],
      ),
    );
  }
}

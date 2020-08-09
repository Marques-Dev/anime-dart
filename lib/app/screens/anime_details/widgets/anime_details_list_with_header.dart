import 'package:anime_dart/app/screens/anime_details/widgets/anime_details_header.dart';
import 'package:anime_dart/app/screens/anime_details/widgets/anime_details_tile.dart';
import 'package:anime_dart/app/setup.dart';
import 'package:anime_dart/app/store/anime_details_store.dart';
import 'package:anime_dart/app/store/central_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AnimeDetailsListWithHeader extends StatefulWidget {
  final String storeListenerKey;

  AnimeDetailsListWithHeader({Key key, this.storeListenerKey})
      : super(key: key);

  @override
  _AnimeDetailsListWithHeaderState createState() =>
      _AnimeDetailsListWithHeaderState(storeListenerKey: storeListenerKey);
}

class _AnimeDetailsListWithHeaderState
    extends State<AnimeDetailsListWithHeader> {
  String storeListenerKey;
  final centralStore = getIt<CentralStore>();
  AnimeDetailsStore localStore;

  _AnimeDetailsListWithHeaderState({Key key, @required this.storeListenerKey})
      : assert(storeListenerKey != null) {
    localStore = centralStore.getAnimeDetailsListener(storeListenerKey);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Observer(builder: (_) {
      return ListView.separated(
          padding: EdgeInsets.only(bottom: 85),
          itemBuilder: (_, i) {
            if (i == 0) {
              return AnimeDetailsHeader(
                storeListenerKey: storeListenerKey,
              );
            }

            final episode = localStore.episodesOfAnimeDetails[i - 1];

            return AnimeDetailsTile(episode: episode);
          },
          separatorBuilder: (_, i) =>
              Divider(color: Colors.transparent, height: i == 0 ? 20 : 10),
          itemCount: localStore.episodesOfAnimeDetails.length + 1);
    }));
  }
}
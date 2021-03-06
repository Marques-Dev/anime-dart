import 'package:anime_dart/app/constants/utils.dart';
import 'package:anime_dart/app/widgets/waifu/waifu_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final laksImageUrl =
      "https://avatars0.githubusercontent.com/u/51419598?s=460&u=3a68bcbc229ea5925baf1bd3ff306adac0787d39&v=4";
  final mannoeuImageUrl =
      "https://avatars1.githubusercontent.com/u/53797821?s=460&u=b98f51f8c959d84d4ef269642a785de61ad2dfc3&v=4";

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Divider(height: 10, color: Colors.transparent),
              WaifuWidget(),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              buildProfileCard(
                externalUrl: "https://github.com/LaksCastro",
                imgUrl: laksImageUrl,
                name: "LaksCastro",
                subject: "Web and Mobile Developer",
              ),
              Divider(height: 10, color: Colors.transparent),
              buildProfileCard(
                externalUrl: "https://github.com/mannoeu",
                imgUrl: mannoeuImageUrl,
                name: "Emmanuel",
                subject: "Expert Front-end Developer",
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Divider(height: 20, color: Colors.transparent),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border(
                    left: BorderSide(
                      width: 4,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.centerLeft,
                      child: Text("Notas finais do projeto"),
                    ),
                    Text(
                      "Desenvolvido em Agosto de 2020, entre os dias 01 e 10 como parte de um estudo um pouco mais avançado sobre o framework Flutter para desenvolvimeto Mobile e para ter onde assistir alguns episódios sem propaganda xD",
                      style: TextStyle(
                        height: 1.5,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(0.3),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container buildProfileCard({
    String name,
    String imgUrl,
    String externalUrl,
    String subject,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          left: BorderSide(
            width: 4,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              fit: BoxFit.cover,
              height: 70,
              width: 70,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 5),
            child: Text(name),
          ),
          Flexible(
            child: Text(
              subject,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(0.5),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: FlatButton(
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () => Utils.openUrl(externalUrl),
              child: Text(
                "Github",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

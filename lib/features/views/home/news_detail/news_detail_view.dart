import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app_chatgpt/features/models/news_model.dart';
import 'package:news_app_chatgpt/products/generation/index.dart';
import 'package:news_app_chatgpt/products/utilities/extensions/string_to_date_extensions.dart';
import 'package:news_app_chatgpt/products/widgets/action_sheet/adaptive_action_sheet.dart';
import 'package:news_app_chatgpt/products/widgets/icon_button/gray_rounded_icon_button.dart';
import 'package:news_app_chatgpt/products/widgets/network_image/index.dart';

import '../../../../products/constants/index.dart';

class NewsDetailView extends StatelessWidget {
  final NewsModel news;
  const NewsDetailView({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.newsDetail),
        leading: const _AppBarBackButton(),
        actions: const [_AppBarMoreButton()],
      ),
      body: ListView(
        children: [
          _NewsTitleAndDate(news: news),
          context.sized.emptySizedHeightBoxLow,

          // News image
          RoundedRectangleNetworkImage(
            imageUrl: news.image ?? "",
            containerSize: ContainerSizeConstants.xLarge,
            borderRadius: BorderRadius.zero,
          ),

          context.sized.emptySizedHeightBoxLow,

          // News description
          _NewsDescription(news: news),
        ],
      ),
    );
  }
}

class _AppBarBackButton extends StatelessWidget {
  const _AppBarBackButton();

  @override
  Widget build(BuildContext context) {
    return GrayRoundedIconButton(
      icon: Icons.arrow_back_ios_new,
      onPressed: () => Navigator.pop(context),
    );
  }
}

class _AppBarMoreButton extends StatelessWidget {
  const _AppBarMoreButton();

  @override
  Widget build(BuildContext context) {
    return GrayRoundedIconButton(
      icon: Icons.more_horiz,
      onPressed: () => AdaptiveActionSheet.show(context),
    );
  }
}

class _NewsTitleAndDate extends StatelessWidget {
  const _NewsTitleAndDate({
    required this.news,
  });

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.normal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // News title
          Text(
            news.title ?? "",
            style: context.general.textTheme.headlineLarge,
          ),

          context.sized.emptySizedHeightBoxLow3x,

          // News date
          Text(
            DateFormat.yMMMMd()
                .format(news.publishedAt?.toDate ?? DateTime.now()),
            style: context.general.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class _NewsDescription extends StatelessWidget {
  const _NewsDescription({
    required this.news,
  });

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.normal,
      child: Text(
        news.description ?? "",
        style: context.general.textTheme.bodyLarge,
      ),
    );
  }
}

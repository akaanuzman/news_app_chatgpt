import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app_chatgpt/products/utilities/routes/app_routes.dart';

import '../../../features/models/news_model.dart';
import '../../generation/index.dart';
import '../../utilities/extensions/index.dart';
import '../network_image/index.dart';

/// [NewsItem] is a [Row] with [RoundedRectangleNetworkImage] and [Column].
/// [news] is required.
/// Show news image, title, description and time ago.
class NewsItem extends StatelessWidget {
  final NewsModel news;
  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRoutes.newsDetail.value,extra: news),
      child: Padding(
        padding: context.padding.low,
        child: Row(
          children: [
            RoundedRectangleNetworkImage(imageUrl: news.image ?? ""),
            context.sized.emptySizedWidthBoxLow3x,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // News title
                  Text(
                    news.title ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.general.textTheme.titleLarge,
                  ),
                  context.sized.emptySizedHeightBoxLow,

                  // News description
                  Text(
                    news.description ?? "",
                    style: context.general.textTheme.headlineMedium
                        ?.copyWith(color: ColorName.label),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  context.sized.emptySizedHeightBoxLow,

                  // Time ago text 2min ago....
                  Text(
                    news.publishedAt?.toDate.timeAgo ?? "",
                    style: context.general.textTheme.bodySmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

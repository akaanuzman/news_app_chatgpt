import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../models/news_model.dart';
import '../../view_models/news_view_model.dart';
import '../../view_models/user_view_model.dart';
import 'mixin/home_mixin.dart';
import '../../../products/constants/index.dart';
import '../../../products/generation/index.dart';
import '../../../products/widgets/empty_state/empty_state.dart';
import '../../../products/widgets/items/news_item.dart';
import '../../../products/widgets/loading_proccess/adaptive_loading_proccess.dart';
import '../../../products/widgets/network_image/index.dart';
import 'package:provider/provider.dart';
import '../../../products/utilities/extensions/image_extensions.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(context.sized.width, context.sized.dynamicHeight(0.271)),
        child: _AppBarSection(today: today),
      ),
      body: Consumer<NewsViewModel>(
        builder: (BuildContext context, NewsViewModel newsVM, Widget? _) {
          if (newsVM.isLoading) {
            return const AdaptiveLoadingProccess();
          } else {
            if (newsVM.newsList.isEmpty) {
              return const EmptyState(emptyMessage: StringConstants.haveNoNews);
            } else {
              return _NewsList(newsVM: newsVM);
            }
          }
        },
      ),
    );
  }
}

class _AppBarSection extends StatelessWidget {
  const _AppBarSection({
    required this.today,
  });

  final String today;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height:
              context.sized.dynamicHeight(ContainerSizeConstants.xLarge.value),
          width: context.sized.width,
          padding: context.padding.low,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.imgHomeTopBar.path.assetImage,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const _UserInformationSection(),
              context.sized.emptySizedHeightBoxLow3x,

              // Update news text
              Text(
                StringConstants.updateNews,
                style: context.general.textTheme.headlineLarge
                    ?.copyWith(color: ColorName.white),
              ),
              context.sized.emptySizedHeightBoxLow,

              // Today text
              Text(
                today,
                style: context.general.textTheme.bodyMedium
                    ?.copyWith(color: ColorName.white),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}

class _UserInformationSection extends StatelessWidget {
  const _UserInformationSection();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (BuildContext context, UserViewModel userVM, Widget? _) {
        if (userVM.isLoading) {
          return const AdaptiveLoadingProccess();
        } else {
          return Row(
            children: [
              // User profile picture
              CircleNetworkImage(
                  imageUrl: userVM.userModel?.profilePicture ?? ""),
              context.sized.emptySizedWidthBoxLow3x,

              // User name
              Text(
                userVM.userName,
                style: context.general.textTheme.headlineMedium,
              ),
            ],
          );
        }
      },
    );
  }
}

class _NewsList extends StatelessWidget {
  final NewsViewModel newsVM;
  const _NewsList({required this.newsVM});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: context.padding.low,
      itemBuilder: (context, index) {
        NewsModel news = newsVM.newsList[index];
        return NewsItem(news: news);
      },
      separatorBuilder: (context, index) =>
          Divider(height: context.sized.normalValue * 2),
      itemCount: newsVM.newsList.length,
    );
  }
}

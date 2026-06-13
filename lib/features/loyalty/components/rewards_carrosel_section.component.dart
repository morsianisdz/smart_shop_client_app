import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:smart_shop_client_app/constants/fake.data.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/spacing.helper.dart';
import 'package:smart_shop_client_app/features/loyalty/components/custom_scroll_bar.component.dart';
import 'package:smart_shop_client_app/features/loyalty/components/reward_card.component.dart';
import 'package:velocity_x/velocity_x.dart';

class RewardCarouselSection extends StatelessWidget {
  RewardCarouselSection({super.key});

  final ValueNotifier<double> _scrollProgress = ValueNotifier<double>(0.0);

  @override
  Widget build(BuildContext context) {
    return col(
      [
        NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            final maxScroll = notification.metrics.maxScrollExtent;
            final currentScroll = notification.metrics.pixels;

            if (maxScroll > 0) {
              _scrollProgress.value = (currentScroll / maxScroll).clamp(
                0.0,
                1.0,
              );
            }
            return true;
          },
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: FakeData.rewards.length,
            itemBuilder: (context, index) {
              return RewardCard(reward: FakeData.rewards[index]);
            },
          ),
        ).h(180).paddingOnly(bottom: 4),

        ValueListenableBuilder<double>(
          valueListenable: _scrollProgress,
          builder: (context, progress, child) {
            return CustomScrollBar(progress: progress);
          },
        ).w(screenWith(context)),
      ],
      calign: CrossAxisAlignment.start,
      size: MainAxisSize.min,
    );
  }
}

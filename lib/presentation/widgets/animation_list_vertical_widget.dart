
import '/index.dart';

class AnimationListWidget extends StatelessWidget {
  const AnimationListWidget(
      {super.key,
      required this.child,
      required this.index,
      this.vertical,
      this.horizontal,
      this.milliseconds});
  final int index;
  final Widget child;
  final double? vertical;
  final double? horizontal;
  final int? milliseconds;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
          horizontalOffset: horizontal,
          verticalOffset: vertical,
          child: FadeInAnimation(
            child: child,
          )),
    );
  }
}

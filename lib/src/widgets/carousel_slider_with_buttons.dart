import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sportportal_food/src/widgets/caching_image.dart';

class CarouselSliderWithButtons extends StatefulWidget {
  final double viewportFraction;
  final double height;
  final List<String?>? images;
  final double padding;

  const CarouselSliderWithButtons({
    super.key,
    required this.viewportFraction,
    required this.height,
    this.images,
    this.padding = 0.0,
  });

  @override
  State<CarouselSliderWithButtons> createState() =>
      _CarouselSliderWithButtonsState();
}

class _CarouselSliderWithButtonsState extends State<CarouselSliderWithButtons> {
  late final CarouselController carouselController;
  late final List<String?>? images;

  @override
  void initState() {
    carouselController = CarouselController();
    images = widget.images;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CarouselSlider(
              carouselController: carouselController,
              items: images
                  ?.map(
                    (e) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: widget.height,
                      child: CachingImage(
                        e,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: widget.height - 30.0,
                viewportFraction: widget.viewportFraction,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Positioned(
            right: 15.0,
            bottom: 10.0,
            child: Row(
              children: [
                ArrowIconButton(
                  onTap: () {
                    carouselController.previousPage();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                const SizedBox(width: 5.0),
                ArrowIconButton(
                  onTap: () {
                    carouselController.nextPage();
                  },
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ArrowIconButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget icon;
  const ArrowIconButton({super.key, required this.onTap, required this.icon});

  @override
  State<ArrowIconButton> createState() => _ArrowIconButtonState();
}

class _ArrowIconButtonState extends State<ArrowIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: IconButton.filledTonal(
        onPressed: widget.onTap,
        hoverColor: theme.colorScheme.onPrimaryContainer,
        iconSize: 16.0,
        color: _isHovered ? Colors.white : null,
        icon: widget.icon,
      ),
    );
  }
}

class CarouselSliderWithIndicators extends StatefulWidget {
  final double viewportFraction;
  final double height;
  final List<String?>? images;
  final double padding;

  const CarouselSliderWithIndicators(
      {super.key,
      required this.viewportFraction,
      required this.height,
      this.images,
      this.padding = 0.0});

  @override
  State<CarouselSliderWithIndicators> createState() =>
      _CarouselSliderWithIndicatorsState();
}

class _CarouselSliderWithIndicatorsState
    extends State<CarouselSliderWithIndicators> {
  late final CarouselController carouselController;
  late final List<String?>? images;
  int currentIndex = 0;

  @override
  void initState() {
    carouselController = CarouselController();
    images = widget.images;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          carouselController: carouselController,
          items: images
              ?.map(
                (e) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: widget.height,
                  child: CachingImage(
                    e,
                    fit: BoxFit.contain,
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: widget.height - 30.0,
            viewportFraction: widget.viewportFraction,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < (images?.length ?? 0); i++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  height: 10.0,
                  width: 10.0,
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  decoration: BoxDecoration(
                    color: i == currentIndex
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

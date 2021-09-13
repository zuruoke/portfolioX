import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MiddleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.purple700,
      child: Flex(
          direction: context.isMobile ? Axis.vertical : Axis.horizontal,
          children: [
            "All Creative works,\n"
                .richText
                .withTextSpanChildren(
                    ["Selected projects.".textSpan.yellow400.make()])
                .xl4
                .white
                .make(),
            20.widthBox,
            Expanded(
                child: VxSwiper(
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              items: [
                ProjectWidget(title: _widget('CashPoint', 'assets/logo.png')),
                ProjectWidget(
                    title: _widget('CashPoint Driver', 'assets/logo.png')),
                ProjectWidget(title: _widget('Atains', 'assets/atains.png')),
                ProjectWidget(title: _widget('Reminisce', 'assets/logo.png')),
                ProjectWidget(title: _widget('Watermark', 'assets/logo.png')),
                ProjectWidget(title: _widget('Sportzlite', 'assets/logo.png')),
              ],
              height: 200,
              viewportFraction: context.isMobile ? 0.75 : 0.5,
              autoPlay: true,
              autoPlayAnimationDuration: 1.seconds,
            ))
          ]).p64().h(context.isMobile ? 500 : 300),
    );
  }

  _widget(String text, String imagePath) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      text.text.bold.white.xl.wide.center.make(),
      const SizedBox(
        height: 10,
      ),
      Image.asset(
        imagePath,
        height: 50,
      ),
    ]);
  }
}

class ProjectWidget extends StatelessWidget {
  final Widget title;

  const ProjectWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return title.box.p8.roundedLg
        .neumorphic(color: Vx.purple700, elevation: 5, curve: VxCurve.flat)
        .alignCenter
        .square(200)
        .make()
        .p16();
  }
}

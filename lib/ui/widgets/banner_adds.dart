import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tuupai/core/data/constant.dart';

class BannerAdds extends StatefulWidget {
  @override
  _BannerAddsState createState() => _BannerAddsState();
}

class _BannerAddsState extends State<BannerAdds> {
  List<String> banners = [banner1, banner2, banner3, banner4];

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: banners.length,
      autoplay: true,
      pagination: new SwiperPagination(
          margin: const EdgeInsets.all(25),
          builder: DotSwiperPaginationBuilder(
              color: Colors.black54.withOpacity(0.5),
              activeColor: Colors.black,
              space: 5.0)),
      itemBuilder: (context, index) {
        return Image.asset(banners[index]);
      },
    );
  }
}

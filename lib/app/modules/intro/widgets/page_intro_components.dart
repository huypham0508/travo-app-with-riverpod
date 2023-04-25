import 'package:flutter/cupertino.dart';
import 'package:travo_app/app/core/constants/app_color.dart';

class PageIntroComponents extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  final dynamic locationImage;
  const PageIntroComponents(
      {super.key,
      this.locationImage = Alignment.center,
      required this.image,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: locationImage,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: AppColor.blackColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                desc,
                style: TextStyle(
                    color: AppColor.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        )
      ],
    );
  }
}

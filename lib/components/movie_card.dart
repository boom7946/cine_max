import 'package:cine_max/constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieCard extends StatelessWidget {
  final String? image;
  final String? name;
  final String? year;
  final String? minute;
  const MovieCard({super.key, this.image, this.name, this.year, this.minute});

  @override
  Widget build(BuildContext context) {
    Widget renderMovieType() {
      return Container(
        width: 65,
        height: 20,
        decoration: BoxDecoration(
            color: ColorCustom.BLUEACCENT,
            borderRadius: BorderRadius.circular(6)),
        child: const Center(
          child: Text(
            "FREE",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat",
                color: Colors.white),
          ),
        ),
      );
    }

    Widget renderMovieDetail() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$name",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                  color: Colors.white),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  color: ColorCustom.GRAY,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "$year",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat",
                      color: ColorCustom.GRAY),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Icon(
                  Icons.access_time_filled_sharp,
                  color: ColorCustom.GRAY,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "$minute",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat",
                      color: ColorCustom.GRAY),
                )
              ],
            )
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              fit: BoxFit.fill,
              width: 112,
              height: 147,
              image ?? "",
              errorBuilder: (context, error, stackTrace) {
                return Container();
              },
            ),
          )),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [renderMovieType(), renderMovieDetail()],
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:delivery_app/model/place.dart';

class LocalCardView extends StatelessWidget {
  const LocalCardView(
      {Key? key,
      required this.place,
      this.imageAlignment = Alignment.bottomCenter,
      this.onTap})
      : super(key: key);

  final Place place;
  final Alignment imageAlignment;
  final Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    final placeValue = "Avaliação";
    final crossedValue = "";
    return GestureDetector(
      onTap: () => () {},
      child: SizedBox(
        width: 200,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Padding(
                padding: EdgeInsets.all(6),
                child: SizedBox(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/images/kfc.jpg",
                        alignment: imageAlignment, fit: BoxFit.cover)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [SizedBox(
                    child: Text('KFC',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(fontWeight: FontWeight.bold)))],),
                SizedBox(
                    child: Text('${place.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: Theme.of(context).textTheme.bodyText2)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            //child: ColorIndicatorView(place: place),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$placeValue',
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  softWrap: false,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.amber)),
              if (crossedValue != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('$crossedValue',
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(decoration: TextDecoration.lineThrough)),
                ),
            ],
          ),
          // RatingView(
          //     value: place.reviews?.rating?.toInt() ?? 0,
          //     reviewsCount: place.reviews?.count?.toInt() ?? 0),
        ]),
      ),
    );
  }
}

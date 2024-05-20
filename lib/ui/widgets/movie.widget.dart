import 'package:flutter/material.dart';
import 'package:the_movie/domain/entities/movie.entity.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    super.key,
    required this.item,
    required this.favoriteNotifer,
    required this.onFavoriteTap,
  });

  final MovieEntity item;
  final ValueNotifier<List<MovieEntity>> favoriteNotifer;
  final VoidCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 150,
              child: item.posterPath != null
                  ? ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/${item.posterPath}',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Image.asset(
                          'assets/images/not_found.jpeg',
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          item.title ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: onFavoriteTap,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ValueListenableBuilder<List<MovieEntity>>(
                            valueListenable: favoriteNotifer,
                            builder: (_, List<MovieEntity> value, __) {
                              return Icon(
                                value.contains(item)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    item.parsedDateTime,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, right: 8, bottom: 4),
                    child: Text(
                      item.overview ?? '',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

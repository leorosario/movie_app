import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/pages/movie_detail/movie_detail_page.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(movie: movie)
          )
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // CARTAZ DO FILME
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                movie.urlImage,
                width: 110,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            // INFORMAÇÕES
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TÍTULO
                  Text(
                    movie.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                  ),
                  const SizedBox(height: 8),

                  // DURAÇÃO + GÊNERO
                  Row(
                    children: [
                      Icon(Icons.schedule, size: 16, color: Colors.grey[700]),
                      const SizedBox(width: 4),
                      Text(
                        prettyDuration(
                          Duration(minutes: movie.duration),
                          abbreviated: true,
                          delimiter: ' ',
                          spacer: '',
                        ),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text("•"),
                      const SizedBox(width: 8),
                      Text(
                        movie.gender,
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // ANO COM BADGE
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Ano ${movie.year}",
                      style: TextStyle(
                        color: Colors.blueGrey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
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
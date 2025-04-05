import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  final String title;
  final String author;
  final String imagePath;
  final String id;
  final VoidCallback onTap;

  const ArticleItem({
    Key? key,
    required this.title,
    required this.author,
    required this.imagePath,
    required this.id,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    author,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/placeholder.png', // Fallback image
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

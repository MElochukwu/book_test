import 'package:book_app/class/model/document.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constant/const.dart';

class BookResultWidget extends StatelessWidget {
  final Doc result;
  const BookResultWidget({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey[600]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: result.getBookCover(),
                cacheKey: "${result.key}",
                placeholder: (context, str) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                errorWidget: (context, _, error) => const Icon(
                  Icons.error,
                  size: 38,
                ),
                fit: BoxFit.cover,
                // height: MediaQuery.of(context).size.height -780,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 6.0, right: 6.0),
            child: Text(
              result.title!,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 6.0, right: 6.0),
            child: result.authorName?.first != null
                ? Text(
                    result.authorName!.first,
                    maxLines: 1,
                    style: const TextStyle(color: Colors.grey),
                  )
                : const SizedBox(),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: _launchUrl,
                child: const Text("Description"),
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    final url = Uri.parse("${Const.baseUrl}/${result.key}");
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }
}

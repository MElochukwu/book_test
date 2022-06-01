import 'package:book_app/src/presentation/home/register/register.dart';
import 'package:book_app/src/presentation/home/search_book_page.dart';
import 'package:flutter/material.dart';

import '../sample_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  }) : super(key: key);

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: const Text(
          'Books',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: const Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                // Navigator.restorablePushNamed(context, SettingsView.routeName);
                Navigator.restorablePushNamed(context, RegisterPage.routeName);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.menu_book_sharp,
              size: 100,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Explore Interesting Books by searching for them.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Add Search fields
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                Navigator.restorablePushNamed(
                    context, SearchBookPage.routeName);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: const Text(
                  "Search for Books",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Adventure, Comedy, Biography, Actions, Thrilling, Comics, Play, Sci-Fi, Romance, Crime and more...",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey
                  // fontSize: 18.0,
                  ),
            )
          ],
        ),
      ),

      // ListView.builder(
      //   // Providing a restorationId allows the ListView to restore the
      //   // scroll position when a user leaves and returns to the app after it
      //   // has been killed while running in the background.
      //   restorationId: 'HomePage',
      //   itemCount: items.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     final item = items[index];

      //     return ListTile(
      //       title: Text('SampleItem ${item.id}'),
      //       leading: const CircleAvatar(
      //         // Display the Flutter Logo image asset.
      //         foregroundImage: AssetImage('assets/images/flutter_logo.png'),
      //       ),
      //       onTap: () {
      //         // Navigate to the details page. If the user leaves and returns to
      //         // the app after it has been killed while running in the
      //         // background, the navigation stack is restored.
      //         Navigator.restorablePushNamed(
      //           context,
      //           SampleItemDetailsView.routeName,
      //         );
      //       }
      //     );
      // },
      // ),
    );
  }
}

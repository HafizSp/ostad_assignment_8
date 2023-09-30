import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: ProfilePage(),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final List<String> imageUrls = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
  ];

  @override
  Widget build(BuildContext context) {
    // Determine screen orientation
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return isLandscape ? buildLandscapeLayout() : buildPortraitLayout();
  }

  Widget buildPortraitLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Circular Container
            Container(
              width: 350.0,
              height: 350.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: ClipOval(
                child: Image.network(
                  'https://via.placeholder.com/150', // Replace with your image URL
                  fit: BoxFit.cover, // Adjust the image fit as needed
                  width: 150.0,
                  height: 150.0,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Heading',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 10),
            Text(
                'The ancient forest stood in serene majesty, its towering trees forming a canopy that filtered dappled sunlight onto the lush undergrowth. Birds sang melodious tunes, while a gentle stream meandered through this tranquil oasis, inviting weary travelers to find solace in its embrace'),

            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              // Allow the GridView to scroll within the SingleChildScrollView
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(imageUrls[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLandscapeLayout() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Circular Container on the left
          Container(
            width: 350.0,
            height: 350.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: ClipOval(
              child: Image.network(
                'https://via.placeholder.com/150', // Replace with your image URL
                fit: BoxFit.cover, // Adjust the image fit as needed
                width: 350.0,
                height: 350.0,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Heading',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 10),
                Text(
                    'The ancient forest stood in serene majesty, its towering trees forming a canopy that filtered dappled sunlight onto the lush undergrowth. Birds sang melodious tunes, while a gentle stream meandered through this tranquil oasis, inviting weary travelers to find solace in its embrace'),
                SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    // Allow the GridView to scroll within the SingleChildScrollView
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: imageUrls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(imageUrls[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Focus Item Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

//devDiariesWithVee on Instagram
//devDiariesWithVee on Youtube
//vaidehi2701 on Github

class MyHomePage extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/a1.jpg',
    'assets/images/a2.jpg',
    'assets/images/a3.jpg',
    'assets/images/a4.png',
    'assets/images/a5.jpg',
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: SizedBox(
          height: 150,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 5,
              );
            },
            itemCount: imageList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 10),
                child: FocusItem(
                  imageAsset: imageList[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class FocusItem extends StatefulWidget {
  final String imageAsset;

  const FocusItem({Key? key, required this.imageAsset}) : super(key: key);

  @override
  _FocusItemState createState() => _FocusItemState();
}

class _FocusItemState extends State<FocusItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isSelected = true;
        });
      },
      onExit: (_) {
        setState(() {
          isSelected = false;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: isSelected ? 1.0 : 0.2,
          child: Image.asset(
            widget.imageAsset,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

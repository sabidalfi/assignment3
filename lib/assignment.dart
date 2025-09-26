import 'package:flutter/material.dart';
class assignment3 extends StatelessWidget {
  const assignment3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Courses"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 cards in one row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75, // control card height
          children: [
            buildCourseCard(
              "assets/js2.PNG",
              "Full Stack Web Development with JavaScript (MERN)",

            ),
            buildCourseCard(
              "assets/django.PNG",
              "Full Stack Web Development with Python, Django & React",
            ),
            buildCourseCard(
              "assets/appflutter.PNG",
              "Full APP Development with Flutter",
            ),
            buildCourseCard(
              "assets/sqa.PNG",
              "SQA: Manual & Automated Testing",
            ),
          ],
        ),
      ),
    );
  }

  // Card widget
  Widget buildCourseCard(String imagePath, String title) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.maxFinite,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              style:  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.black,
              ),
              child:  Text("বিস্তারিত দেখুন"), // Bengali text from screenshot
            ),
          ),
        ],
      ),
    );
  }
}



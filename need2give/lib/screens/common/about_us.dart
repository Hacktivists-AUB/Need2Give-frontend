import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Contact us"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'About Need2Give',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Need2Give is a mobile app developed and maintained by a team of 4 college students from the American University of Beirut. Our goal is to encourage people to donate and make it easier to find donations for those in need.',
              ),
              SizedBox(height: 16),
              Text(
                'Our Mission',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Our mission is to connect individuals and organizations with extra resources to those who need them most. We believe that everyone has something to give, and that by working together we can create a more equitable society.',
              ),
              SizedBox(height: 16),
              Text(
                'How It Works',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Donation centers can use the Need2Give app to post the items they have available for donation. Users can then search for items they need and follow donation centers to see new items on their feed. Our app makes it easy to connect donors with recipients in real-time, ensuring that donations go where they are needed most.',
              ),
              SizedBox(height: 16),
              Text(
                'Get Involved',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'We welcome anyone who wants to get involved with Need2Give! If you would like to support our mission, please download our app and start donating today. If you are interested in volunteering or partnering with us, please contact us at hacktivists.org@gmail.com.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

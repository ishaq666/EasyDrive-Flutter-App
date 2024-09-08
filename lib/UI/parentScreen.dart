import 'package:easydrive/OnBoarding.dart';
import 'package:easydrive/widgets/current_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Parentscreen extends StatefulWidget {
  const Parentscreen({super.key});

  @override
  State<Parentscreen> createState() => _ParentscreenState();
}

class _ParentscreenState extends State<Parentscreen> {
  late GoogleMapController mapController;
  String travelTime = ''; // Variable to store travel time

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person, size: 40),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF161068),
              ),
            ),
            ListTile(
              leading: Icon(Icons.feedback_outlined),
              title: Text('Feedbacks'),
              onTap: () {
                // Handle the home tap here
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer_outlined),
              title: const Text('How to ?'),
              onTap: () {
                
              },
              
            ),
            ListTile(
              leading: const Icon(Icons.support_outlined),
              title: const Text('Support'),
              onTap: () {
                // Handle the home tap here
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.47),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OnBoardingScreen()),
                ); // Handle the logout tap here
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Parent'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: GetUserLocation(
              onTravelTimeUpdate: (String time) {
                setState(() {
                  travelTime = time; // Update travel time
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF161068),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Time Of Arrival: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          travelTime, // Display travel time
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Status:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(''),
                        
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

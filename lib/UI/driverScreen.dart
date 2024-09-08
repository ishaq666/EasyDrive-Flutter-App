import 'package:easydrive/OnBoarding.dart';
import 'package:easydrive/UI/login.dart';
import 'package:flutter/material.dart';

class Driverscreen extends StatefulWidget {
  const Driverscreen({super.key});

  @override
  State<Driverscreen> createState() => _DriverscreenState();
}

class _DriverscreenState extends State<Driverscreen> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFa8a6ff),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
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
            ListTile( leading: Icon(Icons.question_answer_outlined),
              title: Text('How to ?'),
              onTap: () {
                // Handle the settings tap here
              },
              
            ),
            ListTile(
              leading: Icon(Icons.support_outlined),
              title: Text('Support'),
              onTap: () {
                // Handle the home tap here
              },),
            SizedBox(height: MediaQuery.of(context).size.height*0.47),
            ListTile(
             leading: Icon(Icons.logout_outlined),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreen(),));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Driver Screen'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Container(
              width: MediaQuery.of(context).size.width * 0.8, // Adjust the width as needed
              height: MediaQuery.of(context).size.height * 0.6, // Adjust the height as needed
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 40,
                ),
                itemCount: seats.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
          color: Color(0xFF0A1066),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
                    child: Center(
                      child: Text(
                        seats[index]['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String,dynamic>> seats =[
{
  'name' : 'A1'
},
{
  'name' : 'A2'
},
{
  'name' : 'A3'
},
{
  'name' : 'B1'
},
{
  'name' : 'B2'
},
{
  'name' : 'B3'
},
{
  'name' : 'C1'
},
{
  'name' : 'C2'
},
{
  'name' : 'C3'
}
];
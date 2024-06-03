import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  // Sample user data
  final String username = "John Doe";
  final String name = "Kang John Doe";
  final String email = "john.doe@example.com";
  final String dateOfBirth = "January 1, 1990"; // Changed to date of birth
  final String phoneNumber = "123-456-7890";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(
                        'assets/images/logo-rehan.png'), // Change to your profile picture
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: InkWell(
                      onTap: () {
                        // Add functionality to open camera view
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 4),
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(Icons.add_a_photo, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildProfileItem("Name", name, Icons.person_rounded),
            _buildProfileItem("Email", email, Icons.email),
            _buildProfileItem("Date of Birth", dateOfBirth, Icons.cake), // Changed label to Date of Birth
            _buildProfileItem("Phone Number", phoneNumber, Icons.phone),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality to save edited profile
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                  ),
                  child: Text('Save Profile'),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, String value, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: TextFormField(
              initialValue: value,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

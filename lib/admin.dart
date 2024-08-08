import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.blue, // Set app bar color
      ),
      body: _buildHistoryList(context),
    );
  }

  Widget _buildHistoryList(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('booked_treks')
            .doc(user.uid)
            .collection('treks')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No booked treks yet.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var trek = snapshot.data!.docs[index];
              return Card(
                elevation: 4, // Add elevation for a raised look
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(
                    'City: ${trek['city_name']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue, // Custom text color
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Text(
                        'Source: ${trek['source_city']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black87, // Custom text color
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Date: ${trek['date']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87, // Custom text color
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Time: ${trek['time']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87, // Custom text color
                        ),
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    } else {
      return Center(
        child: Text('User not authenticated.'),
      );
    }
  }
}

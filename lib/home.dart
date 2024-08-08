import 'package:bus_booking/admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourist Places in Maharashtra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(), // Apply Poppins font
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final List<City> cities = [
    // Add more cities with their details
    City(
      name: 'Kalsubai',
      imageUrl: [
        'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQwd_S0lJ8DwLqLAYewb12X56rJ3JJcU-pE3OzMSY0uLc9rVuJTHOq9PJueRqtUjTxpqGx-w7WhBjzb53piJxOTipQqwm3jzH3SKkfprQ',
        "https://images.prismic.io/indiahike/2d688409-a836-4f99-9900-c12ee64b2b56_Kalsubai+Trek+-+Jay+Mehta+-+View+of+Kalsubai+Peak+1+-+June+-+Indiahikes+-+Contribution.jpg?auto=compress,format",
        "https://nomadsofindia.com/wp-content/uploads/2023/04/Kalsubai-Trek-2-1024x768.jpg"
      ],
      details:
          'Kalsubai is a mountain peak in the Western Ghats, located in the Ahmednagar district of Maharashtra. It is the highest peak in Maharashtra with an elevation of 1646 meters (5400 feet) above sea level. Kalsubai trek is a popular activity among adventure enthusiasts, offering breathtaking views of the surrounding landscape.',
      estimatedCost: 'Rs.1000',
      attractions: [
        'Kalsubai Temple',
        'Scenic viewpoints',
        'Natural surroundings',
        // Add more attractions
      ],
      hotels: [
        'Guesthouses in nearby villages',
        'Camping options',
        // Add more accommodation options
      ],
      restaurants: [
        'Local eateries in nearby villages',
        // Add more restaurants
      ],
      modeOfTransport: 'Private vehicles, state transport buses',
    ),
    City(
      name: 'Harihar Fort',
      imageUrl: [
        'https://res.cloudinary.com/dwzmsvp7f/image/fetch/q_75,f_auto,w_800/https%3A%2F%2Fmedia.insider.in%2Fimage%2Fupload%2Fc_crop%2Cg_custom%2Fv1633961031%2Fyuz5jivit6tuxlzy57om.jpg',
        "https://www.treksandtrails.org/system/images/000/638/441/e149fd7ce6177d9bd66ebf02eef222a5/x1000gt/Harihar-Fort-Trek-6.jpg?1662549589"
      ],
      details:
          'Harirar Fort, also known as Harishchandragad, is a hill fort in the Ahmednagar district of Maharashtra. It is situated in the Malshej Ghat region and is known for its ancient temples, caves, and rugged terrain. Trekking to Harirar Fort is a popular adventure activity, offering panoramic views of the surrounding valleys and hills.',
      estimatedCost: 'Rs.1200',
      attractions: [
        'Konkan Kada (Konkan cliff)',
        'Taramati Peak',
        'Kedareshwar Cave Temple',
        // Add more attractions
      ],
      hotels: [
        'Camping options on the fort',
        'Guesthouses in nearby villages',
        // Add more accommodation options
      ],
      restaurants: [
        'Local eateries in nearby villages',
        // Add more restaurants
      ],
      modeOfTransport: 'Private vehicles, state transport buses',
    ),
    City(
      name: 'Aadrai Jungle Trek',
      imageUrl: [
        'https://www.treksandtrails.org/system/images/000/585/855/820fa03274ad5a00128f163d903145a4/x1000gt/Aadrai_Jungle_Trek.jpg?1648467069',
        "https://www.timetravelers.in/media/tour_images/gallery/Aadrai_Jungle_Trek-24.jpg"
      ],
      details:
          'Aadrai Jungle Trek offers an exciting adventure through lush jungles, located in the Western Ghats of Maharashtra. It is known for its dense foliage, diverse wildlife, and pristine natural beauty. The trekking route takes you through winding paths, streams, and cascading waterfalls, providing an immersive experience in nature.',
      estimatedCost: 'Rs.1500',
      attractions: [
        'Scenic jungle trails',
        'Waterfalls',
        'Wildlife sightings',
        // Add more attractions
      ],
      hotels: [
        'Tented campsites in the jungle',
        'Rustic eco-lodges',
        // Add more accommodation options
      ],
      restaurants: [
        'Campfire meals prepared by guides',
        'Local tribal cuisine experiences',
        // Add more restaurants
      ],
      modeOfTransport:
          'Private vehicles, arranged transport by trek organizers',
    ),
    City(
      name: 'Devkund Waterfall',
      imageUrl: [
        'https://blogs.thomascook.in/wp-content/uploads/2023/09/Devkund.jpg',
        "https://www.trekupindia.com/wp-content/uploads/2022/05/Devkund-Waterfall-trekupindia.jpg",
        "https://www.treksandtrails.org/system/images/000/228/501/9ace3b4dd571441777ee5b6f7d9cd9bf/x1000gt/Devkund-Waterfall-Trek-5.jpg?1548510955"
      ],
      details:
          'Devkund Waterfall is a mesmerizing natural wonder located amidst the dense forests of the Sahyadri range in Maharashtra. It is renowned for its crystal-clear pool and picturesque surroundings. The trek to Devkund takes you through scenic trails, small streams, and rocky terrain, offering an enchanting journey through nature.',
      estimatedCost: 'Rs.800',
      attractions: [
        'Devkund Waterfall',
        'Peaceful surroundings',
        'Opportunity for swimming',
        // Add more attractions
      ],
      hotels: [
        'Tented accommodations near the waterfall',
        'Homestays in nearby villages',
        // Add more accommodation options
      ],
      restaurants: [
        'Local food stalls serving authentic Maharashtrian snacks',
        'Picnic meals prepared by trek organizers',
        // Add more restaurants
      ],
      modeOfTransport:
          'Private vehicles, state transport buses to the nearest town',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'trekkers and tourism',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white, // Set app bar color
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.green,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser!.email.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.contact_mail, color: Colors.black),
                title: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactUs()));
                  // Navigate to Contact Us page
                },
              ),
              ListTile(
                leading: Icon(Icons.list, color: Colors.black),
                title: Text(
                  'List of trekers',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Listoftrekkers()));
                },
              ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.black),
                title: Text(
                  'About Us',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.black),
                title: Text(
                  'Trekker Login',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AgentLogin()));
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback, color: Colors.black),
                title: Text(
                  'Feedbacks',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeedbackOpt()));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.black),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var city in cities)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CityDetailsPage(city: city),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.lightGreenAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Hero(
                          tag: city.name,
                          child: Image.network(
                            city.imageUrl[0],
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        city.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class City {
  final String name;
  final List<String> imageUrl;
  final String details;
  final String estimatedCost;
  final List<String> attractions;
  final List<String> hotels;
  final List<String> restaurants;
  final String modeOfTransport;

  City({
    required this.name,
    required this.imageUrl,
    required this.details,
    required this.estimatedCost,
    required this.attractions,
    required this.hotels,
    required this.restaurants,
    required this.modeOfTransport,
  });
}

class CityDetailsPage extends StatefulWidget {
  final City city;

  const CityDetailsPage({required this.city});

  @override
  State<CityDetailsPage> createState() => _CityDetailsPageState();
}

class _CityDetailsPageState extends State<CityDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city.name),
        backgroundColor: Colors.green, // Set app bar color
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.lightGreenAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: widget.city.name,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: FlutterCarousel(
                      items: widget.city.imageUrl
                          .map((src) => Image.network(src))
                          .toList(),
                      options: CarouselOptions(),
                    )),
              ),
              SizedBox(height: 16.0),
              Text(
                'Trek Planning and Details',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Estimated Cost: ${widget.city.estimatedCost}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Mode of Transport: ${widget.city.modeOfTransport}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                widget.city.details,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Attractions:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var attraction in widget.city.attractions)
                    Text(
                      '- $attraction',
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Hotels:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var hotel in widget.city.hotels)
                    Text(
                      '- $hotel',
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Restaurants:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var restaurant in widget.city.restaurants)
                    Text(
                      '- $restaurant',
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                ],
              ),
              SizedBox(height: 16.0),
              Center(
                  child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookTrek(widget.city.name)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    'Book Trek',
                    style: TextStyle(fontSize: 20),
                  )),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Treks and Tourism India was established in 2024. An initiative to trek and be with nature. Yet it's not just another trekking group. The basic funda being - do the ordinary in an extraordinary way.",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Meeting like minded individuals. Sharing best practices and to evolve as the foremost community in conducting trekking activities. Treks and Tourism India believe in Leave no Trace policy while conducting all its events.",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Meeting like minded individuals. Sharing best practices and to evolve as the foremost community in conducting trekking activities. Treks and Tourism India believe in Leave no Trace policy while conducting all its events.",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Email'),
            SelectableText(
              'trekkersandtourism@gmail.com',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

class Listoftrekkers extends StatelessWidget {
  const Listoftrekkers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Trekkers'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text('1'),
            ),
            title: Text('Treks of Maharashtra'),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('2'),
            ),
            title: Text('Trek and Trails'),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('3'),
            ),
            title: Text('Trek the Himalayas'),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('4'),
            ),
            title: Text('Trek Mung'),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('5'),
            ),
            title: Text('IndiaHikes'),
          ),
        ],
      ),
    );
  }
}

class AgentLogin extends StatelessWidget {
  AgentLogin({super.key});

  final name = TextEditingController();
  final name2 = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trekker Login'),
      ),
      body: Column(
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(hintText: 'Agent Name'),
          ),
          TextField(
            controller: name2,
            decoration: InputDecoration(hintText: 'Trekker Name'),
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          Text('Document Verification'),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.plus),
                Text('Add Document'),
              ],
            ),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(border: Border.all()),
          ),
          RadioListTile(
            value: 'male',
            groupValue: "gender",
            onChanged: (e) {},
            title: Text('Female'),
          ),
          RadioListTile(
              title: Text('Male'),
              value: 'female',
              groupValue: "gender",
              onChanged: (e) {}),
          MaterialButton(
            color: Colors.green,
            onPressed: () {
              FirebaseFirestore.instance.collection('agent_names').doc().set({
                'name': name.text.toString(),
                'trek name': name2.text.toString(),
                'email': email.text.toString()
              }).then((value) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Added Successfuly")));
              });
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}

class FeedbackOpt extends StatelessWidget {
  const FeedbackOpt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Column(
        children: [
          Text('Feedback Form'),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Saved')));
              },
              child: Text('Submit'))
        ],
      ),
    );
  }
}

class BookTrek extends StatefulWidget {
  var cityName;

  BookTrek(this.cityName);

  @override
  State<BookTrek> createState() => _BookTrekState();
}

class _BookTrekState extends State<BookTrek> {
  String? date;
  String? selectedGender;

  String sourceCity = ''; // Varia
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
            onChanged: (value) {
              sourceCity = value;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Email'),
            onChanged: (value) {
              sourceCity = value;
            },
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Radio(
                  value: 'Pune',
                  groupValue: sourceCity,
                  onChanged: (value) {
                    setState(() {
                      sourceCity = value.toString();
                    });
                  },
                ),
                Text('Pune'),
                Radio(
                  value: 'Mumbai',
                  groupValue: sourceCity,
                  onChanged: (value) {
                    setState(() {
                      sourceCity = value.toString();
                    });
                  },
                ),
                Text('Mumbai'),
                Radio(
                  value: 'Bangalore',
                  groupValue: sourceCity,
                  onChanged: (value) {
                    setState(() {
                      sourceCity = value.toString();
                    });
                  },
                ),
                Text('Bangalore'),
              ],
            ),
          ),
          Row(
            children: [
              Text('Selected Date: '), // Normal text
              Expanded(
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(labelText: 'Date'),
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((pickedDate) {
                      if (pickedDate != null) {
                        setState(() {
                          print(pickedDate.toString());
                          date = pickedDate.toString();
                          print(date);
                        });
                      }
                    });
                  },
                  controller: TextEditingController(text: date ?? ''),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Gender:'),
              Row(
                children: [
                  Radio(
                    value: 'male',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value as String?;
                      });
                    },
                  ),
                  Text('Male'),
                  Radio(
                    value: 'female',
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value as String?;
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
            ],
          ),
          Container(
              height: 200, width: 200, child: Image.asset("assets/qr.jpg")),
          ElevatedButton(
              onPressed: () async {
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  await FirebaseFirestore.instance
                      .collection('booked_treks')
                      .doc(user.uid)
                      .collection('treks')
                      .add({
                    'city_name': widget.cityName,
                    'source_city': sourceCity,
                    'date': date,
                    // 'gender': gender,
                  });
                  Navigator.of(context).pop();

                  // Show success snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Trek booked successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  print('User not authenticated');
                }
              },
              child: Text('Cancel')),
          ElevatedButton(onPressed: () {}, child: Text('Save')),
        ],
      ),
    );
  }
}

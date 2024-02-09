import 'package:ezytransit_innerve/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

// Define the Bus class with necessary attributes
class Bus {
  final String busId;
  final String name;
  final List<Map<String, dynamic>> route;
  final int occupancy;

  Bus({
    required this.busId,
    required this.name,
    required this.route,
    required this.occupancy,
  });
}

class SearchResultScreen extends StatelessWidget {
  final String source;
  final String destination;

  const SearchResultScreen({
    Key? key,
    required this.source,
    required this.destination,
  }) : super(key: key);

 @override
Widget build(BuildContext context) {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
   return WillPopScope(
      onWillPop: () async {
        // Handle back button press here, e.g., navigate back to the previous screen
        Navigator.of(context).pop();
        return false;
      },
  child: Scaffold(
    key: scaffoldKey,
    appBar: AppBar(
      elevation: 2,
      shadowColor: Colors.black,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      centerTitle: true,
      title: Image.asset(
        'assets/images/ezytranzit.png',
        width: 150,
        height: 200,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
      ],
    ),
    drawer: const DrawerWidget(),
    body: SingleChildScrollView( // Wrap the body in SingleChildScrollView
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 22),
            const Text(
              'SEARCH RESULTS\nFOR',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0x9903A932),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
                letterSpacing: 1.20,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 309,
              height: 49,
              decoration: BoxDecoration(
                border: Border.all(width: 1.25, color: const Color(0x3F08BD62)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        source,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 24,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        destination,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _buildSearchResults(),
          ],
        ),
      ),
    ),
  ),
  );
}

  Widget _buildSearchResults() {
    // Dummy bus data fetched from another file
  final List<Map<String, dynamic>> dummyBusData = [
    {
      "busId": "101",
      "name": "Pune Express",
      "route": {
        "name": "Route A",
        "stops": [
          {
            "stopId": "STOP001",
            "name": "Swargate, Pune",
            "location": {"latitude": 18.5034, "longitude": 73.8595},
            "time": "08:00 AM"
          },
          {
            "stopId": "STOP002",
            "name": "Shivaji Nagar, Pune",
            "location": {"latitude": 18.5314, "longitude": 73.8444},
            "time": "08:20 AM"
          },
          {
            "stopId": "STOP003",
            "name": "Kothrud, Pune",
            "location": {"latitude": 18.5089, "longitude": 73.8077},
            "time": "08:40 AM"
          },
          {
            "stopId": "STOP004",
            "name": "Hinjewadi, Pune",
            "location": {"latitude": 18.5917, "longitude": 73.7388},
            "time": "09:00 AM"
          }
        ]
      },
      "capacity": 60,
      "occupancy": 30,
      "current_location": {"latitude": 18.5034, "longitude": 73.8595},
      "current_speed": "50 km/h"
    },
    {
      "busId": "102",
      "name": "Smart City Shuttle",
      "route": {
        "name": "Route B",
        "stops": [
          {
            "stopId": "STOP005",
            "name": "Hadapsar, Pune",
            "location": {"latitude": 18.5025, "longitude": 73.9271},
            "time": "08:10 AM"
          },
          {
            "stopId": "STOP006",
            "name": "Swargate, Pune",
            "location": {"latitude": 18.5221, "longitude": 73.9339},
            "time": "08:30 AM"
          },
          {
            "stopId": "STOP007",
            "name": "Kharadi, Pune",
            "location": {"latitude": 18.5542, "longitude": 73.9439},
            "time": "08:50 AM"
          },
          {
            "stopId": "STOP008",
            "name": "Viman Nagar, Pune",
            "location": {"latitude": 18.5663, "longitude": 73.9147},
            "time": "09:10 AM"
          }
        ]
      },
      "capacity": 40,
      "occupancy": 20,
      "current_location": {"latitude": 18.5025, "longitude": 73.9271},
      "current_speed": "45 km/h"
    },
    {
      "busId": "103",
      "name": "Metro Link",
      "route": {
        "name": "Route E",
        "stops": [
          {
            "stopId": "STOP017",
            "name": "Vishrantwadi, Pune",
            "location": {"latitude": 18.5787, "longitude": 73.8903},
            "time": "08:15 AM"
          },
          {
            "stopId": "STOP018",
            "name": "Dighi, Pune",
            "location": {"latitude": 18.5975, "longitude": 73.8824},
            "time": "08:30 AM"
          },
          {
            "stopId": "STOP019",
            "name": "Dapodi, Pune",
            "location": {"latitude": 18.5852, "longitude": 73.8275},
            "time": "08:45 AM"
          },
          {
            "stopId": "STOP020",
            "name": "Pimpri, Pune",
            "location": {"latitude": 18.6271, "longitude": 73.8131},
            "time": "09:00 AM"
          }
        ]
      },
      "capacity": 50,
      "occupancy": 25,
      "current_location": {"latitude": 18.5787, "longitude": 73.8903},
      "current_speed": "40 km/h"
    },
    {
      "busId": "104",
      "name": "City Transit",
      "route": {
        "name": "Route F",
        "stops": [
          {
            "stopId": "STOP021",
            "name": "Camp, Pune",
            "location": {"latitude": 18.5204, "longitude": 73.8558},
            "time": "08:10 AM"
          },
          {
            "stopId": "STOP022",
            "name": "Swargate, Pune",
            "location": {"latitude": 18.5034, "longitude": 73.8595},
            "time": "08:25 AM"
          },
          {
            "stopId": "STOP023",
            "name": "Kondhwa, Pune",
            "location": {"latitude": 18.4684, "longitude": 73.9014},
            "time": "08:40 AM"
          },
          {
            "stopId": "STOP024",
            "name": "Bibvewadi, Pune",
            "location": {"latitude": 18.4695, "longitude": 73.8662},
            "time": "08:55 AM"
          }
        ]
      },
      "capacity": 45,
      "occupancy": 20,
      "current_location": {"latitude": 18.5204, "longitude": 73.8558},
      "current_speed": "35 km/h"
    },
    {
      "busId": "105",
      "name": "Tech Connect",
      "route": {
        "name": "Route G",
        "stops": [
          {
            "stopId": "STOP025",
            "name": "Hinjewadi Phase 1, Pune",
            "location": {"latitude": 18.5853, "longitude": 73.7290},
            "time": "08:20 AM"
          },
          {
            "stopId": "STOP026",
            "name": "Hinjewadi Phase 2, Pune",
            "location": {"latitude": 18.5855, "longitude": 73.7185},
            "time": "08:35 AM"
          },
          {
            "stopId": "STOP027",
            "name": "Hinjewadi Phase 3, Pune",
            "location": {"latitude": 18.5978, "longitude": 73.7106},
            "time": "08:50 AM"
          },
          {
            "stopId": "STOP028",
            "name": "Maan, Pune",
            "location": {"latitude": 18.5965, "longitude": 73.7387},
            "time": "09:05 AM"
          }
        ]
      },
      "capacity": 55,
      "occupancy": 30,
      "current_location": {"latitude": 18.5853, "longitude": 73.7290},
      "current_speed": "45 km/h"
    },
    {
      "busId": "106",
      "name": "City Express",
      "route": {
        "name": "Route H",
        "stops": [
          {
            "stopId": "STOP029",
            "name": "Kalyani Nagar, Pune",
            "location": {"latitude": 18.5483, "longitude": 73.9023},
            "time": "08:25 AM"
          },
          {
            "stopId": "STOP030",
            "name": "Yerwada, Pune",
            "location": {"latitude": 18.5513, "longitude": 73.8789},
            "time": "08:40 AM"
          },
          {
            "stopId": "STOP031",
            "name": "Nagar Road, Pune",
            "location": {"latitude": 18.5629, "longitude": 73.9155},
            "time": "08:55 AM"
          },
          {
            "stopId": "STOP032",
            "name": "Kharadi, Pune",
            "location": {"latitude": 18.5542, "longitude": 73.9439},
            "time": "09:10 AM"
          }
        ]
      },
      "capacity": 40,
      "occupancy": 15,
      "current_location": {"latitude": 18.5483, "longitude": 73.9023},
      "current_speed": "38 km/h"
    },
    {
      "busId": "107",
      "name": "Metro City Link",
      "route": {
        "name": "Route I",
        "stops": [
          {
            "stopId": "STOP033",
            "name": "Wadgaon Sheri, Pune",
            "location": {"latitude": 18.5494, "longitude": 73.9325},
            "time": "08:30 AM"
          },
          {
            "stopId": "STOP034",
            "name": "Vadgaon Budruk, Pune",
            "location": {"latitude": 18.4735, "longitude": 73.8268},
            "time": "08:45 AM"
          },
          {
            "stopId": "STOP035",
            "name": "Dhayari, Pune",
            "location": {"latitude": 18.4463, "longitude": 73.8073},
            "time": "09:00 AM"
          },
          {
            "stopId": "STOP036",
            "name": "Ambegaon Budruk, Pune",
            "location": {"latitude": 18.4495, "longitude": 73.8374},
            "time": "09:15 AM"
          }
        ]
      },
      "capacity": 35,
      "occupancy": 10,
      "current_location": {"latitude": 18.5494, "longitude": 73.9325},
      "current_speed": "42 km/h"
    }
  ];

   // Convert the dummy data into Bus objects
  List<Bus> buses = dummyBusData.map((busData) {
    return Bus(
      busId: busData['busId'],
      name: busData['name'],
      route: List<Map<String, dynamic>>.from(busData['route']['stops']),
      occupancy: busData['occupancy'],
    );
  }).toList();

  // Filter buses that cover both the source and destination stops
  List<Bus> matchingBuses = buses.where((bus) {
    bool hasSource = false;
    bool hasDestination = false;

    // Check if the source and destination stops exist in the bus route
    bus.route.forEach((stop) {
      if (stop['name'] == source) {
        hasSource = true;
      }
      if (stop['name'] == destination) {
        hasDestination = true;
      }
    });

    return hasSource && hasDestination;
  }).toList();

  // Build widgets for each matching bus
  return Column(
    children: matchingBuses.map((bus) => _buildBusCard(bus)).toList(),
  );
}

  Widget _buildBusCard(Bus bus) {
    return Container(
      width: 360,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0x3308BD62)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bus.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BUS NO',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      bus.busId,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/crowd.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CROWD',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${bus.occupancy}%',
                      style: const TextStyle(
                        color: Color(0xFFE30606),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          _buildSourceDestinationContainer(bus.route),
          const SizedBox(height: 20, width: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ROUTES',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      bus.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle live location tracking
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE30606),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'TRACK LIVE LOCATION',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

 Widget _buildSourceDestinationContainer(List<Map<String, dynamic>> route) {
  return Container(
    width: 200, // Set a fixed width here
    child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BUS SOURCE',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                source,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          const Icon(Icons.arrow_forward, size: 24, color: Colors.black),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DESTINATION',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                destination,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
}

}

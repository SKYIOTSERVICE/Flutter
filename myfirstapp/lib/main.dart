import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String errorText = '';

  void _authenticate() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == 'a' && password == 'a') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      setState(() {
        errorText = 'Invalid username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 80, color: Colors.indigo),
              SizedBox(height: 20),
              Text(
                'Login',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              if (errorText.isNotEmpty)
                Text(
                  errorText,
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 10),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _authenticate,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> devices = [
    "Canteen",
    "Office",
    "Feed Mill",
    "Bathroom",
    "Boiler",
    "Hatchery 1",
    "Hatchery 2",
    "Bungalow",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Devices"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text("Logout"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: devices.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.devices),
              title: Text(devices[index]),
              subtitle: Text('Details about ${devices[index]}'),
              onTap: () {
                
                switch (devices[index]) {
                  case 'Canteen':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CanteenPage()));
                    break;
                  case 'Office':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OfficePage()));
                    break;
                  case 'Feed Mill':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FeedMillPage()));
                    break;
                  case 'Bathroom':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BathroomPage()));
                    break;
                  case 'Boiler':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BoilerPage()));
                    break;
                  case 'Hatchery 1':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Hatchery1Page()));
                    break;
                  case 'Hatchery 2':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Hatchery2Page()));
                    break;
                  case 'Bungalow':
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BungalowPage()));
                    break;
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class CanteenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDevicePage(context, "Canteen", "Canteen sensor shows temperature, humidity, and energy usage.");
  }
}

class OfficePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDevicePage(context, "Office", "Office devices include lights, AC, and air quality monitor.");
  }
}

class FeedMillPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDevicePage(context, "Feed Mill", "Feed Mill monitors motor health and power usage.");
  }
}

class BathroomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDevicePage(context, "Bathroom", "Bathroom humidity and water leak detectors installed.");
  }
}

class BoilerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDevicePage(context, "Boiler", "Boiler temperature, pressure, and maintenance schedule.");
  }
}

class Hatchery1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDevicePage(context, "Hatchery 1", "Hatchery 1 has temperature and egg-turn sensors.");
  }
}

class Hatchery2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDevicePage(context, "Hatchery 2", "Hatchery 2 is identical to Hatchery 1, with extended monitoring.");
  }
}

class BungalowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildDevicePage(context, "Bungalow", "Bungalow has smart lights, security cameras, and thermostat.");
  }
}


Widget _buildDevicePage(BuildContext context, String title, String content) {
  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            content,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    ),
  );
}

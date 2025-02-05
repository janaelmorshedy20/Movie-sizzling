import 'package:flutter/material.dart';
import 'package:flutter_application_1/SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showWelcomeOverlay = false;
  bool _showUploadOverlay = false;
  bool _showSearchOverlay = false;
  TextEditingController _searchController = TextEditingController();

  void _showWelcomeDialog() {
    setState(() {
      _showWelcomeOverlay = true;
    });
  }

  void _showUploadDialog() {
    setState(() {
      _showUploadOverlay = true;
    });
  }

  void _hideAllOverlays() {
    setState(() {
      _showWelcomeOverlay = false;
      _showUploadOverlay = false;
      _showSearchOverlay = false;
    });
  }

  void _processUpload() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing video...')),
    );

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _showSearchOverlay = true;
      });
    });
  }

  void _submitSearch() {
    String query = _searchController.text;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Searching for: $query')),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/v3.jpg'), 
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: 'Username',
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 9),
                            // Forgot Password Button
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                             
                                onPressed: () {  },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(fontSize: 16, color: Colors.blue),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _showWelcomeDialog,
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  backgroundColor: const Color.fromARGB(255, 169, 148, 140),
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                ),
                              ),
                            ),
                              const SizedBox(height: 9),
                            GestureDetector(
                        onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignUpScreen()),
  );
},

                          child: const Text(
                            'Don\'t have an account? Sign up',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Welcome Overlay
          if (_showWelcomeOverlay)
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Welcome!',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Upload Your Video and Let\'s Go!',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
  onPressed: _showUploadDialog,
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 169, 148, 140),
  ),
  child: const Text(
    'Upload',
    style: TextStyle(color: Colors.black), // Set text color to black
  ),
),

                  ],
                ),
              ),
            ),

          // Upload Overlay
          if (_showUploadOverlay)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Container(
                  width: 350,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Upload Your Video',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.upload, size: 50),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: _hideAllOverlays,
                            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
                          ),
                          ElevatedButton(
  onPressed: _processUpload,
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 169, 148, 140),
  ),
  child: const Text(
    'Process',
    style: TextStyle(color: Colors.black), // Set text color to black
  ),
),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Search Overlay (Appears after 5s)
          if (_showSearchOverlay)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Container(
                  width: 350,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Search for a Query',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Enter your query...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: _hideAllOverlays,
                            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
                          ),
                          ElevatedButton(
  onPressed: _submitSearch,
  style: ElevatedButton.styleFrom(
    backgroundColor:  Color.fromARGB(255, 169, 148, 140), // Set button color to red
  ),
  child: const Text(
    'Search',
    style: TextStyle(color: Colors.black), // Set text color to black
  ),
),

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

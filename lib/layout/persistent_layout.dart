
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/widgets/glass_container.dart';

class PersistentLayout extends StatelessWidget {
  final Widget child;

  const PersistentLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.purple],
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/noise.png'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: Stack(
          children: [
            child,
            Positioned(
              top: 20,
              left: 20,
              child: GlassContainer(
                child: InkWell(
                  onTap: () => context.go('/dashboard'),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Icon(Icons.medical_services, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'DoseCare', // App name
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Hello!',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: GlassContainer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () => print('Settings tapped'),
                          child: const Icon(Icons.settings, color: Colors.white)),
                      const SizedBox(width: 16),
                      InkWell(
                          onTap: () => print('Profile tapped'),
                          child: const Icon(Icons.person, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 100,
              bottom: 20,
              child: GlassContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.dashboard, color: Colors.white),
                        onPressed: () => context.go('/dashboard'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calculate, color: Colors.white),
                        onPressed: () => context.go('/calculator'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.book, color: Colors.white),
                        onPressed: () => context.go('/compendium'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.sync_alt, color: Colors.white),
                        onPressed: () => context.go('/interactions'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

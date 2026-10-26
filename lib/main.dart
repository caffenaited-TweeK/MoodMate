import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const MoodMateApp());
}

class MoodMateApp extends StatelessWidget {
  const MoodMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoodMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F7FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8BC9FF),
          brightness: Brightness.light,
        ),
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: const Color(0xFF1E2A3A),
          displayColor: const Color(0xFF1E2A3A),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1600), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const WelcomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8F7FC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CloudLogo(size: 170),
            SizedBox(height: 18),
            Text(
              'MoodMate',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                color: Color(0xFF4A6CB3),
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8BC9FF)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CloudLogo(size: 170),
              const SizedBox(height: 28),
              const Text(
                'MoodMate',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF4A6CB3),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Your mood, your moment, your MoodMate.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF5D728C),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Share a quick mood note, track your feelings, and stay connected in a calm, friendly space.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF6E7E8C),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8BC9FF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF4A6CB3),
                    side: const BorderSide(color: Color(0xFFB9D7FF)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Create account',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF496AA8)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1E2A3A),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in to keep your mood notes close.',
                style: TextStyle(
                  color: Color(0xFF6B7A90),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              _buildTextField('Email', Icons.email_outlined, _emailController),
              const SizedBox(height: 18),
              _buildTextField('Password', Icons.lock_outline_rounded, _passwordController, obscure: true),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(builder: (context) => const MainScreen()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7BC8B8),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text(
                    'Need an account? Sign up',
                    style: TextStyle(
                      color: Color(0xFF4A6CB3),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    IconData icon,
    TextEditingController controller, {
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF7E90A8)),
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF6B7A90)),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFDEE7F8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF8BC9FF), width: 2),
        ),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF496AA8)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Create account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1E2A3A),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Start sharing your mood in a safe and friendly space.',
                style: TextStyle(
                  color: Color(0xFF6B7A90),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 28),
              _buildTextField('Full name', Icons.person_outline, _nameController),
              const SizedBox(height: 18),
              _buildTextField('Email', Icons.email_outlined, _emailController),
              const SizedBox(height: 18),
              _buildTextField('Password', Icons.lock_outline_rounded, _passwordController, obscure: true),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(builder: (context) => const MainScreen()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8BC9FF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    IconData icon,
    TextEditingController controller, {
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF7E90A8)),
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF6B7A90)),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFDEE7F8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF8BC9FF), width: 2),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<MoodEntry> _entries = [
    MoodEntry(
      userName: 'Maya',
      mood: 'Happy',
      emoji: '😊',
      note: 'Feeling happy today! ♡',
      time: '2 min ago',
      avatarColor: const Color(0xFFE9C7FF),
      visibility: 'Public',
      reactions: 12,
    ),
    MoodEntry(
      userName: 'Leo',
      mood: 'Tired',
      emoji: '😴',
      note: 'A little tired, but I am doing okay.',
      time: '18 min ago',
      avatarColor: const Color(0xFFBEE5D5),
      visibility: 'Friends',
      reactions: 7,
    ),
    MoodEntry(
      userName: 'Ari',
      mood: 'Calm',
      emoji: '🌤️',
      note: 'Today feels like a fresh start.',
      time: '1 hour ago',
      avatarColor: const Color(0xFFBFD8FF),
      visibility: 'Public',
      reactions: 18,
    ),
  ];

  final List<Friend> _friends = const [
    Friend(name: 'Maya', mood: 'Happy', emoji: '😊', note: 'Just enjoying the day.'),
    Friend(name: 'Noah', mood: 'Motivated', emoji: '💪', note: 'Ready for a fresh start.'),
    Friend(name: 'Lena', mood: 'Calm', emoji: '🌿', note: 'A little quiet today.'),
  ];

  List<Widget> _buildPages() {
    return [
      HomeTab(entries: _entries, onAddMood: _addMood),
      HistoryTab(entries: _entries),
      FriendsTab(friends: _friends),
      ProfileTab(entries: _entries),
    ];
  }

  void _addMood(MoodEntry entry) {
    setState(() {
      _entries.insert(0, entry);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = _buildPages();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FC),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateMoodSheet(context),
        backgroundColor: const Color(0xFF8BC9FF),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: const Icon(Icons.add, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF4A6CB3),
          unselectedItemColor: const Color(0xFF8AA0B7),
          backgroundColor: Colors.white,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.history_rounded), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.people_alt_rounded), label: 'Friends'),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  Future<void> _showCreateMoodSheet(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return CreateMoodSheet(onSave: _addMood);
      },
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({
    required this.entries,
    required this.onAddMood,
    super.key,
  });

  final List<MoodEntry> entries;
  final void Function(MoodEntry entry) onAddMood;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 90),
        child: ListView(
          children: [
            Row(
              children: [
                const CloudLogo(size: 46),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'MoodMate',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF4A6CB3),
                        ),
                      ),
                      Text(
                        'How are you feeling today?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E2A3A),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 42,
                  height: 42,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFB8E8FF), Color(0xFFE1D6FF)],
                    ),
                  ),
                  child: const Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (sheetContext) => CreateMoodSheet(onSave: onAddMood),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFE2E8F4)),
                ),
                child: const Text(
                  'Share your mood...',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF7C8DA5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              "Today's moods",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E2A3A),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 88,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  MoodChoiceChip(label: 'Happy', emoji: '😊', color: Color(0xFFFFE3A1)),
                  MoodChoiceChip(label: 'Sad', emoji: '😢', color: Color(0xFFC9DCF7)),
                  MoodChoiceChip(label: 'Tired', emoji: '😴', color: Color(0xFFD6EFD7)),
                  MoodChoiceChip(label: 'Anxious', emoji: '😟', color: Color(0xFFEFD8F7)),
                  MoodChoiceChip(label: 'Excited', emoji: '🤩', color: Color(0xFFF7D9C8)),
                  MoodChoiceChip(label: 'Calm', emoji: '🌿', color: Color(0xFFD9F4EB)),
                ],
              ),
            ),
            const SizedBox(height: 18),
            ...entries.map((entry) => MoodCard(entry: entry)).toList(),
          ],
        ),
      ),
    );
  }
}

class HistoryTab extends StatelessWidget {
  const HistoryTab({required this.entries, super.key});

  final List<MoodEntry> entries;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mood history',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E2A3A),
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFFE6EBF3)),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: entry.avatarColor,
                        child: Text(entry.emoji, style: const TextStyle(fontSize: 24)),
                      ),
                      title: Text('${entry.mood} · ${entry.time}'),
                      subtitle: Text(entry.note),
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

class FriendsTab extends StatelessWidget {
  const FriendsTab({required this.friends, super.key});

  final List<Friend> friends;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Friends',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E2A3A),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: friends
                    .map(
                      (friend) => Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFFE4EAF5)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(friend.emoji, style: const TextStyle(fontSize: 20)),
                            const SizedBox(height: 4),
                            Text(friend.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                itemCount: friends.length,
                itemBuilder: (context, index) {
                  final friend = friends[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFFE5EAF5)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: const Color(0xFFDBF0FF),
                          child: Text(friend.emoji, style: const TextStyle(fontSize: 22)),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    friend.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF1E2A3A),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(999),
                                      color: const Color(0xFFEDE7FF),
                                    ),
                                    child: Text(
                                      friend.mood,
                                      style: const TextStyle(
                                        color: Color(0xFF5F6AC9),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                friend.note,
                                style: const TextStyle(
                                  color: Color(0xFF5E6F85),
                                  fontSize: 15,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

class ProfileTab extends StatelessWidget {
  const ProfileTab({required this.entries, super.key});

  final List<MoodEntry> entries;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 90),
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 108,
                height: 108,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFBFE9FF), Color(0xFFE9D8FF)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(Icons.person, size: 52, color: Colors.white),
              ),
            ),
            const SizedBox(height: 18),
            const Center(
              child: Text(
                'Mila Woods',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1E2A3A),
                ),
              ),
            ),
            const Center(
              child: Text(
                '@milawoods',
                style: TextStyle(color: Color(0xFF7185A0), fontSize: 15),
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFE4EAF5)),
              ),
              child: const Text(
                'Small steps, honest feelings, and a little calm every day.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF4E5F76),
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Row(
              children: [
                Expanded(
                  child: StatBlock(label: 'Notes', value: '26'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatBlock(label: 'Friends', value: '18'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatBlock(label: 'Streak', value: '9d'),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const Text(
              'Current mood',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E2A3A),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF9F7),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: const [
                  Text('😊', style: TextStyle(fontSize: 30)),
                  SizedBox(width: 12),
                  Text(
                    'Feeling happy today!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E2A3A),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            _ProfileActionTile(icon: Icons.edit_note_rounded, title: 'Edit profile'),
            _ProfileActionTile(icon: Icons.history_rounded, title: 'Mood history', subtitle: '${entries.length} notes saved'),
            _ProfileActionTile(icon: Icons.settings_rounded, title: 'Settings'),
            _ProfileActionTile(icon: Icons.logout_rounded, title: 'Log out', color: Colors.red),
          ],
        ),
      ),
    );
  }
}

class _ProfileActionTile extends StatelessWidget {
  const _ProfileActionTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.color = const Color(0xFF1E2A3A),
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5EAF5)),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.w700)),
        subtitle: subtitle == null ? null : Text(subtitle!),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}

class StatBlock extends StatelessWidget {
  const StatBlock({required this.label, required this.value, super.key});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE4EAF5)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E2A3A),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF7284A0),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class MoodCard extends StatelessWidget {
  const MoodCard({required this.entry, super.key});

  final MoodEntry entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE7EBF4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: entry.avatarColor,
                child: Text(entry.emoji, style: const TextStyle(fontSize: 24)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.userName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1E2A3A),
                      ),
                    ),
                    Text(
                      entry.time,
                      style: const TextStyle(
                        color: Color(0xFF7B8AA2),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE7FF),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '${entry.emoji} ${entry.mood}',
                  style: const TextStyle(
                    color: Color(0xFF5F6AC9),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            entry.note,
            style: const TextStyle(
              color: Color(0xFF36475C),
              fontSize: 15,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(Icons.favorite_border_rounded, color: Color(0xFF8AA0B7), size: 18),
              const SizedBox(width: 6),
              Text(
                '${entry.reactions} reactions',
                style: const TextStyle(color: Color(0xFF7E8FA4), fontSize: 13),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F7FF),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  '♡ Support',
                  style: TextStyle(
                    color: Color(0xFF4D6BAA),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CreateMoodSheet extends StatefulWidget {
  const CreateMoodSheet({required this.onSave, super.key});

  final void Function(MoodEntry entry) onSave;

  @override
  State<CreateMoodSheet> createState() => _CreateMoodSheetState();
}

class _CreateMoodSheetState extends State<CreateMoodSheet> {
  final TextEditingController _controller = TextEditingController();
  String _selectedMood = 'Happy';
  String _visibility = 'Public';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      decoration: const BoxDecoration(
        color: Color(0xFFF8F7FC),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 48,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFD6DEEA),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Share your mood',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E2A3A),
              ),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: moodOptions
                  .map(
                    (mood) => ChoiceChip(
                      label: Text('${mood.emoji} ${mood.label}'),
                      selected: _selectedMood == mood.label,
                      onSelected: (_) => setState(() => _selectedMood = mood.label),
                      selectedColor: const Color(0xFFCFE9FF),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: _selectedMood == mood.label ? const Color(0xFF385CBE) : const Color(0xFF425B73),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: _controller,
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write a short mood note...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Color(0xFFDEE7F8)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Color(0xFFDEE7F8)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Color(0xFF8BC9FF), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 18),
            DropdownButtonFormField<String>(
              value: _visibility,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFDEE7F8)),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'Public', child: Text('Public')),
                DropdownMenuItem(value: 'Friends', child: Text('Visible to friends')),
                DropdownMenuItem(value: 'Private', child: Text('Private')),
              ],
              onChanged: (value) => setState(() => _visibility = value ?? 'Public'),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final text = _controller.text.trim();
                  if (text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please write a quick mood note.')),
                    );
                    return;
                  }

                  final selected = moodOptions.firstWhere((m) => m.label == _selectedMood);
                  widget.onSave(
                    MoodEntry(
                      userName: 'You',
                      mood: selected.label,
                      emoji: selected.emoji,
                      note: text,
                      time: 'Just now',
                      avatarColor: const Color(0xFFB9E7FF),
                      visibility: _visibility,
                      reactions: 0,
                    ),
                  );
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7BC8B8),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Post mood',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoodEntry {
  MoodEntry({
    required this.userName,
    required this.mood,
    required this.emoji,
    required this.note,
    required this.time,
    required this.avatarColor,
    required this.visibility,
    required this.reactions,
  });

  final String userName;
  final String mood;
  final String emoji;
  final String note;
  final String time;
  final Color avatarColor;
  final String visibility;
  final int reactions;
}

class MoodOption {
  const MoodOption({required this.label, required this.emoji});

  final String label;
  final String emoji;
}

class Friend {
  const Friend({
    required this.name,
    required this.mood,
    required this.emoji,
    required this.note,
  });

  final String name;
  final String mood;
  final String emoji;
  final String note;
}

class MoodChoiceChip extends StatelessWidget {
  const MoodChoiceChip({
    required this.label,
    required this.emoji,
    required this.color,
    super.key,
  });

  final String label;
  final String emoji;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF2E496C),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class CloudLogo extends StatelessWidget {
  const CloudLogo({required this.size, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: size * 0.18,
            left: size * 0.18,
            child: Transform.rotate(
              angle: -math.pi / 10,
              child: Container(
                width: size * 0.52,
                height: size * 0.52,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD8F0FF),
                ),
              ),
            ),
          ),
          Positioned(
            top: size * 0.12,
            right: size * 0.18,
            child: Transform.rotate(
              angle: math.pi / 12,
              child: Container(
                width: size * 0.48,
                height: size * 0.48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE8DFFF),
                ),
              ),
            ),
          ),
          Container(
            width: size * 0.72,
            height: size * 0.5,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
          ),
          Positioned(
            bottom: size * 0.15,
            child: Container(
              width: size * 0.62,
              height: size * 0.22,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
              ),
            ),
          ),
          Positioned(
            top: size * 0.35,
            left: size * 0.37,
            child: Container(
              width: size * 0.12,
              height: size * 0.12,
              decoration: const BoxDecoration(
                color: Color(0xFF8BC9FF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: size * 0.35,
            right: size * 0.37,
            child: Container(
              width: size * 0.12,
              height: size * 0.12,
              decoration: const BoxDecoration(
                color: Color(0xFF8BC9FF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: size * 0.26,
            child: Container(
              width: size * 0.2,
              height: size * 0.12,
              decoration: const BoxDecoration(
                color: Color(0xFFB4E4C5),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(18)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const List<MoodOption> moodOptions = [
  MoodOption(label: 'Happy', emoji: '😊'),
  MoodOption(label: 'Sad', emoji: '😢'),
  MoodOption(label: 'Tired', emoji: '😴'),
  MoodOption(label: 'Anxious', emoji: '😟'),
  MoodOption(label: 'Excited', emoji: '🤩'),
  MoodOption(label: 'Calm', emoji: '🌿'),
  MoodOption(label: 'Lonely', emoji: '💛'),
  MoodOption(label: 'Grateful', emoji: '🙏'),
  MoodOption(label: 'Confused', emoji: '🤔'),
  MoodOption(label: 'Motivated', emoji: '💪'),
  MoodOption(label: 'Loved', emoji: '💖'),
  MoodOption(label: 'Neutral', emoji: '😐'),
];

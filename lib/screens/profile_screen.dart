import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final username = Provider.of<UserProvider>(context).username;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontFamily: 'Lexend Deca'),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () =>
              Navigator.pop(context), // Navigate back to the previous screen
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Avatar, Greeting, and User Name
              Row(
                children: [
                  const CircleAvatar(
                    radius:
                            40, 
                    backgroundImage: AssetImage(
                        'assets/images/palestine_flag.png'), 
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello!',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        username,
                        style: const TextStyle(
                          fontFamily: 'Lexend Deca',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Profile Options
              _buildProfileOption(
                context,
                icon: Icons.person_outline,
                title: 'Update Profile',
                onTap: () => Navigator.pushNamed(context, '/update-profile',
                    arguments: username),
              ),
              const SizedBox(height: 10),
              _buildProfileOption(
                context,
                icon: Icons.lock_outline_sharp,
                title: 'Change Password',
                onTap: () => Navigator.pushNamed(context, '/change-password'),
              ),
              const SizedBox(height: 10),
              _buildProfileOption(
                context,
                icon: Icons.settings_outlined,
                title: 'Settings',
                onTap: () => Navigator.pushNamed(context, '/settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 1,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        leading: Icon(
          icon,
          size: 24,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Lexend Deca',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.black,
        ),
        onTap: onTap,
      ),
    );
  }
}

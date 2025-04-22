// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'task_card.dart';
import 'add_task_screen.dart';
import 'task_model.dart';
import '../user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  void _addTask() async {
    final result = await Navigator.push<Task>(
      context,
      MaterialPageRoute(builder: (_) => const AddTaskScreen()),
    );
    if (result != null) {
      setState(() {
        tasks.add(result);
      });
    }
  }

  void _editTask(int index) async {
    final result = await Navigator.push<Task>(
      context,
      MaterialPageRoute(builder: (_) => AddTaskScreen(task: tasks[index])),
    );
    if (result != null) {
      setState(() {
        tasks[index] = result;
      });
    }
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Task deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<UserProvider>(context).username;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 15),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/profile'),
                      child: const CircleAvatar(
                        radius:
                            40, 
                        backgroundImage:
                            AssetImage('assets/images/palestine_flag.png'),
                      ),
                    ),
                    const SizedBox(width: 15),
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
                IconButton(
                  icon: SvgPicture.asset('assets/images/add_task.svg'),
                  onPressed: _addTask,
                ),
              ],
            ),
          ),
          Expanded(
            child: tasks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'There are no tasks yet.\nPress the button \nTo add New task',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            fontSize: 16,
                            color: Color(0xFF90A4AE),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SvgPicture.asset(
                          'assets/images/no_tasks.svg',
                          height: 200,
                        ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            const Text(
                              'Tasks',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: const Color(0xFFA5D6A7),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  tasks.length.toString(),
                                  style: const TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        Color.fromARGB(255, 29, 116, 74),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              key: ValueKey(tasks[index].id),
                              actionPane: const SlidableDrawerActionPane(),
                              actionExtentRatio: 0.25,
                              secondaryActions: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: IconSlideAction(
                                    caption: 'Edit',
                                    color: Colors.green,
                                    icon: Icons.edit,
                                    onTap: () => _editTask(index),
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: IconSlideAction(
                                    caption: 'Delete',
                                    color: Colors.red,
                                    icon: Icons.delete,
                                    onTap: () => _deleteTask(index),
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ],
                              child: TaskCard(task: tasks[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

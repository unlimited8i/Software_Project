
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/workout_data.dart';
import 'package:provider/provider.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override 
  State<UserHome> createState() => _UserHomeState();

}

class _UserHomeState extends State<UserHome> {

  //text controller
  final newWorkoutNameController = TextEditingController();


  // create a new workout
  void createNewWorkout(){
    showDialog(
      context: context, 
      builder:(context) => AlertDialog(
        title: Text('Create new workout'),
        content: TextField(
          controller: newWorkoutNameController,
        ),
        actions: [
          //save button
          MaterialButton(
            onPressed: save,
            child: Text('save'),
          ),
          //cancel button
          MaterialButton(
            onPressed: cancel,
            child: Text('cancel'),
          )
        ],
    ),
    );
  }

//save workout
void save() {
  //get workout name from text controller
  String newWorkoutName = newWorkoutNameController.text;
  // add workout to workoutdata list
  Provider.of<WorkoutData>(context,listen: false).addWorkout(newWorkoutName);
  // pop dialog box
  Navigator.pop(context);
  clear();
}

//cancel
void cancel() {
  // pop dialog box
  Navigator.pop(context);
  clear();
}
  
void clear(){
  newWorkoutNameController.clear();
}


  @override 
  Widget build(BuildContext context) { 
    return Consumer<WorkoutData>(
      builder:(context, value, child) => Scaffold(
      // appBar: AppBar(
      //   title: const Text('E-Workout')
      // ), // No need for this becuase i added appbar on the nav_bar file
      floatingActionButton: FloatingActionButton(
        onPressed: createNewWorkout,
        child: const Icon(Icons.add),
        ),
      body: ListView.builder(
        itemCount: value.getWorkoutList().length,
        itemBuilder: (context,index)=>ListTile(
          title: Text(value.getWorkoutList()[index].name),
          )
        ),
      ),
    );
  }
}





/*
class _HomePageState extends State<HomePage> {
  @override 
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Workout')
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context,index)=>ListTile(
          title: Text('lol'),
      )),
    );
  }
}
*/
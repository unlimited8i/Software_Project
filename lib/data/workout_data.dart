import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/exercise.dart';
import 'package:flutter_application_1/models/workout.dart';


class WorkoutData extends ChangeNotifier {


/*
  workout data structure

 */


List<Workout> workoutList= [

  Workout(name: 'UpperBody', 
  exercises: [
    Exercise(
      name: 'Bicep Curls', 
      weight: '15', 
      reps: '12', 
      sets: '3'),
  Exercise(
      name: 'Bench Press', 
      weight: '60', 
      reps: '12', 
      sets: '3'),
  ]),
  Workout(name: 'LowerBody', 
  exercises: [
    Exercise(
      name: 'Squats', 
      weight: '15', 
      reps: '12', 
      sets: '3'),
  ]),


];




// get the list of workout
List<Workout> getWorkoutList() {
  return workoutList;
}


// get length of a given workout
int numberOfExercisesInWorkout(String workoutName){
  Workout relevantWorkout = getRelevantWorkout(workoutName);
  return relevantWorkout.exercises.length;
}


// add workout
void addWorkout(String name) {
  //add a new workout with a blank list of exercises
  workoutList.add(Workout(name: name, exercises: []));

  notifyListeners();
}

//add an exercise to a workout
void addExercise(String workoutName , String exerciseName , String weight , String reps , String sets){
 
  // find the relevant workout
  Workout relevantWorkout = getRelevantWorkout(workoutName);
  
  relevantWorkout.exercises.add(
    Exercise(name: workoutName,
     weight: weight, 
     reps: reps, 
     sets: sets),
  );
  
  notifyListeners();

}



// check off exercise once it's done
void checkOffExercise(String workoutName,String exerciseName){
  // find the relevant workout and exercise in the workout
  Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);
  // check off boolean to show user completed the exercise
  relevantExercise.isCompleted = !relevantExercise.isCompleted;

  notifyListeners();

}









////////////////////////////////////////// sub classes ////////////////////////


//return relevant workout object, given a workout name
Workout getRelevantWorkout (String workoutName){
  Workout relevantWorkout = 
     workoutList.firstWhere((workout) => workout.name == workoutName);
  return relevantWorkout;
}




//return relevant exercise object, given a exercise name
Exercise getRelevantExercise(String workoutName, String exerciseName){
  // find the relevant workout
  Workout relevantWorkout = getRelevantWorkout(workoutName);
  // find the relevant exercise in the workout
  Exercise relevantExercise = 
    relevantWorkout.exercises.firstWhere((exercise) => exercise.name == exerciseName);
  return relevantExercise;

}


}
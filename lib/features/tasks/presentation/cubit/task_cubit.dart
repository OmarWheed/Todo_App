import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/database/db_helper.dart';
import 'package:to_do_app/core/services/services_locator.dart';
import 'package:to_do_app/core/utils/helper.dart';
import 'package:to_do_app/features/tasks/data/model/task_model.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerNote = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  DateTime currentData = DateTime.now();
  String startTime = '8:00';
  String endTime = '12:00';

  int currentIndex = 0;
  String selectedValue = DateFormat.yMMMMd().format(DateTime.now());

  List<TaskModel> taskList = [];

  int get lenList => taskList.length;

  TaskCubit() : super(TaskInitial());
  void selectNewData(value) {
    selectedValue = value;
    emit(SelectValueDate());
    getAllTasks();
  }

  //!add Task to List
  void addTask() {
    emit(InsertTaskLoading());
    try {
      if (globalKey.currentState!.validate()) {
        sl<DataBaseHelper>().insertTask(
            taskModel: TaskModel(
          title: controllerTitle.text,
          note: controllerNote.text,
          date: currentDAta(currentData),
          startTime: startTime,
          endTime: endTime,
          complete: 0,
          color: currentIndex,
        ));
        getAllTasks();
        controllerTitle.clear();
        controllerNote.clear();

        emit(InsertTaskSuccess());
      }
    } catch (e) {
      emit(InsertTaskError(errorMessage: e.toString()));
    }
  }

  void getDate(context) async {
    emit(UpDateTheDataLoadingState());
    DateTime? pickedDate = await showDatePicker(
      builder: themeOfPicker,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      currentData = pickedDate;
      emit(UpDateTheDataSuccessState());
    } else {
      log("Pick failed==null");
      emit(UpDateTheDataErrorState());
    }
  }

//! get Time Start
  void getTimeStart(context) async {
    emit(GetStartTimeLoadingState());
    TimeOfDay? pickerTimeStart = await showTimePicker(
      builder: themeOfPicker,
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickerTimeStart != null) {
      startTime = pickerTimeStart.format(context);
      emit(GetStartTimeSuccessState());
    } else {
      log("Pick Start Time failed==null");
      emit(GetStartTimeErrorState());
    }
  }

  //! get Time End
  void getTimeEnd(context) async {
    emit(GetEndTimeLoadingState());
    TimeOfDay? pickedEnd = await showTimePicker(
      builder: themeOfPicker,
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedEnd != null) {
      endTime = pickedEnd.format(context);
      emit(GetEndTimeSuccessState());
    } else {
      log("Pick Start Time failed==null");
      emit(GetEndTimeErrorState());
    }
  }

//! SetColor
  void setIndexColor(index) {
    emit(IndexInitial());
    currentIndex = index;
    emit(IndexChecked());
  }

//!get All Tasks
  void getAllTasks() async {
    emit(GetTaskLoadingState());
    await sl<DataBaseHelper>().getAllTasks().then((listOfTasks) async {
      taskList = listOfTasks
          .map((e) => TaskModel.fromJson(e))
          .toList()
          .where((task) => task.date == convertDate(selectedValue))
          .toList();
      // taskList.where((task) => task.date == currentDAta(selectedValue));

      emit(GetTaskSuccessState());
    }).catchError((error) {
      emit(GetTaskErrorState(errorMessage: error.toString()));
    });
  }

//!
  void taskIsCompleted(int id) async {
    emit(CompleteLoading());
    await sl<DataBaseHelper>().updateTask(id).then((e) {
      getAllTasks();
      emit(CompleteSuccess());
    }).catchError((e) {
      emit(CompleteError(errorMessage: e.toString()));
    });
  }

  //! Delete
  void deleteTask(int id) async {
    emit(DeleteTaskLoading());
    await sl<DataBaseHelper>().deleteTask(id: id).then((e) {
      getAllTasks();
      emit(DeleteTaskSuccess());
    }).catchError((e) {
      emit(DeleteTaskError(errorMessage: e.toString()));
    });
  }
}

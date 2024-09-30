import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/helper.dart';
import 'package:to_do_app/features/tasks/data/model/task_model.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerNote = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  DateTime currentData = DateTime.now();
  TimeOfDay currentTimeStart = TimeOfDay.fromDateTime(DateTime.now());
  TimeOfDay timeEnd = TimeOfDay.fromDateTime(DateTime.now());
  int currentIndex = 0;
  String selectedValue = DateFormat.yMMMMd().format(DateTime.now());

  List<TaskModel> taskList = [];

  int get lenList => taskList.length;

  TaskCubit() : super(TaskInitial());
  void selectNewData(value) {
    selectedValue = value;
    emit(SelectValueDate());
  }

  //!add Task to List
  void addTask() {
    emit(InsertTaskLoading());
    try {
      taskList.add(TaskModel(
        id: lenList + 1,
        title: controllerTitle.text,
        note: controllerNote.text,
        data: currentDAta(currentData),
        startTime: currentTimeStart,
        endTime: timeEnd,
        isCompleted: true,
        color: currentIndex,
      ));
      controllerTitle.clear();
      controllerNote.clear();
      emit(InsertTaskSuccess());
    } catch (e) {
      emit(InsertTaskError(errorMessage: e.toString()));
    }
  }

  void getDate(context) async {
    emit(GetTaskLoadingState());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      currentData = pickedDate;
      emit(GetTaskSuccessState());
    } else {
      log("Pick failed==null");
      emit(GetTaskErrorState());
    }
  }

  void getTimeStart(context) async {
    emit(GetStartTimeLoadingState());
    TimeOfDay? pickerTimeStart = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickerTimeStart != null) {
      currentTimeStart = pickerTimeStart;
      emit(GetStartTimeSuccessState());
    } else {
      log("Pick Start Time failed==null");
      emit(GetStartTimeErrorState());
    }
  }

  void getTimeEnd(context) async {
    emit(GetEndTimeLoadingState());
    TimeOfDay? pickedEnd = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedEnd != null) {
      timeEnd = pickedEnd;
      emit(GetEndTimeSuccessState());
    } else {
      log("Pick Start Time failed==null");
      emit(GetEndTimeErrorState());
    }
  }

  void setIndexColor(index) {
    emit(IndexInitial());
    currentIndex = index;
    emit(IndexChecked());
  }
}

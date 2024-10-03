part of 'task_cubit.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class GetTaskLoadingState extends TaskState {}

class GetTaskSuccessState extends TaskState {}

class GetTaskErrorState extends TaskState {
  final String errorMessage;
  GetTaskErrorState({required this.errorMessage});
}
////////////////////

class UpDateTheDataLoadingState extends TaskState {}

class UpDateTheDataSuccessState extends TaskState {}

class UpDateTheDataErrorState extends TaskState {}

class GetStartTimeLoadingState extends TaskState {}

class GetStartTimeSuccessState extends TaskState {}

class GetStartTimeErrorState extends TaskState {}

class GetEndTimeLoadingState extends TaskState {}

class GetEndTimeSuccessState extends TaskState {}

class GetEndTimeErrorState extends TaskState {}

class IndexInitial extends TaskState {}

class IndexChecked extends TaskState {}

class SelectValueDate extends TaskState {}

class InsertTaskLoading extends TaskState {}

class InsertTaskSuccess extends TaskState {}

class InsertTaskError extends TaskState {
  final String errorMessage;

  InsertTaskError({required this.errorMessage});
}

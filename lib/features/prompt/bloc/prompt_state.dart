part of 'prompt_bloc.dart';

@immutable
sealed class PromptState {}

final class PromptInitial extends PromptState {}


final class PromptGeneratingImageLoadState extends PromptState {}

final class PromptGeneratingImageErrorState extends PromptState {}

final class PromptGeneratingImageSuccesState extends PromptState {

  final Uint8List uint8list;

  PromptGeneratingImageSuccesState(this.uint8list);
  
}
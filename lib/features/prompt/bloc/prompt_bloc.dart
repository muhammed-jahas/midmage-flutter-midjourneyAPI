import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midjourney_app/features/prompt/repos/prompt_repo.dart';
import 'package:meta/meta.dart';

part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(PromptInitial()) {
    on<PromptInitialEvent>(promptInitialEvent);
    on<PromptEnteredEvent>(promptEnteredEvent);
  }

  FutureOr<void> promptEnteredEvent(PromptEnteredEvent event, Emitter<PromptState> emit) async {
    emit(PromptGeneratingImageLoadState());
    Uint8List? bytes = await PromptRepo.generateImage(event.prompt);
    if(bytes!=null){
      emit(PromptGeneratingImageSuccesState(Uint8List.fromList(bytes)));
    }else{
      emit(PromptGeneratingImageErrorState());
    }
    
  }

  FutureOr<void> promptInitialEvent(PromptInitialEvent event, Emitter<PromptState> emit) async {
    Uint8List bytes = await rootBundle.load('assets/images/default-image.png').then((byteData) => byteData.buffer.asUint8List());
  emit(PromptGeneratingImageSuccesState(bytes));
  }
}

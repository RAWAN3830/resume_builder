import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/experiences_bloc/experiences_events.dart';
import 'package:resume/infra/bloc/experiences_bloc/experiences_state.dart';
import 'package:resume/infra/services/experience_service/experience_service.dart';

class ExperienceBloc extends Bloc<ExperiencesEvent,ExperienceState>{
  final ExperienceService experienceService;

  ExperienceBloc(this.experienceService): super(ExperienceInitial()){
    // pass event in bloc
    on<AddExperiencesEvent>((event, emit) {
      //from service file we add over functions
      experienceService.addExperience(event.experienceModel);
      //emit come from state file
      emit(ExperiencesUpdated(experienceService.experienceList));
    },);
  }


}
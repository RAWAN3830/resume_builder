import 'package:bloc/bloc.dart';

import '../../services/education_service/education_service.dart';
import 'education_event.dart';
import 'education_state.dart';


class EducationBloc extends Bloc<EducationEvent, EducationState> {
  final EducationService educationService;

  EducationBloc(this.educationService) : super(EducationInitial()) {
    on<AddEducation>((event, emit) {
      educationService.addEducation(event.education);
      emit(EducationUpdated(List.of(educationService.educationList)));
    });

    on<UpdateEducation>((event, emit) {
      educationService.updateEducation(event.index, event.updatedEducation);
      emit(EducationUpdated(List.from(educationService.educationList)));
    });

    on<DeleteEducation>((event, emit) {
      educationService.deleteEducation(event.index);
      emit(EducationUpdated(List.from(educationService.educationList)));
    });

    on<ResetEducation>((event, emit) {
      educationService.resetEducation();
      emit(EducationUpdated(List.from(educationService.educationList)));
    });

    on<LoadingEducation>((event, emit) {
      emit(EducationUpdated(List.from(educationService.educationList)));
    });
  }
}

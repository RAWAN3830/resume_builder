import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/personal_info_bloc/personal_info_event.dart';
import 'package:resume/infra/bloc/personal_info_bloc/personal_info_state.dart';
import 'package:resume/infra/services/firebase_service/personal_info_repository.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc() : super(PersonalInfoInitial()) {
    // Register the event handler for AddPersonalInfoEvent
    on<AddPersonalInfoEvent>(_onAddPersonalInfo);
  }

  Future<void> _onAddPersonalInfo(
      AddPersonalInfoEvent event,
      Emitter<PersonalInfoState> emit,
      ) async {
    emit(PersonalInfoLoading());
    try {
      await PersonalInfoRepository.addPersonInfoToFirebase(
        event.personalInfoModel,
        event.context,
      );
      emit(PersonalInfoSuccess());
    } catch (e) {
      emit(PersonalInfoFailure(e.toString()));
    }
  }
}

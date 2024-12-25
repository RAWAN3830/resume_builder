import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/personal_info_bloc/personal_info_event.dart';
import 'package:resume/infra/bloc/personal_info_bloc/personal_info_state.dart';
import 'package:resume/infra/services/firebase_service/get_personal_info_to_firebase.dart';
import 'package:resume/infra/services/firebase_service/set_personal_info_to_firebase.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc() : super(PersonalInfoInitial()) {
    // Register the event handler for AddPersonalInfoEvent
    on<AddPersonalInfoEvent>(_onAddPersonalInfo);
    on<GetPersonalInfoEvent>(_onGetPersonalInfo);
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

  Future<void> _onGetPersonalInfo(
      GetPersonalInfoEvent event,
      Emitter<PersonalInfoState> emit,
      ) async {
    emit(PersonalInfoLoading());
    try {
      final personalInfoList = await GetPersonalInfoToFirebase().getAllPersonalInfo();
      emit(PersonalInfoLoaded(personalInfoList));
    } catch (e) {
      emit(PersonalInfoFailure(e.toString()));
    }
  }
}


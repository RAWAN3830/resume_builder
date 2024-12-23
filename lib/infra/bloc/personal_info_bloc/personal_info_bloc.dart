import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume/infra/bloc/personal_info_bloc/personal_info_event.dart';
import 'package:resume/infra/bloc/personal_info_bloc/personal_info_state.dart';
import 'package:resume/infra/services/personal_info_repository.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {


  PersonalInfoBloc(this.personalInfoRepository) : super(PersonalInfoInitial());
  final PersonalInfoRepository personalInfoRepository;

  @override
  Stream<PersonalInfoState> mapEventToState(PersonalInfoEvent event) async* {
    if (event is SubmitPersonalInfo) {
      yield PersonalInfoSubmitting();

      try {
        // Save data using the repository
        await personalInfoRepository.savePersonalInfo(event.personalInfo);
        yield PersonalInfoSuccess();
      } catch (e) {
        yield PersonalInfoFailure(e.toString());
      }
    }
  }
}

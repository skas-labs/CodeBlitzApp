import 'package:code_blitz/presentation/screen/home/profile/bloc.dart';
import 'package:code_blitz/model/repo/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final HomeRepository homeRepository;

  ProfileBloc({@required this.homeRepository}) : super(ProfileLoading());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadProfile) {
      yield* _mapLoadProfileToState();
    } else if (event is RefreshProfile) {
      yield ProfileLoading();
      yield* _mapLoadProfileToState();
    }
  }

  Stream<ProfileState> _mapLoadProfileToState() async* {
    try {
      final response = await homeRepository.getProfileData();

      yield ProfileLoaded(response);
    } catch (e) {
      yield ProfileNotLoaded(e.toString());
    }
  }
}

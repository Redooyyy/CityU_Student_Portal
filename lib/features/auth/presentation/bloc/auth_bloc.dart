import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class authBloc extends Bloc<authEvent, authState> {
  authBloc() : super(authInitial()) {
    on<authEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

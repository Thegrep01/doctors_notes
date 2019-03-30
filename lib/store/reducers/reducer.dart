import 'package:doctor_notes/models/client_model.dart';
import 'package:doctor_notes/store/reducers/client_reducer.dart';

class AppState {
  // final User user;
  final List<Client> clients;
  AppState(this.clients);
}

AppState appStateReducer(AppState state, action) => AppState(
      clientReducer(state.clients, action),
    );

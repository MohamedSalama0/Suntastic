abstract class TemporalStates {}

class IntialTemporalState extends TemporalStates {}

class LoadingTemporalState extends TemporalStates {}

class LoadedTemporalState extends TemporalStates {}

class ErrorTemporalState extends TemporalStates {
  final String? errorMessage;
  ErrorTemporalState({required this.errorMessage});
}

class ChangeGraphDimensionsState extends TemporalStates {}

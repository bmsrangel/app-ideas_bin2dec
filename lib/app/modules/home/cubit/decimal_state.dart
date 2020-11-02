part of 'decimal_cubit.dart';

@immutable
abstract class DecimalState {
  const DecimalState();
}

class DecimalInitial extends DecimalState {
  const DecimalInitial();
}

class DecimalCaltculating extends DecimalState {
  const DecimalCaltculating();
}

class DecimalResult extends DecimalState {
  final int result;
  const DecimalResult(this.result);
}

class DecimalCalculationError extends DecimalState {
  final String message;
  const DecimalCalculationError(this.message);
}

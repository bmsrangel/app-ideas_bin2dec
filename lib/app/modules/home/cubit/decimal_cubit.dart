import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'decimal_state.dart';

class DecimalCubit extends Cubit<DecimalState> {
  DecimalCubit() : super(DecimalInitial());

  int result;

  void bin2dec(String value) {
    try {
      result = null;
      emit(DecimalCaltculating());
      if (value.isEmpty) {
        result = 0;
      } else {
        result = int.parse(value, radix: 2);
      }
      emit(DecimalResult(result));
    } catch (e) {
      result = 0;
      emit(DecimalCalculationError("Invalid value informed"));
    }
  }

  void clear() {
    result = null;
    emit(DecimalInitial());
  }
}

import '../../app/generalImports.dart';

abstract class SendWithdrawalRequestState {}

class SendWithdrawalRequestInitial extends SendWithdrawalRequestState {}

class SendWithdrawalRequestInProgress extends SendWithdrawalRequestState {}

class SendWithdrawalRequestSuccess extends SendWithdrawalRequestState {
  final String balance;
  SendWithdrawalRequestSuccess({required this.balance});
}

class SendWithdrawalRequestFailure extends SendWithdrawalRequestState {
  final String errorMessage;

  SendWithdrawalRequestFailure(this.errorMessage);
}

class SendWithdrawalRequestCubit extends Cubit<SendWithdrawalRequestState> {
  SendWithdrawalRequestCubit() : super(SendWithdrawalRequestInitial());

  final CommissionAmountRepository _commissionAmountRepository =
      CommissionAmountRepository();

  Future<void> sendWithdrawalRequest({
    required String amount,
    required String paymentAddress,
  }) async {
    try {
      emit(SendWithdrawalRequestInProgress());
      final balance = await _commissionAmountRepository.sendWithdrawalRequest(
        amount: amount,
        paymentAddress: paymentAddress,
      );

      // Log withdrawal request
      ClarityService.logAction(ClarityActions.withdrawalRequestSent, {
        'amount': amount,
        'payment_address': paymentAddress,
        'remaining_balance': balance,
      });

      emit(SendWithdrawalRequestSuccess(balance: balance));
    } catch (e) {
      emit(SendWithdrawalRequestFailure(e.toString()));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class CheckoutState extends Equatable {
  final List<Map<String, String>> addresses;
  final Map<String, String>? paymentDetails;

  const CheckoutState({
    this.addresses = const [],
    this.paymentDetails,
  });

  CheckoutState copyWith({
    List<Map<String, String>>? addresses,
    Map<String, String>? paymentDetails,
  }) {
    return CheckoutState(
      addresses: addresses ?? this.addresses,
      paymentDetails: paymentDetails ?? this.paymentDetails,
    );
  }

  @override
  List<Object?> get props => [addresses, paymentDetails];

  // factory CheckoutState.fromJson(Map<String, dynamic> json) {
  //   return CheckoutState(
  //     addresses: List<Map<String, String>>.from(json['addresses'] ?? []),
  //     paymentDetails: Map<String, String>.from(json['paymentDetails'] ?? {}),
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'addresses': addresses,
  //     'paymentDetails': paymentDetails,
  //   };
  // }
}

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutState());

  void addAddress(Map<String, String> address) {
    final updatedAddresses = List<Map<String, String>>.from(state.addresses)
      ..add(address);
    emit(state.copyWith(addresses: updatedAddresses));
  }

  void updateAddress(int index, Map<String, String> address) {
    final updatedAddresses = List<Map<String, String>>.from(state.addresses);
    updatedAddresses[index] = address;
    emit(state.copyWith(addresses: updatedAddresses));
  }

  void setPaymentDetails(Map<String, String> details) {
    emit(state.copyWith(paymentDetails: details));
  }

  // You can add methods to save and load the state if needed
  // void saveState() {
  //   // Implementation to save state to local storage or server
  //   final json = state.toJson();
  //   // Save json to storage
  // }

  // void loadState() {
  //   // Implementation to load state from local storage or server
  //   // final json = // Load json from storage
  //   // final loadedState = CheckoutState.fromJson(json);
  //   // emit(loadedState);
  // }
}

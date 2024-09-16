import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mool/shopping/cubits/checkout_cubit.dart';
import 'package:flutter_mool/shopping/screens/checkout_payment.dart';
import 'package:flutter_mool/shopping/widgets/progress_bar_widget.dart';
import 'package:flutter_mool/shopping/widgets/shipping_addresses_widget.dart';

class CheckoutAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 46, 46, 51),
            title: Text(
              'Cart',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Handle back button press
              },
              child: Image.asset(
                'assets/images/account/arrowback.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
          body: Column(
            children: [
              ProgressBarWidget(currentStep: 1),
              Expanded(
                child: ShippingAddressesWidget(
                  addresses: state.addresses,
                  onEditAddress: (index, newAddress) {
                    context
                        .read<CheckoutCubit>()
                        .updateAddress(index, newAddress);
                  },
                  onAddNewAddress: (newAddress) {
                    context.read<CheckoutCubit>().addAddress(newAddress);
                  },
                ),
              ),
              CheckoutButton(),
            ],
          ),
        );
      },
    );
  }
}

class CheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CheckoutPaymentScreen()));
        },
        child: Text('Confirm and Continue'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}

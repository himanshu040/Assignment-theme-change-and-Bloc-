
part of 'getdetails_bloc.dart';
abstract class GetDetailsEvent{}

class SendOtp extends GetDetailsEvent{
  late final String otp;
  late final String transId;

  SendOtp(this.otp,this.transId);
}
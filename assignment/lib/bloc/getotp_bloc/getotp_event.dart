
part of 'getotp_bloc.dart';


abstract class GetOtpEvent{}

class SendData extends GetOtpEvent {

  late final String mobile_no;

  SendData(this.mobile_no);
}
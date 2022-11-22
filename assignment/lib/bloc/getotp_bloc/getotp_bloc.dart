import 'package:assignment/Model/responseerror.dart';
import 'package:assignment/Model/responsegetotp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Repository/getOtpRepo.dart';

part 'getotp_event.dart';
part 'getotp_state.dart';

class GetOtpBloc extends Bloc<GetOtpEvent, GetOtpState>
{
   dynamic data;
  final GetOtpRepo getOtpRepo;
  GetOtpBloc(this.getOtpRepo):super(GetOtpInitial()){
    on<GetOtpEvent>((event,emit) async{
      if(event is SendData)
        {
          emit(GetOtpLoading());
          data=await getOtpRepo.fetchOtp(event.mobile_no);

          if(!data.toString().contains("Error"))
            {
              print("data in not error bloc:${data.toString()}");
              emit(GetOtpLoaded(data!));

            }

          else
            {
              print("data in error block:${data.toString()}");
              emit(GetOtpError(data));
            }

          // await Future.delayed(const Duration(seconds: 3),()async{
          //
          // });
        }
    });

  }

}
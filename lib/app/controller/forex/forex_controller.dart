
import 'package:get/get.dart';
import '../../data/constant/storage_string.dart';
import '../../model/forex.dart' as forex_list;
import '../../services/remote_services.dart';

const store_key = StorageString.ForexStorageKey;

class ForexScreenController extends GetxController {
  bool isLoading = true;
  List<forex_list.Data> forex = [];

  ForexScreenController()  {
     getForex();
  initializeForexData();

  }


  Future<void> initializeForexData() async {
   update();

    try {
      await getForex();
      update();
    } catch (error) {

      print('Error occurred: $error');
    }
  }
  ///forex
  Future<void>  getForex() async {

    try {
   final List<forex_list.Data> forexList = (await RemoteServices.getForexData());
      if (forexList != null) {
        forex = forexList;
        print(forexList.first.buying);

        print('Success state forex');
      } else {
       print('API response is null');
      }
    } catch (err) {
     print('Error state: $err');
    }
  }

}

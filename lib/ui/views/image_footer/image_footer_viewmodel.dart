import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';


class ImageFooterViewModel extends BaseViewModel {

  final picker = ImagePicker();

  String _imagePath = '';
  String get imagePath => _imagePath;

  Future<String> takePicture() async {

    final pickedFile = await picker.getImage(source: ImageSource.camera);

    _imagePath = pickedFile.path;
    notifyListeners();

    return _imagePath;
  }


}

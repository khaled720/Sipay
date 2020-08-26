import 'dart:io';

import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSettingsProvider with ChangeNotifier {
  final BaseMainRepository baseRepo;
  final MainApiModel _userLoginModel;
  final TextEditingController _cityController;
  final TextEditingController _addressController;
  List _countriesList;
  Country selectedCountry;
  Map<String, dynamic> _userInfo;
  Map _countriesMap;
  File _imageFromGallery;
  File _tempImage;
  bool _showLoad;

  ProfileSettingsProvider(this.baseRepo, this._userLoginModel,
      this.selectedCountry, this._cityController, this._addressController) {
    _userInfo = _userLoginModel.data['user'];
    getUserProfile();
  }

  dynamic _getUserInfoValue(String key) =>
      _userInfo != null ? _userInfo[key] : '';

  get userName => _getUserInfoValue('name');

  get phoneNumber => _getUserInfoValue('phone');

  get userProfileImage => _getUserInfoValue('avatar');

  get showLoad => _showLoad;

  get cityController => _cityController;

  get addressController => _addressController;

  List get countriesList => _countriesList;

  File get imageFromGallery => _imageFromGallery;

  load(bool load) {
    _showLoad = load;
    notifyListeners();
  }

  void getUserProfile() async {
    MainApiModel userProfileCountriesModel = await baseRepo.getUserProfile();
    if (userProfileCountriesModel.statusCode == 100) {
      _countriesMap = userProfileCountriesModel.data['countries'];
      _countriesList = List();
      for (int i = 1; i <= _countriesMap.length; i++) {
        _countriesList.add(_countriesMap[i.toString()]);
      }
    }
    notifyListeners();
  }

  filterCountry(Country country) => !_countriesList.contains(country.name);

  pickImageFromLibrary(Function onSuccess) async {
    _imageFromGallery =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    if (_imageFromGallery != null) _uploadImage(onSuccess);
  }

  _uploadImage(Function onSuccess) async {
    load(true);
    MainApiModel uploadImageModel =
        await baseRepo.uploadBase64CorporateImage(_imageFromGallery);
    load(false);
    if (uploadImageModel.statusCode == 100) onSuccess();
  }

  saveProfileUpdate(Function onSuccess, Function onFailure,{String countri}) async {
    if (_countriesList != null &&
        //selectedCountry != null &&
        _cityController.text.trim().isNotEmpty &&
        _addressController.text.trim().isNotEmpty)
         {
      int index = _countriesList.indexOf(countri) + 1;
      print(_countriesList.length.toString()+" #########################33333");
    /*   if (selectedCountry.name == 'Turkey')
        index = _countriesList.indexOf('Türkiye') + 1; */
      load(true);
  var   upated = await baseRepo.userProfileUpdateVersion2(
        //  index.toString(),
   
       index.toString(),
          _cityController.text.trim(),
        _addressController.text.trim());
      load(false);
      upated.body.toString().contains(":100")? onSuccess() : onFailure();
    }
  }
}

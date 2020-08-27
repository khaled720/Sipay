import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttersipay/corporate/dashboard/merchant_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:image_picker/image_picker.dart';

class CorporateProfileSettingsProvider with ChangeNotifier {
  final MerchantMainRepository _merchantRepo;
  final TextEditingController _currentPasswordController;
  final TextEditingController _newPasswordController;
  TextEditingController _confirmPasswordController;
  Map<String, dynamic> _userInfo;
  File _imageFromGallery;
  File _tempImage;
  bool _showLoad;
  String _userName;
  String _userID;
  String _userProfileAvatar;
  String _confirmPasswordErrorMessage;
  String _newPasswordErrorMessage;
  String _currentPasswordErrorMessage;
  static final kEmptyFieldErrorMessage = 'This field can\'t be empty.';

  CorporateProfileSettingsProvider(
      this._merchantRepo,
      this._currentPasswordController,
      this._newPasswordController,
      this._confirmPasswordController) {
    getUserProfile();
  }

  get userName => _userName;

  get userID => _userID;

  get userProfileAvatar => _userProfileAvatar;

  get showLoad => _showLoad;

  String get newPasswordErrorMessage => _newPasswordErrorMessage;

  String get confirmPasswordErrorMessage => _confirmPasswordErrorMessage;

  String get currentPasswordErrorMessage => _currentPasswordErrorMessage;

  TextEditingController get currentPasswordController =>
      _currentPasswordController;

  TextEditingController get newPasswordController => _newPasswordController;

  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  File get imageFromGallery => _imageFromGallery;

  load(bool load) {
    _showLoad = load;
    notifyListeners();
  }

  void getUserProfile() async {
    MainApiModel corporateProfileModel =
        await _merchantRepo.corporateProfileInfo();
    if (corporateProfileModel.statusCode == 100) {
      _userName = corporateProfileModel.data['user']['name'];
      _userID = corporateProfileModel.data['user']['id'].toString();
      _userProfileAvatar = corporateProfileModel.data['user']['img_path'];
    }
    notifyListeners();
  }

  _resetPasswordErrorMessages() {
    _confirmPasswordErrorMessage = null;
    _currentPasswordErrorMessage = null;
    _newPasswordErrorMessage = null;
    notifyListeners();
  }

setImagegalary(File image)async{

 _imageFromGallery =
        // ignore: deprecated_member_use
        image;
notifyListeners();
}
  pickImageFromLibrary(Function onSuccess, Function onFailure) async {
    _imageFromGallery =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    if (_imageFromGallery != null) _uploadImage(onSuccess, onFailure);
  }

  _uploadImage(Function onSuccess, Function onFailure) async {
    load(true);
    MainApiModel uploadImageModel =
        await _merchantRepo.uploadBase64CorporateImage(_imageFromGallery);
    load(false);
    uploadImageModel.statusCode == 100
        ? onSuccess()
        : onFailure(uploadImageModel.description);
  }

  savePasswordUpdate(Function onSuccess, Function onFailure) async {
    _resetPasswordErrorMessages();
    if (_currentPasswordController.text.trim().isEmpty ||
        _newPasswordController.text.trim().isEmpty ||
        _confirmPasswordController.text.trim().isEmpty) {
      if (_currentPasswordController.text.trim().isEmpty)
        _currentPasswordErrorMessage = kEmptyFieldErrorMessage;
      if (_newPasswordController.text.trim().isEmpty)
        _newPasswordErrorMessage = kEmptyFieldErrorMessage;
      if (_confirmPasswordController.text.trim().isEmpty)
        _confirmPasswordErrorMessage = kEmptyFieldErrorMessage;
      return;
    }
    load(true);
    MainApiModel profileUpdateModel =
        await _merchantRepo.changeCorporatePassword(
            _currentPasswordController.text.trim(),
            _newPasswordController.text.trim(),
            _confirmPasswordController.text.trim());
    load(false);
    profileUpdateModel.statusCode == 100
        ? onSuccess()
        : onFailure(profileUpdateModel.description);
  }
}

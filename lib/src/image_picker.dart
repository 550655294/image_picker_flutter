import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker_flutter/src/model/asset_data.dart';
import 'package:image_picker_flutter/src/page/mul_image_picker_page.dart';
import 'package:image_picker_flutter/src/page/single_image_picker_page.dart';
import 'package:image_picker_flutter/src/utils.dart';

typedef MulCallback = void Function(List<AssetData>);

typedef SingleCallback = void Function(AssetData);

typedef Callback = void Function(AssetData);

class ImagePicker {
  ImagePicker._();

  static debug(bool isDebug) {
    Utils.isDebug = isDebug;
  }

  ///单选图片
  static void singlePicker(BuildContext context,
      {ImagePickerType type = ImagePickerType.imageAndVideo,
      Language language,
      ImageProvider placeholder,
      Widget back,
      Decoration decoration,
      Color appBarColor = Colors.blue,
      Widget emptyView,
      SingleCallback singleCallback,
      bool useRootNavigator = true}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SingleImagePickerPage(
          type: type,
          language: language ?? Language(),
          placeholder: placeholder,
          decoration: decoration,
          appBarColor: appBarColor ?? Colors.blue,
          back: back,
          emptyView: emptyView,
          useRootNavigator: useRootNavigator,
        ),
      ),
    )..then((data) {
        if (data != null && singleCallback != null) {
          singleCallback(data);
        }
      });
  }

  ///多选图片
  static void mulPicker(BuildContext context,
      {List<AssetData> data,
      ImagePickerType type = ImagePickerType.imageAndVideo,
      int limit = 9,
      Language language,
      ImageProvider placeholder,
      Widget back,
      Widget menu,
      Decoration decoration,
      Color appBarColor = Colors.blue,
      Widget emptyView,
      MulCallback mulCallback,
      bool useRootNavigator = true}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MulImagePickerPage(
          selectedData: data,
          type: type,
          limit: limit,
          appBarColor: appBarColor ?? Colors.blue,
          language: language ?? Language(),
          placeholder: placeholder,
          decoration: decoration,
          menu: menu,
          back: back,
          emptyView: emptyView,
          useRootNavigator: useRootNavigator,
        ),
      ),
    )..then((data) {
        if (data != null && mulCallback != null) {
          mulCallback(data);
        }
      });
  }

  ///拍照返回图片路径
  static void takePicture(Callback callback) {
    Utils.takePicture().then((a) {
      callback(a);
    });
  }

  ///录像返回图片路径
  static void takeVideo(Callback callback) {
    Utils.takeVideo().then((a) {
      callback(a);
    });
  }
}

enum ImagePickerType {
  onlyImage,
  onlyVideo,
  imageAndVideo,
}

///文字基类
class Language {
  String get showToast => "Only ### images can be selected";

  String get empty => "Empty";
}

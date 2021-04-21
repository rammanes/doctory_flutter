

class Specialist{
  List<SpecialistItem> _specialist=[];
  Specialist.fromJson(Map<String, dynamic> parsedJson){
    List<SpecialistItem> temp= [];
    for(int i=0 ; i< parsedJson['data'].length; i++) {
      SpecialistItem specialistItem =SpecialistItem(parsedJson['data'][i]);
      temp.add(specialistItem);
    }
    _specialist = temp;
  }
  List<SpecialistItem> get specialist=> _specialist;
}
class SpecialistItem {

  String _name;
  Avatar _avatar;
  SpecialistItem(specialist){
    _name= specialist["name"];
    _avatar= Avatar(specialist["avatar"]);
  }

  String get name => _name;
  Avatar get avatar => _avatar;

}
class Avatar {
  int _id;
  AvatarData _data;

  Avatar(avatar){
    _id = avatar["id"];
    _data= AvatarData(avatar["data"]);
  }
  int get id=> _id;
  AvatarData get data => _data;


}
class AvatarData{
  String _url;
  String _asset_url;
  String _full_url;
  List<ThumbnailData> _thumbnails;
  AvatarData(avatarData){
    _url = avatarData["url"];
    _asset_url= avatarData["asset_url"];
    _full_url= avatarData["full_url"];
    List<ThumbnailData> thumbnail= [];
    for(int i=0; i< avatarData["thumbnails"].length; i++){
      ThumbnailData thumbnailData= ThumbnailData(avatarData["thumbnails"][i]);
      thumbnail.add(thumbnailData);
    }
    _thumbnails = thumbnail;
  }
  String get url => _url;
  String get asset_url =>  _asset_url;
  String get full_url => _full_url;
  List<ThumbnailData> get thumbnail => _thumbnails;

}
class ThumbnailData{
  String _url;
  int _width;
  int _height;

  ThumbnailData(thumbnail){
    _url= thumbnail["url"];
    _width= thumbnail["width"];
    _height= thumbnail["height"];
  }

  String get url=> _url;
  int get width => _width;
  int get height => _height;

}
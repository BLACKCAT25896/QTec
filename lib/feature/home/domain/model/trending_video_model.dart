class TrendingVideoModel {
  Links? links;
  int? total;
  int? page;
  int? pageSize;
  List<Results>? results;

  TrendingVideoModel(
      {this.links, this.total, this.page, this.pageSize, this.results});

  TrendingVideoModel.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    total = json['total'];
    page = json['page'];
    pageSize = json['page_size'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }


}

class Links {
  int? next;

  Links({this.next});

  Links.fromJson(Map<String, dynamic> json) {
    next = json['next'];
  }

}

class Results {
  String? thumbnail;
  int? id;
  String? title;
  String? dateAndTime;
  String? slug;
  String? createdAt;
  String? manifest;
  int? liveStatus;
  String? liveManifest;
  bool? isLive;
  String? channelImage;
  String? channelName;
  String? channelUsername;
  bool? isVerified;
  String? channelSlug;
  String? channelSubscriber;
  int? channelId;
  String? type;
  String? viewers;
  String? duration;
  String? objectType;

  Results(
      {this.thumbnail,
        this.id,
        this.title,
        this.dateAndTime,
        this.slug,
        this.createdAt,
        this.manifest,
        this.liveStatus,
        this.liveManifest,
        this.isLive,
        this.channelImage,
        this.channelName,
        this.channelUsername,
        this.isVerified,
        this.channelSlug,
        this.channelSubscriber,
        this.channelId,
        this.type,
        this.viewers,
        this.duration,
        this.objectType});

  Results.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    id = json['id'];
    title = json['title'];
    dateAndTime = json['date_and_time'];
    slug = json['slug'];
    createdAt = json['created_at'];
    manifest = json['manifest'];
    liveStatus = json['live_status'];
    liveManifest = json['live_manifest'];
    isLive = json['is_live'];
    channelImage = json['channel_image'];
    channelName = json['channel_name'];
    channelUsername = json['channel_username'];
    isVerified = json['is_verified'];
    channelSlug = json['channel_slug'];
    channelSubscriber = json['channel_subscriber'];
    channelId = json['channel_id'];
    type = json['type'];
    viewers = json['viewers'];
    duration = json['duration'];
    objectType = json['object_type'];
  }

}

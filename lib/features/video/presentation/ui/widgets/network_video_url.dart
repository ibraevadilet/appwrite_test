import 'package:cars_appwrite/core/constants/text_constants.dart';

String videoLocalUrl(String videoID) {
  return '${AppTextConstants.endpoint}/storage/buckets/${AppTextConstants.bucketID}/files/$videoID/view?project=${AppTextConstants.projectId}';
}

import 'package:hive/hive.dart';
part 'example2_model.g.dart';

@HiveType(typeId: 0)
class Example2Model extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;

  Example2Model({
    required this.title,
    required this.description,
  });
}

import 'package:hive/hive.dart';
import '../hive_models/example2_model.dart';

class Boxes {
  static Box<Example2Model> getData() => Hive.box<Example2Model>('notes');
}
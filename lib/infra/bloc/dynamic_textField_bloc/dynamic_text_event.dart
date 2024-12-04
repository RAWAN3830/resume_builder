abstract class DynamicTextFieldsEvent {}

class AddFieldEvent extends DynamicTextFieldsEvent {}

class RemoveFieldEvent extends DynamicTextFieldsEvent {
  final int index;

  RemoveFieldEvent(this.index);
}

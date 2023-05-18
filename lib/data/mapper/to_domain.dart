import 'package:bbs/application/extensions/extensions.dart';
import 'package:bbs/data/models/customer_model.dart';
import 'package:bbs/domain/entity/customer_entity.dart';

extension CustomerModelToDomain on CustomerModel {
  CustomerEntity toDomain() => CustomerEntity(
        id: id.orNull(),
        name: name.orNull(),
        email: email.orNull(),
        currentBalance: currentBalance.orNull(),
      );
}

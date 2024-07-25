import 'package:bab_el_ezz/data/customer.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';

class CustomersOps {
  static final CustomersOps _instance = CustomersOps._internal();
  late FirebaseCollection firebaseCollection;

  factory CustomersOps() {
    return _instance;
  }

  CustomersOps._internal() {
    firebaseCollection = FirebaseCollection();
  }

  Future addCustomer(Customer customer) {
    return firebaseCollection.customerCol.add(customer);
  }
}

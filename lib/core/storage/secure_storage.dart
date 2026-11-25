import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage<T> {
  final FlutterSecureStorage _storage;

  SecureStorage(this._storage);

  Future<void> save(String key, String value) async {  
   await  _storage.write(key: key, value: value);
  } 

  Future<void> remove(String key, dynamic value) async {  
   await  _storage.delete(key: key);
  } 

  Future<T?> get(String key) async {
    final data = await _storage.read(key: key);
    return data as T;
  }
}
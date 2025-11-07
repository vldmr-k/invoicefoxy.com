import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:invoicefoxy_all/app/models/item.dart';
import 'package:pocketbase/pocketbase.dart';

void main() {
  group('ItemTypeConverter', () {
    const converter = ItemTypeConverter();

    test('should convert string "hour" to ItemType.hour', () {
      expect(converter.fromJson('hour'), equals(ItemType.hour));
      expect(converter.fromJson('HOUR'), equals(ItemType.hour));
      expect(converter.fromJson('Hour'), equals(ItemType.hour));
    });

    test('should convert string "day" to ItemType.day', () {
      expect(converter.fromJson('day'), equals(ItemType.day));
      expect(converter.fromJson('DAY'), equals(ItemType.day));
      expect(converter.fromJson('Day'), equals(ItemType.day));
    });

    test('should convert string "unit" to ItemType.unit', () {
      expect(converter.fromJson('unit'), equals(ItemType.unit));
      expect(converter.fromJson('UNIT'), equals(ItemType.unit));
      expect(converter.fromJson('Unit'), equals(ItemType.unit));
    });

    test('should convert empty string to ItemType.none', () {
      expect(converter.fromJson(''), equals(ItemType.none));
    });

    test('should convert string "none" to ItemType.none', () {
      expect(converter.fromJson('none'), equals(ItemType.none));
      expect(converter.fromJson('NONE'), equals(ItemType.none));
      expect(converter.fromJson('None'), equals(ItemType.none));
    });

    test('should convert unknown string to ItemType.none', () {
      expect(converter.fromJson('unknown'), equals(ItemType.none));
      expect(converter.fromJson('invalid'), equals(ItemType.none));
      expect(converter.fromJson('random'), equals(ItemType.none));
    });

    test('should convert ItemType.hour to string "hour"', () {
      expect(converter.toJson(ItemType.hour), equals('hour'));
    });

    test('should convert ItemType.day to string "day"', () {
      expect(converter.toJson(ItemType.day), equals('day'));
    });

    test('should convert ItemType.unit to string "unit"', () {
      expect(converter.toJson(ItemType.unit), equals('unit'));
    });

    test('should convert ItemType.none to empty string', () {
      expect(converter.toJson(ItemType.none), equals(''));
    });
  });

  group('Item', () {
    test('should create Item with default values', () {
      final item = Item();

      expect(item.name, equals(''));
      expect(item.description, equals(''));
      expect(item.company, equals(''));
      expect(item.createdby, equals(''));
      expect(item.type, equals(ItemType.none));
      expect(item.price, equals(0));
      expect(item.taxable, equals(false));
      expect(item.totalAmount, equals(0));
      expect(item.totalSold, equals(0));
    });

    test('should create Item with custom values', () {
      final item = Item(
        name: 'Test Item',
        description: 'Test Description',
        company: 'Test Company',
        createdby: 'user123',
        type: ItemType.hour,
        price: 100,
        taxable: true,
        totalAmount: 1000,
        totalSold: 5,
      );

      expect(item.name, equals('Test Item'));
      expect(item.description, equals('Test Description'));
      expect(item.company, equals('Test Company'));
      expect(item.createdby, equals('user123'));
      expect(item.type, equals(ItemType.hour));
      expect(item.price, equals(100));
      expect(item.taxable, equals(true));
      expect(item.totalAmount, equals(1000));
      expect(item.totalSold, equals(5));
    });

    test('should have correct storage key', () {
      final item = Item();
      expect(Item.key, equals('items'));
    });
  });

  group('Item JSON Serialization', () {
    test('should serialize Item to JSON', () {
      final item = Item(
        name: 'Consulting Service',
        description: 'Professional consulting',
        company: 'Tech Corp',
        createdby: 'admin123',
        type: ItemType.hour,
        price: 150,
        taxable: true,
        totalAmount: 1500,
        totalSold: 10,
      );

      final json = item.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['name'], equals('Consulting Service'));
      expect(json['description'], equals('Professional consulting'));
      expect(json['company'], equals('Tech Corp'));
      expect(json['createdby'], equals('admin123'));
      expect(json['type'], equals('hour'));
      expect(json['price'], equals(150));
      expect(json['taxable'], equals(true));
      expect(json['total_amount'], equals(1500));
      expect(json['total_sold'], equals(10));
    });

    test('should deserialize JSON to Item', () {
      final json = {
        'name': 'Development Service',
        'description': 'Software development',
        'company': 'Dev Corp',
        'createdby': 'dev123',
        'type': 'day',
        'price': '500',
        'taxable': false,
        'total_amount': '5000',
        'total_sold': '8',
      };

      final item = Item.fromJson(json);

      expect(item.name, equals('Development Service'));
      expect(item.description, equals('Software development'));
      expect(item.company, equals('Dev Corp'));
      expect(item.createdby, equals('dev123'));
      expect(item.type, equals(ItemType.day));
      expect(item.price, equals(500));
      expect(item.taxable, equals(false));
      expect(item.totalAmount, equals(5000));
      expect(item.totalSold, equals(8));
    });

    test('should handle JSON with string numbers for price, total_amount, and total_sold', () {
      final json = {
        'name': 'Test Item',
        'description': 'Test',
        'company': 'Test Corp',
        'createdby': 'test123',
        'type': 'unit',
        'price': '250',
        'taxable': true,
        'total_amount': '2500',
        'total_sold': '15',
      };

      final item = Item.fromJson(json);

      expect(item.price, equals(250));
      expect(item.totalAmount, equals(2500));
      expect(item.totalSold, equals(15));
    });

    test('should handle JSON with missing fields using defaults', () {
      final json = {
        'name': 'Minimal Item',
      };

      final item = Item.fromJson(json);

      expect(item.name, equals('Minimal Item'));
      expect(item.description, equals(''));
      expect(item.company, equals(''));
      expect(item.createdby, equals(''));
      expect(item.type, equals(ItemType.none));
      expect(item.price, equals(0));
      expect(item.taxable, equals(false));
      expect(item.totalAmount, equals(0));
      expect(item.totalSold, equals(0));
    });

    test('should handle JSON with null numeric fields', () {
      final json = {
        'name': 'Item with nulls',
        'price': null,
        'total_amount': null,
        'total_sold': null,
      };

      final item = Item.fromJson(json);

      expect(item.price, equals(0));
      expect(item.totalAmount, equals(0));
      expect(item.totalSold, equals(0));
    });

    test('should handle JSON with empty type', () {
      final json = {
        'name': 'Item with empty type',
        'type': '',
        'price': '100',
        'total_amount': '1000',
        'total_sold': '5',
      };

      final item = Item.fromJson(json);

      expect(item.type, equals(ItemType.none));
      expect(item.price, equals(100));
      expect(item.totalAmount, equals(1000));
      expect(item.totalSold, equals(5));
    });
  });

  group('Item.fromRecord', () {
    test('should create Item from RecordModel', () {
      // Create a mock RecordModel-like data
      final recordData = {
        'id': 'rec_123',
        'collectionId': 'items',
        'collectionName': 'items',
        'created': '2024-01-01T00:00:00.000Z',
        'updated': '2024-01-01T00:00:00.000Z',
        'name': 'Record Item',
        'description': 'From record',
        'company': 'Record Corp',
        'createdby': 'record_user',
        'type': 'hour',
        'price': '200',
        'taxable': true,
        'total_amount': '2000',
        'total_sold': '20',
      };

      // Mock RecordModel behavior
      final record = RecordModel.fromJson(recordData);
      final item = Item.fromRecord(record);

      expect(item.name, equals('Record Item'));
      expect(item.description, equals('From record'));
      expect(item.company, equals('Record Corp'));
      expect(item.createdby, equals('record_user'));
      expect(item.type, equals(ItemType.hour));
      expect(item.price, equals(200));
      expect(item.taxable, equals(true));
      expect(item.totalAmount, equals(2000));
      expect(item.totalSold, equals(20));
    });
  });

  group('Item Edge Cases', () {
    test('should handle zero values correctly', () {
      final item = Item(
        name: 'Free Item',
        price: 0,
        totalAmount: 0,
        totalSold: 0,
      );

      expect(item.price, equals(0));
      expect(item.totalAmount, equals(0));
      expect(item.totalSold, equals(0));

      final json = item.toJson();
      expect(json['price'], equals(0));
      expect(json['total_amount'], equals(0));
      expect(json['total_sold'], equals(0));
    });

    test('should handle large numbers correctly', () {
      final item = Item(
        name: 'Expensive Item',
        price: 100,
        totalAmount: 999999999,
        totalSold: 9999,
      );

      expect(item.price, equals(10000));
      expect(item.totalAmount, equals(999999999));
      expect(item.totalSold, equals(9999));
    });

    test('should handle special characters in strings', () {
      final json = {
        'name': 'Item with special chars: !@#\$%^&*()',
        'description': 'Description with emojis: 🚀✨',
        'company': 'Company with unicode: 你好世界',
        'type': 'unit',
        'price': '100',
        'taxable': false,
        'total_amount': '1000',
        'total_sold': '10',
      };

      final item = Item.fromJson(json);

      expect(item.name, equals('Item with special chars: !@#\$%^&*()'));
      expect(item.description, equals('Description with emojis: 🚀✨'));
      expect(item.company, equals('Company with unicode: 你好世界'));
    });
  });
}
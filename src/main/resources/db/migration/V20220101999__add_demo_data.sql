INSERT INTO departments(id, name, name_kana, parent_department_id, manager_id, sub_manager_id)  VALUES
  (1, 'サッカー部', 'サッカーブ', null, 4, 5),
  (2, '幽霊部', 'ユウレイブ', null, null, null),
  (3, '卓球部', 'タッキュウブ', 1, 7, null)
;

INSERT INTO roles(id, general_flg, manager_flg, admin_flg) VALUES
  (1, true, true, true),
  (2, false, true, true),
  (3, false, false, true),
  (4, true, true, false),
  (5, true, true, false),
  (6, true, false, false),
  (7, true, true, false),
  (8, true, false, false)
;

-- passwordの平文は"password"
INSERT INTO employees(id, number, login_id, last_name, first_name, last_name_kana, first_name_kana, password, position, department_id, role_id, birthday, retirement_flg) VALUES
  (1, '0210000', 'admin_a', '管理者', 'A', 'カンリシャ', 'エー', '$2a$10$BVugqASEdKPIIiOOPQEkXONl9N7kAyKLEpMd8mjPpMUKK2zRgxcfq', null, null, 1, null, false),
  (2, '0210001', 'admin_b', '管理者', 'B', 'カンリシャ', 'ビー', '$2a$10$BVugqASEdKPIIiOOPQEkXONl9N7kAyKLEpMd8mjPpMUKK2zRgxcfq', null, null, 2, null, false),
  (3, '0210002', 'admin_c', '管理者', 'C', 'カンリシャ', 'シー', '$2a$10$BVugqASEdKPIIiOOPQEkXONl9N7kAyKLEpMd8mjPpMUKK2zRgxcfq', null, null, 3, null, false),
  (4, '0210101', 'user101', '山田', '太郎', 'ヤマダ', 'タロウ', '$2a$10$BVugqASEdKPIIiOOPQEkXONl9N7kAyKLEpMd8mjPpMUKK2zRgxcfq', null, 3, 4, '1983/2/28', false),
  (5, '0210102', 'user102', '山田', '治郎', 'ヤマダ', 'ジロウ', '$2a$10$BVugqASEdKPIIiOOPQEkXONl9N7kAyKLEpMd8mjPpMUKK2zRgxcfq', null, 3, 5, '1971/7/30', false),
  (6, '0210103', 'user103', '山田', '左武郎', 'ヤマダ', 'サブロウ', '$2a$10$BVugqASEdKPIIiOOPQEkXONl9N7kAyKLEpMd8mjPpMUKK2zRgxcfq', null, 3, 6, '2000/1/14', false),
  (7, '0210104', 'user104', '山田', '士郎', 'ヤマダ', 'シロウ', '$2a$10$BVugqASEdKPIIiOOPQEkXONl9N7kAyKLEpMd8mjPpMUKK2zRgxcfq', null, 2, 7, null, false),
  (8, '0210105', 'user105', '山田', '吾郎', 'ヤマダ', 'ゴロウ', '$2a$10$BVugqASEdKPIIiOOPQEkXONl9N7kAyKLEpMd8mjPpMUKK2zRgxcfq', null, null, 8, '1986/3/31', false)
;

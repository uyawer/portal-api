-- Project Name : temportal
-- Date/Time    : 2022/05/09 15:53:06
-- Author       : uyawer
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

/*
  << 注意！！ >>
  BackupToTempTable, RestoreFromTempTable疑似命令が付加されています。
  これにより、drop table, create table 後もデータが残ります。
  この機能は一時的に $$TableName のような一時テーブルを作成します。
  この機能は A5:SQL Mk-2でのみ有効であることに注意してください。
*/

-- 予定
--* RestoreFromTempTable
CREATE TABLE schedules (
  id bigserial NOT NULL
  , title character varying NOT NULL
  , details character varying
  , type integer NOT NULL
  , start_at timestamp NOT NULL
  , end_at timestamp
  , all_day_flg BOOLEAN DEFAULT false NOT NULL
  , repeat_interval_type character varying
  , repeat_week_day character varying
  , repeat_month_day integer
  , repeat_count integer
  , repeat_end_date timestamp
  , employee_ids character varying
  , place character varying
  , created_employee_id bigint NOT NULL
  , updated_employee_id bigint NOT NULL
  , created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
  , updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
  , delete_flg BOOLEAN DEFAULT false NOT NULL
  , CONSTRAINT schedules_PKC PRIMARY KEY (id)
) ;

CREATE UNIQUE INDEX "IDX_タイトル"
  ON schedules(title);

-- 権限
--* RestoreFromTempTable
CREATE TABLE roles (
  id bigserial NOT NULL
  , general_flg BOOLEAN DEFAULT false NOT NULL
  , manager_flg BOOLEAN DEFAULT false NOT NULL
  , admin_flg BOOLEAN DEFAULT false NOT NULL
  , created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
  , updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
  , delete_flg BOOLEAN DEFAULT false NOT NULL
  , CONSTRAINT roles_PKC PRIMARY KEY (id)
) ;

-- 部署
--* RestoreFromTempTable
CREATE TABLE departments (
  id bigserial NOT NULL
  , name character varying NOT NULL
  , name_kana character varying
  , parent_department_id bigint
  , manager_id bigint
  , sub_manager_id bigint
  , created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
  , updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
  , delete_flg BOOLEAN DEFAULT false NOT NULL
  , CONSTRAINT departments_PKC PRIMARY KEY (id)
) ;

CREATE UNIQUE INDEX "IDX_部署名"
  ON departments(name);

CREATE UNIQUE INDEX "IDX_部署名カナ"
  ON departments(name_kana);

-- 従業員
--* RestoreFromTempTable
CREATE TABLE employees (
  id bigserial NOT NULL
  , number character varying NOT NULL UNIQUE
  , login_id character varying NOT NULL UNIQUE
  , last_name character varying NOT NULL
  , first_name character varying NOT NULL
  , last_name_kana character varying NOT NULL
  , first_name_kana character varying NOT NULL
  , password character varying(60) NOT NULL
  , password_reset_flg BOOLEAN DEFAULT false NOT NULL
  , position character varying
  , department_id bigint REFERENCES departments(id)
  , role_id bigint NOT NULL REFERENCES roles(id)
  , birthday date
  , sex integer
  , blood integer
  , birthplace character varying
  , biography character varying
  , retirement_flg BOOLEAN DEFAULT false NOT NULL
  , created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
  , updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
  , delete_flg BOOLEAN DEFAULT false NOT NULL
  , CONSTRAINT employees_PKC PRIMARY KEY (id)
) ;

CREATE UNIQUE INDEX "IDX_社員番号"
  ON employees(number);

CREATE UNIQUE INDEX "IDX_社員コード"
  ON employees(login_id);

COMMENT ON TABLE schedules IS '予定';
COMMENT ON COLUMN schedules.id IS 'ID';
COMMENT ON COLUMN schedules.title IS 'タイトル';
COMMENT ON COLUMN schedules.details IS '詳細';
COMMENT ON COLUMN schedules.type IS '区分';
COMMENT ON COLUMN schedules.start_at IS '開始日時';
COMMENT ON COLUMN schedules.end_at IS '終了日時';
COMMENT ON COLUMN schedules.all_day_flg IS '終日フラグ';
COMMENT ON COLUMN schedules.repeat_interval_type IS '繰り返し間隔:day, week, month, yearのいずれか';
COMMENT ON COLUMN schedules.repeat_week_day IS '繰り返し曜日:0(日)～6(土)までのカンマ区切り';
COMMENT ON COLUMN schedules.repeat_month_day IS '繰り返し月日';
COMMENT ON COLUMN schedules.repeat_count IS '繰り返し回数';
COMMENT ON COLUMN schedules.repeat_end_date IS '繰り返し終了日';
COMMENT ON COLUMN schedules.employee_ids IS '参加者IDs:従業員.IDのカンマ区切り';
COMMENT ON COLUMN schedules.place IS '場所:会議室.IDもしくは{;文字列}';
COMMENT ON COLUMN schedules.created_employee_id IS '作成者ID:従業員.ID';
COMMENT ON COLUMN schedules.updated_employee_id IS '更新者ID:従業員.ID';
COMMENT ON COLUMN schedules.created_at IS '作成日時';
COMMENT ON COLUMN schedules.updated_at IS '更新日時';
COMMENT ON COLUMN schedules.delete_flg IS '削除フラグ';

COMMENT ON TABLE roles IS '権限';
COMMENT ON COLUMN roles.id IS 'ID';
COMMENT ON COLUMN roles.general_flg IS '一般フラグ';
COMMENT ON COLUMN roles.manager_flg IS 'マネージャーフラグ';
COMMENT ON COLUMN roles.admin_flg IS '管理者フラグ';
COMMENT ON COLUMN roles.created_at IS '作成日時';
COMMENT ON COLUMN roles.updated_at IS '更新日時';
COMMENT ON COLUMN roles.delete_flg IS '削除フラグ';

COMMENT ON TABLE departments IS '部署';
COMMENT ON COLUMN departments.id IS 'ID';
COMMENT ON COLUMN departments.name IS '部署名';
COMMENT ON COLUMN departments.name_kana IS '部署名カナ';
COMMENT ON COLUMN departments.parent_department_id IS '親部署ID';
COMMENT ON COLUMN departments.manager_id IS 'マネージャーID:従業員.ID';
COMMENT ON COLUMN departments.sub_manager_id IS 'サブマネージャーID:従業員.ID';
COMMENT ON COLUMN departments.created_at IS '作成日時';
COMMENT ON COLUMN departments.updated_at IS '更新日時';
COMMENT ON COLUMN departments.delete_flg IS '削除フラグ';

COMMENT ON TABLE employees IS '従業員';
COMMENT ON COLUMN employees.id IS 'ID';
COMMENT ON COLUMN employees.number IS '社員番号';
COMMENT ON COLUMN employees.login_id IS 'ログインID';
COMMENT ON COLUMN employees.last_name IS '性';
COMMENT ON COLUMN employees.first_name IS '名';
COMMENT ON COLUMN employees.last_name_kana IS '性カナ';
COMMENT ON COLUMN employees.first_name_kana IS '名カナ';
COMMENT ON COLUMN employees.password IS 'パスワード';
COMMENT ON COLUMN employees.password_reset_flg IS 'パスワードリセットフラグ';
COMMENT ON COLUMN employees.position IS '役職';
COMMENT ON COLUMN employees.department_id IS '部署ID';
COMMENT ON COLUMN employees.role_id IS '権限ID';
COMMENT ON COLUMN employees.birthday IS '生年月日';
COMMENT ON COLUMN employees.sex IS '性別';
COMMENT ON COLUMN employees.blood IS '血液型';
COMMENT ON COLUMN employees.birthplace IS '出身地';
COMMENT ON COLUMN employees.biography IS '自己紹介';
COMMENT ON COLUMN employees.retirement_flg IS '退職フラグ';
COMMENT ON COLUMN employees.created_at IS '作成日時';
COMMENT ON COLUMN employees.updated_at IS '更新日時';
COMMENT ON COLUMN employees.delete_flg IS '削除フラグ';


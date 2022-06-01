CREATE TRIGGER trg_departments_updated_at BEFORE UPDATE ON departments FOR EACH ROW EXECUTE PROCEDURE set_updated_at();
CREATE TRIGGER trg_employees_updated_at BEFORE UPDATE ON employees FOR EACH ROW EXECUTE PROCEDURE set_updated_at();
CREATE TRIGGER trg_roles_updated_at BEFORE UPDATE ON roles FOR EACH ROW EXECUTE PROCEDURE set_updated_at();
CREATE TRIGGER trg_schedules_updated_at BEFORE UPDATE ON schedules FOR EACH ROW EXECUTE PROCEDURE set_updated_at();
-- ������������ ������� �� ���� ��������� ��������� � �������, ��������"

-- 1 �������� �������� ������� hello(), ������� ����� ���������� �����������, � ����������� �� �������� ������� �����. 
-- � 6:00 �� 12:00 ������� ������ ���������� ����� "������ ����", � 12:00 �� 18:00 ������� ������ ���������� ����� "������ ����", 
-- � 18:00 �� 00:00 � "������ �����", � 00:00 �� 6:00 � "������ ����".

DELIMITER //

DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello() RETURNS TEXT DETERMINISTIC
BEGIN
  RETURN CASE
      WHEN "06:00" <= CURTIME() AND CURTIME() < "12:00" THEN "������ ����"
      WHEN "12:00" <= CURTIME() AND CURTIME() < "18:00" THEN "������ ����"
      WHEN "18:00" <= CURTIME() AND CURTIME() < "00:00" THEN "������ �����"
      ELSE "������ ����"
    END;
END //

DELIMITER ;

-- 2 � ������� products ���� ��� ��������� ����: name � ��������� ������ � description � ��� ���������. 
-- ��������� ����������� ����� ����� ��� ���� �� ���. ��������, ����� ��� ���� ��������� �������������� �������� NULL �����������.
-- ��������� ��������, ��������� ����, ����� ���� �� ���� ����� ��� ��� ���� ���� ���������. 
-- ��� ������� ��������� ����� NULL-�������� ���������� �������� ��������.

DELIMITER //

CREATE TRIGGER trigger_my BEFORE INSERT ON products FOR EACH ROW
BEGIN
  IF NEW.name IS NULL AND NEW.description IS NULL
    THEN SIGNAL sqlstate '45001' set message_text = "products name or description can not be NULL"; 
  end if;
END; //
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;

procedure Exemple_Octet is
	type T_Octet is mod 2 ** 8;	-- sur 8 bits

	Octet : T_Octet;
	Bit   : T_Octet;
begin
	Octet := 146;

	-- Afficher un entier en base 2.
	-- Ici on convertit Octet en Integer pour pouvoir utiliser Put de Integer_Text_IO.
	Put(Integer(Octet), 1);
	Put(" en binaire : ");
	Put(Integer(Octet), Base => 2);
	New_Line;

	-- Retrouver les bits d'un octet
	Octet := 146;                     -- 10010010
	Bit := Octet / 128;
	pragma Assert (1 = Bit);
	Octet := (Octet * 2);             -- 00100100
	Bit := Octet / 128;
	pragma assert (0 = Bit);

	-- Afficher les bits d'un octet
	Octet := 146;
	Put(Integer(Octet), 1);
	Put(" en binaire (en retrouvant les bits 1 à 1) : ");
	for N in 1..8 loop
		Bit := Octet / 128;
		Put(Integer(Bit), 1);
		Octet := Octet * 2;
	end loop;
	New_Line;

	-- Reconstruire un octet à partir de ses 8 bits
	Octet := 0;                 Put(Integer(Octet), 12, Base => 2);  New_Line;  -- 00000000
	Octet := (Octet * 2) or 1;  Put(Integer(Octet), 12, Base => 2);  New_Line;  -- 00000001
	Octet := (Octet * 2) or 0;  Put(Integer(Octet), 12, Base => 2);  New_Line;  -- 00000010
	Octet := (Octet * 2) or 0;  Put(Integer(Octet), 12, Base => 2);  New_Line;  -- 00000100
	Octet := (Octet * 2) or 1;  Put(Integer(Octet), 12, Base => 2);  New_Line;  -- 00001001
	Octet := (Octet * 2) or 0;  Put(Integer(Octet), 12, Base => 2);  New_Line;  -- 00010010
	Octet := (Octet * 2) or 0;  Put(Integer(Octet), 12, Base => 2);  New_Line;  -- 00100100
	Octet := (Octet * 2) or 1;  Put(Integer(Octet), 12, Base => 2);  New_Line;  -- 01001001
	Octet := (Octet * 2) or 0;  Put(Integer(Octet), 12, Base => 2);  New_Line;  -- 10010010
	pragma Assert (Octet = 146);

	-- Pas d'exception en cas de dépassement de capacité
	Octet := 255;
	Octet := Octet + 1;
	pragma assert (Octet = 0);

end Exemple_Octet;

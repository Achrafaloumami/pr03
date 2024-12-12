with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Module; use Module;


procedure Compresser is
    type T_Octet is mod 2 ** 8;	-- sur 8 bits
    for T_Octet'Size use 8;
    type T_tab_Octet is array(1..100) of T_Octet;



    File_Name : String :=  "exemple_fichier.out";
    File      : Ada.Streams.Stream_IO.File_Type;	-- car il y a aussi Ada.Text_IO.File_Type
    S         : Stream_Access;
    Octet     : T_Octet;
    Text : constant String := "voici notre texte";
    tab : T_tab_Octet;
    i : Integer;
    Arbre : T_Arbre_Huffman;
    tab_Huff : T_LCA;
    Code : Integer;
    tab_freq : T_LCA;



begin
	Create (File, Out_File, File_Name);
	S := Stream (File);
	for ch of Text loop
		Character'Write(S, Ch);
	end loop;
    Close (File);

    Open(File, In_File, File_Name);
    S := Stream(File);
    i := 1;
	while not End_Of_File(File) loop
        Octet := T_Octet'Input(S);

        tab(i) := Octet;
        Put("Octet = " & T_Octet'Image(Octet));
        Put(" '" & Character'Val(Octet) & "'");
        i := i + 1;
        New_Line;
	end loop;

    Close (File);

    for i in Text'Range loop
        Put(tab(i)'Image);
    end loop;
    tab(Text'Last + 1) := -1;
    Put(tab(Text'Last + 1)'Image);


    initialiser(Arbre);
    initialiser(tab_Huff);
    Tableau_Freq(tab, tab_freq);
    Tableau_Huff(Tab_freq, tab_Huff);
    Construire_arbre(Arbre, Tab_Huff);


    Code := Code_arbre(Arbre);
    afficher(Arbre);




    Create (File, Out_File, File_Name);

	--   Ã‰crire dans le fichier via un Stream
	--   (on pourrait Ã©crire des donnÃ©es de type diffÃ©rents)
	S := Stream (File);
	for ch of Text loop
		Character'Write(S, Ch);
	end loop;

	--   Fermer le fichier
	Close (File);








end Compresser;

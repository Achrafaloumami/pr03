with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with LCA;


procedure LCA_sujet is

    package Lca_Unbounded_Str_Int is
        new LCA(T_Cle => Unbounded_String, T_Valeur => Integer);
    use Lca_Unbounded_Str_Int;


    procedure Afficher_Cle(Cle: Unbounded_String) is
    begin
        Put("""");
        Put(To_String(Cle));
        Put("""");
    end;

    procedure Afficher_Donnee(Valeur:Integer) is
    begin
        Put(Integer'Image(Valeur));
    end;

    procedure Afficher_SDA is
            new Afficher_Debug (Afficher_Cle , Afficher_Donnee);


    Sda_exemple:T_LCA;

begin
     Initialiser(Sda_exemple);
     Enregistrer (Sda_exemple, To_Unbounded_String("un"), 1 );
     Enregistrer (Sda_exemple, To_Unbounded_String("deux"), 2 );
     Afficher_SDA (Sda_exemple);
     Detruire(Sda_exemple);
end;

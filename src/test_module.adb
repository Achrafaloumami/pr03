with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Module; use Module;

procedure Test_Module is

    procedure Afficher_Symbole(Symbole: in Unbounded_String) is
    begin
        Put_Line(" '" & To_String(Symbole) & "'");
    end Afficher_Symbole;

    procedure Afficher_Frequence(Frequence: in Integer) is
    begin
        Put(Integer'Image(Frequence));
    end Afficher_Frequence;

    -- Afficher une arbre de Huffman
    -- parametres:
    --      Arbre: l'arbre à afficher
    procedure Afficher_Arbre_Huffman(Arbre: in T_Arbre_Huffman; Niveau: in  Integer) is
        Indentation_Gauche: Integer ;
        Indentation_Droite: Integer ;
    begin

        -- Afficher la fréquence au niveau actuel
        Put("(");
        Afficher_Frequence(Frequence(Arbre));
        Put(")");

        -- Si c'est une feuille, afficher le symbole
        if Est_feuille(Arbre) then
            Afficher_Symbole(Symbole(Arbre));
        else
            -- Parcourir les sous-arbres gauche et droit
            New_Line;
            -- Afficher le sous arbre gauche
            for i in 1..Niveau loop
                  Put(" |     ");
            end loop;
            Put(" \--0--");
            Indentation_Gauche := Niveau + 1; -- Ajout de l'indentation pour le sous-arbre gauche
            Afficher_Arbre_Huffman(Arbre_gauche(Arbre), Indentation_Gauche);

            New_Line;
            -- Afficher le sous-arbre droit
            for i in 1..Niveau loop
                 Put(" |---- ");
            end loop;
            Put(" \--1--");
            Indentation_Droite := Niveau + 1; -- Ajout de l'indentation pour le sous-arbre droit
            Afficher_Arbre_Huffman(Arbre_droite(Arbre), Indentation_Droite);
        end if;
        end Afficher_Arbre_Huffman;

    Arbre1, Arbre2, Arbre3, Arbre4, Arbre5 : T_Arbre_Huffman;

begin
    -- Initialiser l'arbre
    Put_Line("====Test: Initialiser l'arbre.====");
    Initialiser(Arbre1);
    Initialiser(Arbre2);
    Initialiser(Arbre3);
    Initialiser(Arbre4);
    Pragma Assert (Est_vide(Arbre1));
    Pragma Assert (Est_vide(Arbre2));
    Pragma Assert (Est_vide(Arbre3));
    Pragma Assert (Est_vide(Arbre4));
    Put_Line("==================================");

    -- Créer des feuilles
    Put_Line("====Test: Créer une feuille====");
    Creer_Feuille(Arbre1, To_Unbounded_String("A"), 1);
    Afficher_Arbre_Huffman(Arbre1, 0);
    pragma Assert (Est_feuille(Arbre1));
    pragma Assert (Frequence(Arbre1)=1);
    Creer_Feuille(Arbre2, To_Unbounded_String("B"), 2);
    pragma Assert (Est_feuille(Arbre2));
    pragma Assert (Frequence(Arbre2)=2);
    Creer_Feuille(Arbre3, To_Unbounded_String("C"), 3);
    pragma Assert (Est_feuille(Arbre3));
    pragma Assert (Frequence(Arbre3)=3);
    Put_Line("===============================");

    -- Fusionner deux arbres
    Put_Line("====Test: Fusionner deux arbres====");
    Fusionner(Arbre4, Arbre1, Arbre2);
    pragma Assert (Frequence(Arbre4) = 3);
    Fusionner(Arbre5, Arbre4, Arbre3);
    pragma Assert (Frequence(Arbre5) = 6);
    Afficher_Arbre_Huffman(Arbre5, 0);
    Put_Line("===================================");

    -- Vérifier le sous-arbre gauche et droit
    Put_Line("====Test: Vérifier les sous-arbres.====");
    Afficher_Arbre_Huffman(Arbre_Gauche(Arbre5),0);
    Afficher_Arbre_Huffman(Arbre_Droite(Arbre5),0);
    Put_Line("=======================================");

    -- Libérer la mémoire
    Put_Line("====Test: Libérer la mémoire.====");
    Detruire(Arbre5);
    Pragma Assert (Est_vide(Arbre5));
    Put_Line("=================================");

end Test_Module;

with Ada.Text_IO;            use Ada.Text_IO;
with SDA_Exceptions;         use SDA_Exceptions;
with Ada.Unchecked_Deallocation;

package body LCA is

    procedure Free is 
         new Ada.Unchecked_Deallocation (Object => T_Cellule, Name => T_LCA);

    procedure Initialiser(Sda: out T_LCA) is
    begin
         Sda := null;
    end Initialiser;


    procedure Detruire (Sda : in out T_LCA) is
    pt_curseur : T_LCA;
    begin
        pt_curseur := Sda;
        while not(pt_curseur = null) loop
            pt_curseur := pt_curseur.all.suivant;
            Free(pt_curseur);
            Sda := pt_curseur;
        end loop;
        Free(Sda);
    end Detruire;


    procedure Afficher_Debug (Sda : in T_LCA) is
    begin
       	if Sda = null then
            Put_Line("--E");
       	else
            Put ("-->[");
            Afficher_Cle(Sda.all.cle);
            Put (" : ");
            Afficher_Donnee(Sda.all.valeur);
            Put ("]");
            --Pour afficher le reste
            Afficher_debug (Sda.all.suivant);
        end if;
    end Afficher_Debug;


    function Est_Vide (Sda : T_LCA) return Boolean is
    begin
        return (Sda = null);
    end Est_Vide;


    function Taille (Sda : in T_LCA) return Integer is
    begin
        if Sda = null then
            return 0;
        else
            return 1 + Taille(Sda.all.suivant);
        end if;    
    end Taille;


    procedure Enregistrer (Sda : in out T_LCA ; Cle : in T_Cle ; Valeur : in T_Valeur) is
    A_enregistrer : T_LCA; --Pointeur sur l'élément à enregistrer
    begin
        if Sda = null then  --Si la sda est nulle
            A_enregistrer := new T_Cellule;
            A_enregistrer.all.cle := Cle;
            A_enregistrer.all.valeur := Valeur;
            A_enregistrer.all.suivant := null;
            Sda := A_enregistrer;
        else
            if Sda.all.cle = Cle then --Si la clé se trouve au début
                Sda.all.valeur := Valeur;
            else
                --Sinon on parcoure la Sda pour trouver la clé et mettre à jour sa valeur
                Enregistrer(Sda.all.suivant , Cle , Valeur);
            end if;
        end if;
    end Enregistrer;
            

    function Cle_Presente (Sda : in T_LCA ; Cle : in T_Cle) return Boolean is
    begin
        if Sda = null then
            return False;
        elsif Sda.all.cle = Cle then
            return True;
        else
            return Cle_Presente (Sda.all.suivant,Cle);
        end if;
    end Cle_Presente; 


    function La_Valeur (Sda : in T_LCA ; Cle : in T_Cle) return T_Valeur is
    begin
        if Sda = null then
            raise Cle_Absente_Exception;
        elsif Sda.all.cle=Cle then
            return Sda.all.valeur;
        else
            return La_Valeur(Sda.all.suivant,Cle);
        end if;
    end La_Valeur;


    procedure Supprimer (Sda : in out T_LCA ; Cle : in T_Cle) is
    A_supprimer : T_LCA; --Pointeur sur l'élément à supprimer
    begin
        if Sda = Null then
            raise Cle_Absente_Exception;
        elsif Sda.all.cle = Cle  then
            -- Si l'élément à supprimer est au début de la Sda
            A_supprimer := Sda;
            Sda := Sda.all.Suivant;
            Free (A_supprimer);
        else
            --Sinon on parcours la Sda pour trouver la clé pour la supprimer
            Supprimer (Sda.all.suivant, Cle);
        end if;
    end Supprimer;


    procedure Pour_Chaque (Sda : in T_LCA) is
    pt_curseur : T_LCA;
    begin
        pt_curseur := Sda;
        while not(pt_curseur = null) loop
            -- même si on a une exception, on continue à traiter les couples clé:valeur suivants
            begin
                Traiter(pt_curseur.all.cle,pt_curseur.all.valeur);
            exception
                when others =>
                      null;
            end;
            pt_curseur := pt_curseur.all.suivant;
        end loop;
    end Pour_Chaque;
    
end LCA; 


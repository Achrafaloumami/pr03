with Ada.Strings.Unbounded; 
use Ada.Strings.Unbounded;
with LCA;


package body Module is

   package LCA_ is
      new 
    
    procedure initialiser(Arbre: out T_Arbre_Huffman) is
    begin
        Arbre := null;
    end initialiser;
    
    procedure Tableau_Freq(Tab_freq : in out T_LCA; Tab : in T_tab_Octet) is
    begin
    
        for i in Tab'Range loop
            
            if Cle_Presente(tab_Freq, Tab(i)) then
                Enregistrer(tab_Freq, Tab(i), La_Valeur(Tab_Freq, Tab(i)) + 1);
            else
                Enregistrer(tab_Freq, Tab(i), 1);
            end if;
        end loop;
    end Tableau_Freq;
    
    
    
    
    procedure Construire_tab_feuille(Table_freq :in LCA_Un_Str_Int.T_LCA, Table_feuille : in out LCA_int_feuille.T_LCA) is
         curseur : LCA_Un_Str_Int.T_LCA := Table_freq;
    begin
         while curseur/=null loop
            Table_feuille.all.Octet := curseur.all.Cle;
            Table_feuille.all.Frequence := curseur.all.Valeur;
            Table_feuille.all.Sous_Arbre_droite := null;
            Table_feuille.all.Sous_Arbre_gauche := null;
            curseur := curseur.all.suivant;
         end loop;
    end Construire_tab_feuille;

    
    
    procedure Construire_arbre (Arbre: in out T_Arbre_Huffman; Table_feuille : in out LCA_int_feuille.T_LCA) is
        min1 : T_Arbre_Huffman;
        min2 : T_Arbre_Huffman;
    begin
        Construire_tab_feuille(Table_freq);
        min1 := Min(Tableau_freq, Arbre);
        min2 := Min(Tableau_freq, Arbre);
        Fusionner(min1,min2);
        
        
        
        
        
        
        
       
    
    
    procedure Tableau_Huff(Tab_freq : in T_LCA; Arbre : in T_Arbre_Huffman; Tab_Huff : in out T_LCA) is
    begin
        
    
    
   

end Module;

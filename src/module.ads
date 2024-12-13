with Ada.Strings.Unbounded; 
use Ada.Strings.Unbounded;
with LCA;

package Module is
    
    type T_Octet is mod 2 ** 8;	-- sur 8 bits
    for T_Octet'Size use 8;
 
    type T_tab_Octet is array(1..100) of T_Octet;
    package LCA_Un_Str_Int is
            new LCA(T_Cle => T_Octet, T_Valeur => Integer );
    use LCA_Un_Str_Int;
    
    package LCA_int_feuille is
            new LCA (T_Cle => T_Arbre_Huffman, T_Valeur => Integer );
   use LCA_int_feuille;
    
    type T_Arbre_Huffman is private;
      
    -- Initialiser l'arbre de Huffman
    procedure initialiser(Arbre: out T_Arbre_Huffman) with
            Post => Est_Vide(Arbre); 
    
    --renvoyer le tableau de freqence
    procedure Tableau_Freq(Tab_freq : in out T_LCA; Tab : in T_tab_Octet);

    -- renvoyer le tableau de Huffman
    procedure Tableau_Huff(Tab_freq : in T_LCA; Arbre : in T_Arbre_Huffman; Tab_Huff : in out T_LCA);

    --renvoyer un tableau qui contient les feuilles de l'arbre
    procedure Construire_tab_feuille(Table_freq :in LCA_Un_Str_Int.T_LCA, Table_feuille : in out LCA_int_feuille.T_LCA);
    
    -- Construire l'arbre de Huffman
    procedure Construire_arbre (Arbre: in out T_Arbre_Huffman; Table : in T_LCA);
    
   
   
   
    --renvoyer la structure de l'arbre de Huffman
    function Code_arbre(Arbre : in T_Arbre_Huffman) return Integer;
    
    -- Verifier si l'arbre est vide
    function Est_vide(Arbre: in T_Arbre_Huffman) return Boolean;
    
    -- Libérer l'espace mémoire alloué par l'arbre
    procedure Detruire(Arbre: in out T_Arbre_Huffman);
    
    -- creer une feuille de l'arbre de huffman
    procedure creer_feuille(arbre: out T_arbre_huffman; Symbole: in Unbounded_String; Frequence: in Integer);
    
    -- Verifier si c'est une feuille ou non
    function Est_feuille(arbre: in T_arbre_huffman) return Boolean;
                                    
    -- Fusionner deux arbres en un seul arbre
    procedure Fusionner(Arbre: out T_Arbre_Huffman; Gauche: in T_Arbre_Huffman; Droite: in T_Arbre_Huffman);
    
    
    -- La frequence de l'arbre
    function Frequence (Arbre: in T_Arbre_Huffman) return Integer;
    
    
    -- La symbole de l'arbre
    function Symbole (Arbre: in T_Arbre_Huffman) return Unbounded_String;
    
    -- Pacourer l'arbre 
    procedure Parcours_infixe(Arbre: in T_Arbre_Huffman);
    
    -- Retourner le sous arbre gauche d'un noued
    function Arbre_gauche(Arbre: in T_Arbre_Huffman) return T_Arbre_Huffman;
    
    -- Retourner le sous arbre droite d'un noued
    function Arbre_droite(Arbre: in T_Arbre_Huffman) return T_Arbre_Huffman;
    
    procedure Afficher(Arbre: in T_Arbre_Huffman);
    
private
    
    type T_Noued;
    type T_Arbre_Huffman is access T_Noued;
    type T_Noued is record
        Octet: T_Octet;
        Frequence: Integer;
        Sous_Arbre_gauche: T_Arbre_Huffman;
        Sous_Arbre_droite: T_Arbre_Huffman;
    end record;
    
end Module;

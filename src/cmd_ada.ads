with Ada.Containers;        use Ada.Containers;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
package Cmd_ada is

   package Cb_Parameters is new Ada.Containers.Vectors
     (Index_Type => Natural, Element_Type => Unbounded_String);

   type Proc_Callback is access procedure (Parameters : Cb_Parameters.Vector);

   procedure Register_Command
     (Command_String : String; Command_Cb : Proc_Callback;
      Description    : String);

   procedure Set_Exit_Command (Exit_Cmd : String);

   procedure Set_Help_Command (Help_Cmd : String);

   procedure Set_Prompt (Prompt_Str : String);

   procedure Set_Help_Preamble (Preamble_Str : String);

   procedure Main_Loop;

private

   type Command is record
      Command_String : Unbounded_String;
      Command_Cb     : Proc_Callback;
      Description    : Unbounded_String;
   end record;

   package Command_Vectors is new Ada.Containers.Vectors
     (Index_Type => Natural, Element_Type => Command);

   Commands : Command_Vectors.Vector;

   Exit_Command : Unbounded_String := To_Unbounded_String ("quit");
   Help_Command : Unbounded_String := To_Unbounded_String ("?");
   Prompt       : Unbounded_String := To_Unbounded_String ("> ");
   Help_Preamble : Unbounded_String := To_Unbounded_String ("Commands:");

   procedure Print_Help;

end Cmd_ada;

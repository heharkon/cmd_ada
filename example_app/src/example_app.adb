with Cmd_ada;
with Test_Procs;

procedure Example_App is
begin
   Cmd_ada.Register_Command
     (Command_String => "test1", Command_Cb => Test_Procs.Test1'Access,
      Description    => "Just a test");

   Cmd_ada.Register_Command
     (Command_String => "test2", Command_Cb => Test_Procs.Test1'Access,
      Description    => "Second test");

   Cmd_ada.Set_Exit_Command ("exit");
   Cmd_ada.Set_Help_Command ("help");
   Cmd_ada.Set_Prompt (">> ");
   Cmd_ada.Set_Help_Preamble ("Those commands are...");

   Cmd_ada.Main_Loop;

end Example_App;

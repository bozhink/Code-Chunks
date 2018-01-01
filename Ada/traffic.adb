with Ada.Text_IO; use Ada.Text_IO;
 
procedure Traffic is
 
   type Airplane_ID is range 1..10;         -- 10 airplanes (= tasks)
 
   task type Airplane(ID: Airplane_ID);     -- task type representing airplanes
   type Airplane_Access is access Airplane; -- access type (reference) to Airplane
 
   protected type Runway is             -- a protected object - the shared runway
      entry Assign_Aircraft(ID: Airplane_ID);
      entry Cleared_Runway (ID : Airplane_ID);
      entry Wait_For_Clear;
   private
      Clear: Boolean := True; -- protected private data - generally more than just a flag...
   end Runway;
   type Runway_Access is access all Runway;
 
   -- the air traffic controller takes requests for takeoff and landing
   task type Controller(My_Runway: Runway_Access) is
      entry Request_Takeoff (ID: in Airplane_ID; Takeoff: out Runway_Access);
      entry Request_Approach(ID: in Airplane_ID; Approach: out Runway_Access);
   end Controller;
 
   Runway1    : aliased Runway;             -- instantiate a runway
   Controller1: Controller(Runway1'Access); -- and a controller to manage it
 
  ------ the implementations of the above types ------
   protected body Runway is
      entry Assign_Aircraft (ID : Airplane_ID)
        when Clear is   -- the entry guard - tasks are blocked until this is true
      begin
        Clear := False;     Put_Line (Airplane_ID'Image (ID) & " on runway ");
      end;
 
      entry Cleared_Runway (ID : Airplane_ID) when not Clear is
      begin
         Clear := True;     Put_Line (Airplane_ID'Image (ID) & " cleared runway ");
      end;
 
      entry Wait_For_Clear when Clear is begin
         null;
      end;
   end Runway;
 
   task body Controller is
   begin
      loop
         My_Runway.Wait_For_Clear;   -- wait until runway is available
         select                      -- wait for two types of requests
            when Request_Approach'count = 0 =>  -- landings have priority
             accept Request_Takeoff (ID : in Airplane_ID; Takeoff : out Runway_Access) do
               My_Runway.Assign_Aircraft (ID);  -- reserve runway
               Takeoff := My_Runway;            -- tell airplane which runway
            end Request_Takeoff;                -- end of the synchronised part
         or
            accept Request_Approach (ID : in Airplane_ID; Approach : out Runway_Access) do
               My_Runway.Assign_Aircraft (ID);
               Approach := My_Runway;
            end Request_Approach;
         or                          -- terminate if nobody left who could call
            terminate;
         end select;
      end loop;
   end;
 
   task body Airplane is
      Rwy : Runway_Access;
   begin
      Controller1.Request_Takeoff (ID, Rwy); -- wait to be cleared for takeoff
      Put_Line (Airplane_ID'Image (ID) & "  taking off...");  delay 2.0;
      Rwy.Cleared_Runway (ID);
      delay 5.0; -- fly around a bit...
      loop
         select   -- try to request a runway
            Controller1.Request_Approach (ID, Rwy); -- this is a blocking call
            exit; -- if call returned we're clear for landing - proceed...
 
         or delay 3.0;  -- timeout - if no answer in 3 seconds, do something else
            Put_Line (Airplane_ID'Image (ID) & "   in holding pattern");
         end select;
      end loop;
      delay 4.0;  -- do landing approach...
      Put_Line (Airplane_ID'Image (ID) & "            touched down!");
      Rwy.Cleared_Runway(ID);  -- notify runway that we're done here.
   end;
 
   New_Airplane: Airplane_Access;
begin
   for I in Airplane_ID'Range loop  -- create a few airplane tasks
      New_Airplane := new Airplane(I); delay 3.0;
   end loop;
end Traffic;

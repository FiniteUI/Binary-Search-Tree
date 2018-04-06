WITH GenericBinarySearchTree, Ada.Text_Io, Ada.Integer_Text_Io;
USE Ada.Text_Io, Ada.Integer_Text_Io;
PROCEDURE GenericBinarySearchTreeDriver IS
   subTYPE String10 IS String(1..10);
   TYPE Customer IS RECORD
      Name: String10;
      PhoneNumber: String10;
   END RECORD;

   PROCEDURE PrintInfo(Cust: IN Customer) IS
   BEGIN
      Put(Cust.Name); New_Line;
      end PrintInfo;

   FUNCTION GetString10 RETURN String10 IS
      S: String10;
      Last: Integer;
   BEGIN
      Get_Line(S, Last);
      S(Last+1..S'Last) := (OTHERS => ' ');
      return S;
   END GetString10;

   FUNCTION "<"(Akey: IN String10; Arecord: IN Customer) RETURN Boolean IS
      B: Boolean;
   BEGIN
      IF (Akey(1) < ARecord.Name(1)) THEN
         B := True;
      ELSIF (Akey(1) = ARecord.Name(1)) THEN
         FOR I IN 2..10 LOOP
            IF (Akey(I) < ARecord.Name(I)) THEN
               B := True;
               EXIT;
            ELSIF (Akey(I) > ARecord.Name(I)) THEN
               B := False;
                  EXIT;
            ELSE
               B := False;
            END IF;
         END LOOP;
      ELSE
         B := False;
      END IF;
      Return B;
   END "<";

   FUNCTION ">"(Akey: IN String10; ARecord: IN Customer) RETURN Boolean IS
      B: Boolean;
   BEGIN
      IF (Akey(1) > ARecord.Name(1)) THEN
         B := True;
      ELSIF (Akey(1) = ARecord.Name(1)) THEN
         FOR I IN 2..10 LOOP
            IF (Akey(I) > ARecord.Name(I)) THEN
               B := True;
               EXIT;
            ELSIF (Akey(I) < ARecord.Name(I)) THEN
               B := False;
               EXIT;
            ELSE
               B := False;
            END IF;
         END LOOP;
      ELSE
         B := False;
      END IF;
      RETURN B;
   END ">";

   FUNCTION "="(Akey: IN String10; Arecord: IN Customer) RETURN Boolean IS
      B: Boolean;
   BEGIN
      FOR I IN 1..10 LOOP
         IF(Akey(I) = Arecord.Name(I)) THEN
            B := True;
         ELSE
            B := False;
            EXIT;
         END IF;
      END LOOP;
      RETURN B;
   END "=";

   TempPoint, TempPoint2: Integer;
   Choice: Character;
   MainRoot: Integer;
   TempCustomer: Customer;
   Action: Integer;
   Name, Number: String10;
   PACKAGE BinarySearchTree IS NEW GenericBinarySearchTree(String10, Customer, "<", ">", "=", PrintInfo);
BEGIN
   MainRoot := BinarySearchTree.GetRoot;
   LOOP
      Put_line("Enter 0 to exit,");
      Put_Line("Enter 1 to Insert a Customer,");
      Put_Line("Enter 2 to find a customer and print their phone number,");
      Put_Line("Enter 3 to traverse tree in Inorder,");
      Put_Line("Enter 4 to delete a Customer,");
      Put_Line("Enter 5 to traverse tree in reverse Inorder,");
      Put_Line("Enter 6 to traverse tree in preorder,");
      Put_Line("Enter 7 to traverse tree in postorder:");
      Get(Action);
      CASE Action IS
         WHEN 0 =>
            EXIT;
            --end of case 0
         WHEN 1 =>
            Put_Line("Enter customer name: ");
            Skip_line;
            Name := GetString10;
            Put_Line("Enter customer phone number: ");
            Number := GetString10;
            TempCustomer.Name := Name;
            TempCustomer.PhoneNumber := Number;
            BinarySearchTree.InsertBinarySearchTree(MainRoot, Name, TempCustomer);
            --end of case 1
         WHEN 2 =>
            Put_Line("Enter A to find iteratively, B to find recursively: ");
            Get(Choice);
            Put_Line("Enter customer name to find: ");
            skip_line;
            Name := getString10;
            CASE Choice IS
               WHEN 'A' =>
                  BinarySearchTree.FindCustomeriterative(MainRoot, Name, TempPoint);
               WHEN 'B' =>
                  BinarySearchTree.FindCustomerRecursive(MainRoot, Name, TempPoint);
               WHEN OTHERS =>
                  Put_Line("Error: Invalid input. Exiting to main program...");
            END CASE;
            MainRoot := BinarySearchTree.GetRoot;
            IF (TempPoint = MAinRoot) or (TempPoint = -1) THEN
               Put_Line("Customer not found.");
            ELSE
               Put("Customer "); Put(Name, 0); Put_Line(" found. Phone Number: ");
               TempCustomer := BinarySearchTree.CustomerInfo(TempPoint);
               Put(TempCustomer.PhoneNumber);
               new_line;
            END IF;

            --end of case 2
         WHEN 3 =>
            Put_Line("Enter A to start at Root, B to start anywhere else: ");
            Get(CHoice);
            CASE Choice IS
               WHEN 'A' =>
                  Put_line("Traversing Tree in Inorder... ");
                  TempPoint := BinarySearchTree.GetInorderFirst;
                  LOOP
                     EXIT WHEN TempPoint = MainRoot;
                     TempCustomer := BinarySearchtree.CustomerInfo(TempPoint);
                     put(TempCustomer.Name); new_line; put(TempCustomer.PhoneNumber); New_line;
                     TempPoint := BinarySearchtree.InorderSuccessor(TempPoint);
                  END LOOP;
                  --End of case A
               WHEN 'B' =>
                  Put_Line("Enter the name of the customer to start at: ");
                  Skip_line;
                  Name := GetString10;
                  new_line;
                  BinarySearchTree.FindCustomerIterative(MainRoot, Name, TempPoint);
                  TempPoint2 := TempPoint;
                  Put_line("Traversing Tree in Inorder... ");
                  LOOP
                     TempCustomer := BinarySearchtree.CustomerInfo(TempPoint);
                     put(TempCustomer.Name); new_line; put(TempCustomer.PhoneNumber); New_line;
                     TempPoint := BinarySearchtree.InorderSuccessor(TempPoint);
                     EXIT WHEN TempPoint = TempPoint2;
                     IF (TempPoint = MainRoot) THEN
                        TempPoint := BinarySearchTree.GetInOrderFirst;
                     END IF;
                  END LOOP;

               WHEN OTHERS =>
                  Put_Line("Error: invalid input, exiting to main menu...");
            END CASE;
               New_line;
            --end of case 3
         WHEN 4 =>
            Put_Line("Enter the name of the customer to delete:");
            Skip_Line;
            Name := GetString10;
            mainRoot := BinarySearchTree.getRoot;
            BinarySearchTree.FindCustomerIterative(Mainroot, Name, TempPoint);
            IF (TempPoint = MainRoot) THEN
               Put_Line("Did not find customer. Exiting to main menu...");
            ELSE
               Put_Line("Deleting customer...");
               BinarySearchTree.DeleteRandomNode(TempPoint);
               Put_Line("Customer deleted.");
            END IF;

            --end of case 4
         WHEN 5 =>
            Put_line("Printing Tree in reverse inorder...");
            BinarySearchTree.ReverseINOrder(MainRoot);
            new_line;
            --end of case 5
         WHEN 6 =>
            Put_line("Printing Tree in preorder...");
            BinarySearchTree.PreOrder(MainRoot);
            --end of case 6
         WHEN 7 =>
            MainRoot := BinarySearchTree.getRoot;
            Put_Line("Enter A to use Iterative, B to use recursive:");
            Get(Choice);
            put("Traversing in postorder ");
            CASE Choice IS
               WHEN 'A' =>
                  put_line("iterative: ");
                  BinarySearchTree.PostOrderIterative(MainRoot);
                  new_line;
               WHEN 'B' =>
                  put_line("recursive: ");
                  BinarySearchTree.PostOrderRecursive(MainRoot);
                  new_line;
               WHEN OTHERS =>
                  Put_Line("Error: Invalid input. Exiting to main menu...");
            END CASE;

            --end of case 7
         WHEN OTHERS =>
            Put_Line("Error: invalid input");
            --end of case others
      END CASE;--Case Action
   END LOOP;
END genericBinarySearchTreeDriver;


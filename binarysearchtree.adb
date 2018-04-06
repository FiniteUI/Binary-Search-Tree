WITH Ada.Text_Io; USE Ada.Text_Io;
with ada.integer_text_io; use ada.integer_text_io;
PACKAGE BODY BinarySearchTree IS

  function InorderSuccessor(TreePoint: IN BinarySearchTreePoint) return BinarySearchTreePoint IS
       --Sets Q to inorder successor of X, returns Q
       Q: BinarySearchTreePoint;
    BEGIN
       Q := treePoint.Rlink;
       IF (Treepoint.Rtag = False) THEN
          NULL;
       ELSE
          WHILE (Q.Ltag) LOOP
             Q := Q.Llink;
          END LOOP;
       END IF;
       Return Q;
    END InorderSuccessor;

    PROCEDURE InsertNode(X, Y: IN BinarySearchtreePoint; Akey: IN String10) IS
       --Inserts Node X to left or right of node y
       z: BinarySearchTreePoint;
    BEGIN
       IF (Akey < Y.info.name) THEN
          X.Llink := Y.Llink;
          X.Ltag := Y.Ltag;
          Y.Llink := X;
          Y.Ltag := True;
          X.Rlink := Y;
          X.Rtag := False;
          IF (X.Ltag) THEN
             Z := InorderSuccessor(X);
             Z.Rlink := X;
          END IF;
       ELSE
          X.Rlink := Y.Rlink;
          X.Rtag := Y.Rtag;
          Y.Rlink := X;
          Y.Rtag := True;
          X.Llink := Y;
          X.Ltag := False;
          IF (X.Rtag) THEN
             Z := InorderSuccessor(X);
             Z.Llink := X;
          END IF;
       END IF;
    END InsertNode;

   PROCEDURE InsertBinarySearchTree(Root: IN OUT BinarySearchTreePoint; CustName: IN String10; CustPhone: IN String10) IS
      X: BinarySearchTreePoint;
      y: BinarySearchTreePoint := Root;
   BEGIN
      X := new node;
      X.info.Name := CustName;
      X.info.PhoneNumber := CustPhone;
      IF (Root = NULL) THEN
         Root := NEW Node;
         Root.Rtag := True; Root.Rlink := Root;
         Root.Ltag := True; Root.Llink := X;
      ELSE
         LOOP
            IF (Custname < Y.Info.Name) THEN
               IF (Y.Ltag /= False) THEN
                  Y := Y.Llink;
               ELSE
                  InsertNode(X, Y, CustName);
                  Exit;
               END IF;
            ELSIF (CustName >= Y.Info.name) THEN
               IF (Y.Rtag /= False) THEN
                  Y := Y.Rlink;
               ELSE
                  InsertNode(X, Y, CustName);
                  EXIT;
               END IF;
            END IF;
         END LOOP;
      END IF;
   END InsertBinarySearchTree;

   PROCEDURE FindCustomerIterative(Root: IN BinarySearchTreePoint; CustomerName: IN String10; CustomerPoint: OUT BinarySearchTreePoint) IS
      X: BinarySearchTreePoint := Root;
   BEGIN
      IF (X /= NULL) AND then (X.Llink /= X) THEN
         X := X.Llink;
      END IF;
      LOOP
         put(1);
         IF (X = NULL) OR else (X.Llink = X) THEN
            CustomerPoint := NULL;
            EXIT;
         ELSIF (Customername < X.Info.Name) and (X.Ltag) THEN
            X := X.Llink;
         ELSIF (Customername > X.Info.Name) AND (X.Rtag) THEN
            X := X.Rlink;
         ELSIF (CustomerName = X.Info.Name) THEN
            CustomerPoint := X;
            Exit;
         ELSE
            CustomerPoint := NULL;
            exit;
         END IF;
      END LOOP;
   END FindCustomerIterative;

   PROCEDURE FindCustomerRecursive(Root: IN BinarySearchTreePoint; CustomerName: IN String10; CustomerPoint: OUT BinarySearchtreePoint) IS
      x: BinarySearchTreePoint;
   BEGIN
      IF (Root.Rlink = Root) THEN--First Call with head node
         X := Root.Llink;
      ELSE
         X := Root;--Recursive call with any node
      END IF;

      IF (X = null) THEN
         CustomerPoint := NULL;
      ELSIF (CustomerName < X.info.name) and (X.Ltag) THEN
         FindCustomerRecursive(X.Llink, CustomerName, CustomerPoint);
      ELSif (CustomerName > x.info.name) and (X.Rtag) then
         FindCustomerRecursive(X.Rlink, CustomerName, CustomerPoint);
      ELSIF (CustomerName = X.Info.Name) THEN
         CustomerPoint := X;
      ELSE
         CustomerPoint := Null;
      END IF;
   END FindCustomerRecursive;

   FUNCTION CustomerName(TreePoint: IN BinarySearchTreePoint) RETURN String10 IS
   BEGIN
         RETURN TreePoint.Info.Name;
      END CustomerName;

      FUNCTION CustomerPhone(TreePoint: IN BinarySearchTreePoint) RETURN String10 IS
      BEGIN
         RETURN TreePoint.Info.PhoneNumber;
      END CustomerPhone;
   BEGIN
      null;
End BinarySearchtree;
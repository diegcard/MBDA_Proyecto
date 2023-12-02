-- Test case 1: Valid input
BEGIN
    MO_Repuestos('123', 'Nombre1', 10.99, 50, 'Tipo1', 'Estado1', 'TipoRepuesto1', 'Descripción1');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Test case 1 passed');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Test case 1 failed');
END;

-- Test case 2: Invalid input (missing required parameters)
BEGIN
    MO_Repuestos('456', NULL, 9.99, 20, 'Tipo2', 'Estado2', 'TipoRepuesto2', 'Descripción2');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Test case 2 passed');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Test case 2 failed');
END;

-- Test case 3: Invalid input (negative price)
BEGIN
    MO_Repuestos('789', 'Nombre3', -5.99, 30, 'Tipo3', 'Estado3', 'TipoRepuesto3', 'Descripción3');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Test case 3 passed');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Test case 3 failed');
END;
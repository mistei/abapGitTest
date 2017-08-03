class ZSTE_CL_TEST definition
  public
  final
  create public .

public section.

  methods METH1
    importing
      !IV_A type INT1
      !IV_B type INT1
    returning
      value(RV_C) type INT4
    raising
      /KNAPP/CX_STD .
  methods METH2
    exceptions
      ERROR .
protected section.
private section.

  data AV_TEST1 type CHAR10 .
  class-data SV_TEST2 type CHAR10 .
  constants CV_TEST3 type CHAR10 value '1' ##NO_TEXT.
ENDCLASS.



CLASS ZSTE_CL_TEST IMPLEMENTATION.


  METHOD meth1.

    RAISE EXCEPTION TYPE /knapp/cx_std.

  ENDMETHOD.


  METHOD meth2.

    RAISE error.

  ENDMETHOD.
ENDCLASS.

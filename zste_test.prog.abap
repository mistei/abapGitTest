*&---------------------------------------------------------------------*
*& Report  ZSTE_TEST
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zste_test.

"Übersetzungen in: SE63, Kurztexte: G5, Klassen. Langtexte: H5, Klassen. DOKU-Klasse: DOKIL
"Test for Pull

INITIALIZATION.

CLASS lcl_query_hu DEFINITION
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      constructor,
      setvar.

    DATA:
      av_value_parent TYPE int1.
ENDCLASS.

CLASS lcl_query_hu IMPLEMENTATION.

  METHOD constructor.

    av_value_parent = 1.
    setvar( ).

  ENDMETHOD.

  METHOD setvar.

    av_value_parent = 150.

  ENDMETHOD.

ENDCLASS.


CLASS lcl_my_query_hu DEFINITION
  INHERITING FROM lcl_query_hu
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      constructor,
      setvar REDEFINITION.
    DATA:
      av_value_child TYPE int1.
ENDCLASS.

CLASS lcl_my_query_hu IMPLEMENTATION.

  METHOD constructor.

    super->constructor( ).

    "av_value_parent = 2.
    "av_value_child = 10.

  ENDMETHOD.

  METHOD setvar.

    av_value_parent = 150.

  ENDMETHOD.

ENDCLASS.

CLASS lcl_query_hu_factory DEFINITION
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS: get_hu_query RETURNING VALUE(ro_hu_query) TYPE REF TO lcl_query_hu.

ENDCLASS.

CLASS lcl_query_hu_factory IMPLEMENTATION.

  METHOD get_hu_query.

    ro_hu_query = NEW #( ).

  ENDMETHOD.

ENDCLASS.

CLASS lcl_my_query_hu_factory DEFINITION
  CREATE PUBLIC
  INHERITING FROM lcl_query_hu_factory.

  PUBLIC SECTION.
    METHODS: get_hu_query REDEFINITION.

ENDCLASS.

CLASS lcl_my_query_hu_factory IMPLEMENTATION.

  METHOD get_hu_query.

    ro_hu_query ?= NEW lcl_my_query_hu( ).

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA: lo_child_cast TYPE REF TO lcl_my_query_hu.

  DATA(lo_parent) = NEW lcl_query_hu_factory( )->get_hu_query( ).
  DATA(lo_child) = NEW lcl_my_query_hu_factory( )->get_hu_query( ).

  WRITE: / 'lo_parent', lo_parent->av_value_parent.
  WRITE: / 'lo_child', lo_child->av_value_parent.

  lo_child_cast = lo_child.
  WRITE: / 'lo_child_cast', lo_child_cast->av_value_parent, lo_child_cast->av_value_child.



*DATA: gv_lgnum  TYPE /scwm/lgnum VALUE 'L100'
*    , gv_a      TYPE int1 VALUE 100
*    , gv_b      TYPE int1 VALUE 100
*    .
*
*/scwm/cl_tm=>set_lgnum( gv_lgnum ).
*
*
*cl_http_client=>create(
*  EXPORTING
*    host               = 'google.com'
*  IMPORTING
*    client             = data(client)    " HTTP Client Abstraction
*  EXCEPTIONS
*    argument_not_found = 1
*    plugin_not_active  = 2
*    internal_error     = 3
*    others             = 4
*).
*
*CHECK sy-subrc = 0.
*
*client->send(
*  EXCEPTIONS
*    http_communication_failure = 1
*    http_invalid_state         = 2
*    http_processing_failed     = 3
*    http_invalid_timeout       = 4
*    others                     = 5
*).
*
*CHECK sy-subrc = 0.
*
*client->receive(
*  EXCEPTIONS
*    http_communication_failure = 1
*    http_invalid_state         = 2
*    http_processing_failed     = 3
*    others                     = 4
*).
*
*cl_demo_output=>display( client->response->get_cdata( ) ).


*
*DATA(go_test) = NEW zste_cl_test( ).
*
*"TODO
*
*DO 3 TIMES.
*
*  SELECT * FROM /scwm/huhdr INTO TABLE @DATA(lt_huhdr) WHERE lgnum = 'L100' AND huident = '30010'. "#EC CI_SEL_NESTED
*
*ENDDO.

*"Kommentar 1
*DATA(gv_01) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_02) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_03) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_04) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_05) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_06) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_07) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_08) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_09) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_10) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_11) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_12) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_13) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_14) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_15) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_16) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_17) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*DATA(gv_18) = go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b )."Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b )."Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b )."Kommentar 1
*go_test->meth1( iv_a = gv_a iv_b = gv_b ).
*"Kommentar 1

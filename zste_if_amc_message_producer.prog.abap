*&---------------------------------------------------------------------*
*& Report  ZSTE_IF_AMC_MESSAGE_PRODUCER
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zste_if_amc_message_producer.

"Examples:
"DEMO_RECEIVE_AMC & DEMO_RECEIVE_AMC

**Example for sender
*TRY.
*    CAST if_amc_message_producer_text(
*          cl_amc_channel_manager=>create_message_producer(
*            i_application_id = 'DEMO_AMC'
*            i_channel_id    = '/demo_text' )
*      )->send( i_message = |Message from { sy-repid }| ).
*
*  CATCH cx_amc_error INTO DATA(text_exc).
*
*    cl_demo_output=>display( text_exc->get_text( ) ).
*
*ENDTRY.

*CALL TRANSFORMATION id SOURCE message = 'Hello AMC!' RESULT XML DATA(xml).

*TRY.
*    CAST if_amc_message_producer_binary(
*          cl_amc_channel_manager=>create_message_producer(
*            i_application_id = 'demo_amc'
*            i_channel_id    = '/demo_binary' )
*      )->send( i_message = xml ).
*
*  CATCH cx_amc_error INTO DATA(binary_exc).
*
*    cl_demo_output=>display( binary_exc->get_text( ) ).
*
*ENDTRY.

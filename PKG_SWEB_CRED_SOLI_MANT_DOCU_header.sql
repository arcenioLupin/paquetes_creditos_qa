create or replace PACKAGE         PKG_SWEB_CRED_SOLI_MANT_DOCU AS

PROCEDURE SP_LIST_DOCU (
    p_des_docu_eval   IN    vve_cred_mae_docu.des_docu_eval%TYPE,
    p_ind_tipo_docu   IN    vve_cred_mae_docu.ind_tipo_docu%TYPE,
    p_ind_oblig_gral  IN    vve_cred_mae_docu.ind_oblig_gral%TYPE,
    p_ind_inactivo    IN    vve_cred_mae_docu.ind_inactivo%TYPE,
    p_cod_usua_sid          IN sistemas.usuarios.co_usuario%type,
    p_cod_usua_web          IN sistemas.sis_mae_usuario.cod_id_usuario%type,
    p_ind_paginado          IN VARCHAR2,
    p_limitinf              IN INTEGER,
    p_limitsup              IN INTEGER,
    p_ret_cursor            OUT SYS_REFCURSOR,
    p_ret_cantidad          OUT NUMBER,
    p_ret_esta              OUT NUMBER,
    p_ret_mens              OUT VARCHAR2
);



PROCEDURE SP_ACT_DOCU
(
    p_cod_docu_eval     IN vve_cred_mae_docu.cod_docu_eval%TYPE,
    p_des_docu_eval     IN vve_cred_mae_docu.des_docu_eval%TYPE,
    p_ind_tipo_docu     IN vve_cred_mae_docu.ind_tipo_docu%TYPE,
    p_ind_oblig_gral    IN vve_cred_mae_docu.ind_oblig_gral%TYPE,
    p_ind_oblig_legal   IN vve_cred_mae_docu.ind_oblig_legal%TYPE,--<I Req. 87567 E2.1 ID## avilca 27/02/2021> 
    p_ind_inactivo      IN vve_cred_mae_docu.ind_inactivo%TYPE,
    p_cod_docu_legal    IN vve_cred_mae_docu.cod_docleg%TYPE,
    p_val_dias_vig      IN vve_cred_mae_docu.val_dias_vig%TYPE,--<I Req. 87567 E2.1 ID## avilca 23/11/2020> 
    p_cod_usua_web      IN sistemas.usuarios.co_usuario%TYPE,
    p_cod_usua_sid      IN sistemas.sis_mae_usuario.cod_id_usuario%TYPE,
    p_ret_esta          OUT NUMBER,
    p_ret_mens          OUT VARCHAR2

);

PROCEDURE SP_LIST_DOCU_LEGAL (
    p_ind_tipo_doc          IN VARCHAR2,
    p_cod_usua_sid          IN sistemas.usuarios.co_usuario%type,
    p_cod_usua_web          IN sistemas.sis_mae_usuario.cod_id_usuario%type,
    p_ret_cursor            OUT SYS_REFCURSOR,
    p_ret_cantidad          OUT NUMBER,
    p_ret_esta              OUT NUMBER,
    p_ret_mens              OUT VARCHAR2
);

--<I Req. 87567 E2.1 ID## avilca 20/11/2020>
PROCEDURE SP_OBTIENE_DOCU_LEGAL (
    p_cod_docleg            IN vve_cred_mae_docu.cod_docleg%TYPE,
    p_cod_usua_sid          IN sistemas.usuarios.co_usuario%type,
    p_cod_usua_web          IN sistemas.sis_mae_usuario.cod_id_usuario%type,
    p_ret_cursor            OUT SYS_REFCURSOR,
    p_ret_cantidad          OUT NUMBER,
    p_ret_esta              OUT NUMBER,
    p_ret_mens              OUT VARCHAR2
   ); 
--<F Req. 87567 E2.1 ID## avilca 20/11/2020>

END PKG_SWEB_CRED_SOLI_MANT_DOCU;
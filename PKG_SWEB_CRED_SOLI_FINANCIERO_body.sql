create or replace PACKAGE BODY       PKG_SWEB_CRED_SOLI_FINANCIERO AS
PROCEDURE sp_list_resumen
  (
      p_cod_solicitud     VARCHAR2,
      p_cod_cliente       VARCHAR2,
      p_cod_usua_sid      IN sistemas.usuarios.co_usuario%TYPE,
      p_cod_usua_web      IN sistemas.sis_mae_usuario.cod_id_usuario%TYPE,
      p_fec_solicitud     OUT VARCHAR2,
      p_ret_cursor        OUT SYS_REFCURSOR,
      p_ret_cursor_mat    OUT SYS_REFCURSOR,
      p_ret_esta          OUT NUMBER,
      p_ret_mens          OUT VARCHAR2
  ) AS
    V_VAL_PARA_NUM    VVE_CRED_SOLI_PARA.VAL_PARA_NUM%TYPE;
    v_cod_soli_cred   vve_cred_soli.cod_soli_cred%TYPE;
  BEGIN
          dbms_output.put_line('1'); 
          SELECT VAL_PARA_NUM
            INTO V_VAL_PARA_NUM
            FROM VVE_CRED_SOLI_PARA
           WHERE COD_CRED_SOLI_PARA = 'NROAÑOEEFF';
           dbms_output.put_line('2'); 
         BEGIN
                OPEN p_ret_cursor FOR
                 SELECT m.cod_mae_eeff, -- <ID 280 LRodriguez 26.11.19>
                        m.cod_cliente,  -- <ID 280 LRodriguez 26.11.19>
                        m.val_ano_eeff, -- <ID 280 LRodriguez 26.11.19>
                        cod_mone_eeff,
                        val_egyp_vtas_tota,
                        val_egyp_cost_vtas_serv,
                        val_egyp_util_brut,
                        val_egyp_gast_vtas,
                        val_egyp_gast_admi,
                        val_egyp_otro_ingr_gast,
                        val_egyp_util_oper,
                        val_egyp_gast_fina,
                        val_egyp_ingr_fina,
                        val_egyp_part_rela,
                        val_egyp_util_ordi,
                        val_egyp_ingr_extr_ccja,
                        val_egyp_egre_extr_ccaja,
                        val_egyp_ingr_extr_scja,
                        val_egyp_egre_extr_scja,
                        val_egyp_otro_ingr,
                        val_egyp_otro_egre,
                        val_egyp_util_ante_imp,
                        val_egyp_imp_part,
                        val_egyp_util_perd_neta,
                        val_egyp_var_vtas_tota,
                        val_egyp_var_cost_vtas_serv,
                        val_egyp_var_util_brut,
                        val_egyp_var_gast_vtas,
                        val_egyp_var_gast_admi,
                        val_egyp_var_otro_ingr_gast,
                        val_egyp_var_util_oper,
                        val_egyp_var_gast_fina,
                        val_egyp_var_ingr_fina,
                        val_egyp_var_part_rela,
                        val_egyp_var_util_ordi,
                        val_egyp_var_ingr_extr_ccja,
                        val_egyp_var_egre_extr_ccaja,
                        val_egyp_var_ingr_extr_scja,
                        val_egyp_var_egre_extr_scja,
                        val_egyp_var_otro_ingr,
                        val_egyp_var_otro_egre,
                        val_egyp_var_util_ante_imp,
                        val_egyp_var_imp_part,
                        val_egyp_var_util_perd_neta,
                        val_rati_capi_trab,
                        val_rati_dias_exist,
                        val_rati_cobr_clie,
                        val_rati_pago_prov,
                        val_rati_cicl_oper,
                        val_rati_pasi_tota_patr,
                        val_rati_deud_fina_brut,
                        val_rati_deud_fina_estr,
                        val_rati_porc_var_vtas,
                        val_rati_ebitda_anual,
                        val_rati_porc_ebitda_vtas,
                        val_rati_porc_roe,
                        val_rati_porc_roa,
                        val_rati_cash_flow,
                        val_rati_porc_cash_flow_vtas,
                        val_rati_deud_fina_brut_anos,
                        val_rati_deud_fina_estr_anos,
                        val_rati_deud_fina_ebitda,
                        val_rati_ebitda,
                        val_rati_depr_amor_ejer,
                        val_rati_divi,
                        val_rati_nro_mese,
                        val_rati_var_depr_amor_ejer,
                        val_rati_var_divi,
                        val_ghist_ebitda_anual,
                        val_ghist_cash_flow_anual,
                        val_bg_ac_caja_bcos,
                        val_bg_ac_valo_nego,
                        val_bg_ac_clie,
                        val_bg_ac_prov_cobr_dud,
                        val_bg_ac_cxc_srel,
                        val_bg_ac_cxc_dive,
                        val_bg_ac_exist,
                        val_bg_ac_gast_paga_anti,
                        val_bg_ac,
                        val_bg_anc_inve_rela,
                        val_bg_anc_otra_inve,
                        val_bg_anc_cxc_srel,
                        val_bg_anc_inmu_neto,
                        val_bg_anc_terr,
                        val_bg_anc_edif,
                        val_bg_anc_maqu,
                        val_bg_anc_mueb,
                        val_bg_anc_unid_trans,
                        val_bg_anc_equi_dive,
                        val_bg_anc_depr_acum,
                        val_bg_anc_trab,
                        val_bg_anc_otro_acti,
                        val_bg_anc_intan,
                        val_bg_anc_otro_anc,
                        val_bg_anc,
                        val_bg_tota_acti,
                        val_bg_pc_banc_deud_fina_cp,
                        val_bg_pc_otra_deud_fina_cp,
                        val_bg_pc_deud_lp,
                        val_bg_pc_trib_paga,
                        val_bg_pc_remu_paga,
                        val_bg_pc_prov,
                        val_bg_pc_cxp_srel,
                        val_bg_pc_cxp_dive,
                        val_bg_pc,
                        val_bg_pnc_bcos_deud_fina_lp,
                        val_bg_pnc_otra_deud_fina_lp,
                        val_bg_pnc_cxp_srel,
                        val_bg_pnc_otro_pnc,
                        val_bg_pnc_gana_dife,
                        val_bg_pnc,
                        val_bg_tota_pasi,
                        val_bg_pat_capi,
                        val_bg_pat_cap_adic,
                        val_bg_pat_exce_reva,
                        val_bg_pat_rese,
                        val_bg_pat_resu_acum,
                        val_bg_pat_resu_ejer,
                        val_bg_pat_otro,
                        val_bg_pat,
                        val_tota_pasi_patr,
                        val_cdre_acti_pasi_patr,
                        val_bg_var_ac_caja_bcos,
                        val_bg_var_ac_valo_nego,
                        val_bg_var_ac_clie,
                        val_bg_var_ac_prov_cobr_dud,
                        val_bg_var_ac_cxc_srel,
                        val_bg_var_ac_cxc_dive,
                        val_bg_var_ac_exist,
                        val_bg_var_ac_gast_paga_anti,
                        val_bg_var_ac,
                        val_bg_var_anc_inve_rela,
                        val_bg_var_anc_otra_inve,
                        val_bg_var_anc_cxc_srel,
                        val_bg_var_anc_inmu_neto,
                        val_bg_var_anc_terr,
                        val_bg_var_anc_edif,
                        val_bg_var_anc_maqu,
                        val_bg_var_anc_mueb,
                        val_bg_var_anc_unid_trans,
                        val_bg_var_anc_equi_dive,
                        val_bg_var_anc_depr_acum,
                        val_bg_var_anc_trab,
                        val_bg_var_anc_otro_acti,
                        val_bg_var_anc_intan,
                        val_bg_var_anc_otro_anc,
                        val_bg_var_anc,
                        val_bg_var_tota_acti,
                        val_bg_var_pc_banc_dfina_cp,
                        val_bg_var_pc_otra_dfina_cp,
                        val_bg_var_pc_deud_lp,
                        val_bg_var_pc_trib_paga,
                        val_bg_var_pc_remu_paga,
                        val_bg_var_pc_prov,
                        val_bg_var_pc_cxp_srel,
                        val_bg_var_pc_cxp_dive,
                        val_bg_var_pc,
                        val_bg_var_pnc_bcos_dfina_lp,
                        val_bg_var_pnc_otra_dfina_lp,
                        val_bg_var_pnc_cxp_srel,
                        val_bg_var_pnc_otro_pnc,
                        val_bg_var_pnc_gana_dife,
                        val_bg_var_pnc,
                        val_bg_var_tota_pasi,
                        val_bg_var_pat_capi,
                        val_bg_var_pat_cap_adic,
                        val_bg_var_pat_exce_reva,
                        val_bg_var_pat_rese,
                        val_bg_var_pat_resu_acum,
                        val_bg_var_pat_resu_ejer,
                        val_bg_var_pat_otro,
                        val_bg_var_pat,
                        val_var_tota_pasi_patr 
           -- <I ID 280 LRodriguez 26.11.19>
                   FROM vve_cred_mae_eeff m,vve_cred_soli_eeff s
                  WHERE s.cod_cliente = p_cod_cliente
                    AND S.IND_MATU IS NULL 
                    AND s.cod_mae_eeff = m.cod_mae_eeff 
                    AND s.cod_cliente = m.cod_cliente
                    AND s.val_ano_eeff = m.val_ano_eeff
                    AND m.val_ano_eeff<=(EXTRACT(YEAR FROM sysdate)) 
                    AND m.val_ano_eeff>=(EXTRACT(YEAR FROM sysdate)-4+1)
               ORDER BY val_ano_eeff;

               /*
                   FROM vve_cred_mae_eeff
                  WHERE cod_cliente = p_cod_cliente
                    AND val_ano_eeff<=(EXTRACT(YEAR FROM sysdate)) 
                    AND val_ano_eeff>=(EXTRACT(YEAR FROM sysdate)-4+1)

               */
           -- <F ID 280 LRodriguez 26.11.19>              
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    NULL;
            END;  

         BEGIN
                OPEN p_ret_cursor_mat FOR
                 SELECT cod_mae_eeff,
                        cod_cliente,
                        val_matu_ano_proy,
                        cod_mone_eeff,
                        val_matu_amor_deud_actu,
                        val_matu_amor_deud_nuev,
                        val_matu_gast_fina_deud_actu,
                        val_matu_gast_fina_deud_nuev,
                        val_matu_serv_deud,
                        val_matu_ebitda_proy,
                        val_matu_cash_flow_proy,
                        val_matu_fact_ebitda_sdeu,
                        val_matu_fact_cashf_sdeu                    
                   FROM vve_cred_mae_eeff
                  WHERE cod_cliente = p_cod_cliente
                    AND val_matu_ano_proy>=(EXTRACT(YEAR FROM sysdate)) 
                    AND val_matu_ano_proy<=(EXTRACT(YEAR FROM sysdate)+6)
               ORDER BY val_matu_ano_proy;

            END;   

      dbms_output.put_line('3');       
   BEGIN
       SELECT seff.cod_soli_cred
         INTO v_cod_soli_cred
         FROM vve_cred_soli_eeff seff
   INNER JOIN vve_cred_mae_eeff meff
           ON seff.COD_MAE_EEFF = meff.COD_MAE_EEFF
        WHERE meff.cod_cliente = p_cod_cliente
          AND meff.val_matu_ano_proy =(SELECT MAX(val_matu_ano_proy)
                                        FROM vve_cred_mae_eeff
                                       WHERE cod_cliente = p_cod_cliente);
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
         p_fec_solicitud :=NULL;
       WHEN TOO_MANY_ROWS THEN  
         v_cod_soli_cred := NULL;
    END;
  dbms_output.put_line('4');   
     p_fec_solicitud :=NULL;
     IF (v_cod_soli_cred IS NOT NULL) THEN
         SELECT TO_CHAR(TRUNC(s.fec_soli_cred),'DD/MM/YYYY')
           INTO p_fec_solicitud
           FROM vve_cred_soli s
          WHERE s.cod_soli_cred = v_cod_soli_cred;
     END IF;
  p_ret_esta := 1;
  p_ret_mens := 'La consulta se realizó de manera exitosa';
  EXCEPTION
     WHEN OTHERS THEN
      p_ret_esta := -1;
      p_ret_mens := 'sp_list_resumen:' || SQLERRM;
      pkg_sweb_mae_gene.sp_regi_rlog_erro('AUDI_ERROR',
                                          'sp_list_resumen',
                                          'sp_list_resumen',
                                          'Error al listar maturity',
                                          p_ret_mens,
                                          p_cod_solicitud);
  END;

PROCEDURE sp_ins_resumen
  (
        --p_cod_mae_eeff NUMBER,
        p_cod_solicitud         VARCHAR2,
        p_cod_cliente           VARCHAR2,
        p_val_ano_eeff          NUMBER,
        p_cod_mone_eeff         VARCHAR2,
        p_val_egyp_vtas_tota  vve_cred_mae_eeff.val_egyp_vtas_tota%TYPE,
        p_val_egyp_cost_vtas_serv  vve_cred_mae_eeff.val_egyp_cost_vtas_serv%TYPE,
        p_val_egyp_util_brut  vve_cred_mae_eeff.val_egyp_util_brut%TYPE,
        p_val_egyp_gast_vtas  vve_cred_mae_eeff.val_egyp_gast_vtas%TYPE,
        p_val_egyp_gast_admi  vve_cred_mae_eeff.val_egyp_gast_admi%TYPE,
        p_val_egyp_otro_ingr_gast  vve_cred_mae_eeff.val_egyp_otro_ingr_gast%TYPE,
        p_val_egyp_util_oper  vve_cred_mae_eeff.val_egyp_util_oper%TYPE,
        p_val_egyp_gast_fina  vve_cred_mae_eeff.val_egyp_gast_fina%TYPE,
        p_val_egyp_ingr_fina  vve_cred_mae_eeff.val_egyp_ingr_fina%TYPE,
        p_val_egyp_part_rela  vve_cred_mae_eeff.val_egyp_part_rela%TYPE,
        p_val_egyp_util_ordi  vve_cred_mae_eeff.val_egyp_util_ordi%TYPE,
        p_val_egyp_ingr_extr_ccja  vve_cred_mae_eeff.val_egyp_ingr_extr_ccja%TYPE,
        p_val_egyp_egre_extr_ccaja  vve_cred_mae_eeff.val_egyp_egre_extr_ccaja%TYPE,
        p_val_egyp_ingr_extr_scja  vve_cred_mae_eeff.val_egyp_ingr_extr_scja%TYPE,
        p_val_egyp_egre_extr_scja  vve_cred_mae_eeff.val_egyp_egre_extr_scja%TYPE,
        p_val_egyp_otro_ingr  vve_cred_mae_eeff.val_egyp_otro_ingr%TYPE,
        p_val_egyp_otro_egre  vve_cred_mae_eeff.val_egyp_otro_egre%TYPE,
        p_val_egyp_util_ante_imp  vve_cred_mae_eeff.val_egyp_util_ante_imp%TYPE,
        p_val_egyp_imp_part  vve_cred_mae_eeff.val_egyp_imp_part%TYPE,
        p_val_egyp_util_perd_neta  vve_cred_mae_eeff.val_egyp_util_perd_neta%TYPE,
        p_val_egyp_var_vtas_tota  vve_cred_mae_eeff.val_egyp_var_vtas_tota%TYPE,
        p_val_egyp_var_cost_vtas_serv  vve_cred_mae_eeff.val_egyp_var_cost_vtas_serv%TYPE,
        p_val_egyp_var_util_brut  vve_cred_mae_eeff.val_egyp_var_util_brut%TYPE,
        p_val_egyp_var_gast_vtas  vve_cred_mae_eeff.val_egyp_var_gast_vtas%TYPE,
        p_val_egyp_var_gast_admi  vve_cred_mae_eeff.val_egyp_var_gast_admi%TYPE,
        p_val_egyp_var_otro_ingr_gast  vve_cred_mae_eeff.val_egyp_var_otro_ingr_gast%TYPE,
        p_val_egyp_var_util_oper  vve_cred_mae_eeff.val_egyp_var_util_oper%TYPE,
        p_val_egyp_var_gast_fina  vve_cred_mae_eeff.val_egyp_var_gast_fina%TYPE,
        p_val_egyp_var_ingr_fina  vve_cred_mae_eeff.val_egyp_var_ingr_fina%TYPE,
        p_val_egyp_var_part_rela  vve_cred_mae_eeff.val_egyp_var_part_rela%TYPE,
        p_val_egyp_var_util_ordi  vve_cred_mae_eeff.val_egyp_var_util_ordi%TYPE,
        p_val_egyp_var_ingr_extr_ccja  vve_cred_mae_eeff.val_egyp_var_ingr_extr_ccja%TYPE,
        p_val_egyp_var_egre_extr_ccaja  vve_cred_mae_eeff.val_egyp_var_egre_extr_ccaja%TYPE,
        p_val_egyp_var_ingr_extr_scja  vve_cred_mae_eeff.val_egyp_var_ingr_extr_scja%TYPE,
        p_val_egyp_var_egre_extr_scja  vve_cred_mae_eeff.val_egyp_var_egre_extr_scja%TYPE,
        p_val_egyp_var_otro_ingr  vve_cred_mae_eeff.val_egyp_var_otro_ingr%TYPE,
        p_val_egyp_var_otro_egre  vve_cred_mae_eeff.val_egyp_var_otro_egre%TYPE,
        p_val_egyp_var_util_ante_imp  vve_cred_mae_eeff.val_egyp_var_util_ante_imp%TYPE,
        p_val_egyp_var_imp_part  vve_cred_mae_eeff.val_egyp_var_imp_part%TYPE,
        p_val_egyp_var_util_perd_neta  vve_cred_mae_eeff.val_egyp_var_util_perd_neta%TYPE,
        p_val_rati_capi_trab  vve_cred_mae_eeff.val_rati_capi_trab%TYPE,
        p_val_rati_dias_exist  vve_cred_mae_eeff.val_rati_dias_exist%TYPE,
        p_val_rati_cobr_clie  vve_cred_mae_eeff.val_rati_cobr_clie%TYPE,
        p_val_rati_pago_prov  vve_cred_mae_eeff.val_rati_pago_prov%TYPE,
        p_val_rati_cicl_oper  vve_cred_mae_eeff.val_rati_cicl_oper%TYPE,
        p_val_rati_pasi_tota_patr  vve_cred_mae_eeff.val_rati_pasi_tota_patr%TYPE,
        p_val_rati_deud_fina_brut  vve_cred_mae_eeff.val_rati_deud_fina_brut%TYPE,
        p_val_rati_deud_fina_estr  vve_cred_mae_eeff.val_rati_deud_fina_estr%TYPE,
        p_val_rati_porc_var_vtas  vve_cred_mae_eeff.val_rati_porc_var_vtas%TYPE,
        p_val_rati_ebitda_anual  vve_cred_mae_eeff.val_rati_ebitda_anual%TYPE,
        p_val_rati_porc_ebitda_vtas  vve_cred_mae_eeff.val_rati_porc_ebitda_vtas%TYPE,
        p_val_rati_porc_roe  vve_cred_mae_eeff.val_rati_porc_roe%TYPE,
        p_val_rati_porc_roa  vve_cred_mae_eeff.val_rati_porc_roa%TYPE,
        p_val_rati_cash_flow  vve_cred_mae_eeff.val_rati_cash_flow%TYPE,
        p_val_rati_porc_cash_flow_vtas  vve_cred_mae_eeff.val_rati_porc_cash_flow_vtas%TYPE,
        p_val_rati_deud_fina_brut_anos  vve_cred_mae_eeff.val_rati_deud_fina_brut_anos%TYPE,
        p_val_rati_deud_fina_estr_anos  vve_cred_mae_eeff.val_rati_deud_fina_estr_anos%TYPE,
        p_val_rati_deud_fina_ebitda  vve_cred_mae_eeff.val_rati_deud_fina_ebitda%TYPE,
        p_val_rati_ebitda  vve_cred_mae_eeff.val_rati_ebitda%TYPE,
        p_val_rati_depr_amor_ejer  vve_cred_mae_eeff.val_rati_depr_amor_ejer%TYPE,
        p_val_rati_divi  vve_cred_mae_eeff.val_rati_divi%TYPE,
        p_val_rati_nro_mese  vve_cred_mae_eeff.val_rati_nro_mese%TYPE,
        p_val_rati_var_depr_amor_ejer  vve_cred_mae_eeff.val_rati_var_depr_amor_ejer%TYPE,
        p_val_rati_var_divi  vve_cred_mae_eeff.val_rati_var_divi%TYPE,
        p_val_ghist_ebitda_anual  vve_cred_mae_eeff.val_ghist_ebitda_anual%TYPE,
        p_val_ghist_cash_flow_anual  vve_cred_mae_eeff.val_ghist_cash_flow_anual%TYPE,
        p_val_bg_ac_caja_bcos  vve_cred_mae_eeff.val_bg_ac_caja_bcos%TYPE,
        p_val_bg_ac_valo_nego  vve_cred_mae_eeff.val_bg_ac_valo_nego%TYPE,
        p_val_bg_ac_clie  vve_cred_mae_eeff.val_bg_ac_clie%TYPE,
        p_val_bg_ac_prov_cobr_dud  vve_cred_mae_eeff.val_bg_ac_prov_cobr_dud%TYPE,
        p_val_bg_ac_cxc_srel  vve_cred_mae_eeff.val_bg_ac_cxc_srel%TYPE,
        p_val_bg_ac_cxc_dive  vve_cred_mae_eeff.val_bg_ac_cxc_dive%TYPE,
        p_val_bg_ac_exist  vve_cred_mae_eeff.val_bg_ac_exist%TYPE,
        p_val_bg_ac_gast_paga_anti  vve_cred_mae_eeff.val_bg_ac_gast_paga_anti%TYPE,
        p_val_bg_ac  vve_cred_mae_eeff.val_bg_ac%TYPE,
        p_val_bg_anc_inve_rela  vve_cred_mae_eeff.val_bg_anc_inve_rela%TYPE,
        p_val_bg_anc_otra_inve  vve_cred_mae_eeff.val_bg_anc_otra_inve%TYPE,
        p_val_bg_anc_cxc_srel  vve_cred_mae_eeff.val_bg_anc_cxc_srel%TYPE,
        p_val_bg_anc_inmu_neto  vve_cred_mae_eeff.val_bg_anc_inmu_neto%TYPE,
        p_val_bg_anc_terr  vve_cred_mae_eeff.val_bg_anc_terr%TYPE,
        p_val_bg_anc_edif  vve_cred_mae_eeff.val_bg_anc_edif%TYPE,
        p_val_bg_anc_maqu  vve_cred_mae_eeff.val_bg_anc_maqu%TYPE,
        p_val_bg_anc_mueb  vve_cred_mae_eeff.val_bg_anc_mueb%TYPE,
        p_val_bg_anc_unid_trans  vve_cred_mae_eeff.val_bg_anc_unid_trans%TYPE,
        p_val_bg_anc_equi_dive  vve_cred_mae_eeff.val_bg_anc_equi_dive%TYPE,
        p_val_bg_anc_depr_acum  vve_cred_mae_eeff.val_bg_anc_depr_acum%TYPE,
        p_val_bg_anc_trab  vve_cred_mae_eeff.val_bg_anc_trab%TYPE,
        p_val_bg_anc_otro_acti  vve_cred_mae_eeff.val_bg_anc_otro_acti%TYPE,
        p_val_bg_anc_intan  vve_cred_mae_eeff.val_bg_anc_intan%TYPE,
        p_val_bg_anc_otro_anc  vve_cred_mae_eeff.val_bg_anc_otro_anc%TYPE,
        p_val_bg_anc  vve_cred_mae_eeff.val_bg_anc%TYPE,
        p_val_bg_tota_acti  vve_cred_mae_eeff.val_bg_tota_acti%TYPE,
        p_val_bg_pc_banc_deud_fina_cp  vve_cred_mae_eeff.val_bg_pc_banc_deud_fina_cp%TYPE,
        p_val_bg_pc_otra_deud_fina_cp  vve_cred_mae_eeff.val_bg_pc_otra_deud_fina_cp%TYPE,
        p_val_bg_pc_deud_lp  vve_cred_mae_eeff.val_bg_pc_deud_lp%TYPE,
        p_val_bg_pc_trib_paga  vve_cred_mae_eeff.val_bg_pc_trib_paga%TYPE,
        p_val_bg_pc_remu_paga  vve_cred_mae_eeff.val_bg_pc_remu_paga%TYPE,
        p_val_bg_pc_prov  vve_cred_mae_eeff.val_bg_pc_prov%TYPE,
        p_val_bg_pc_cxp_srel  vve_cred_mae_eeff.val_bg_pc_cxp_srel%TYPE,
        p_val_bg_pc_cxp_dive  vve_cred_mae_eeff.val_bg_pc_cxp_dive%TYPE,
        p_val_bg_pc  vve_cred_mae_eeff.val_bg_pc%TYPE,
        p_val_bg_pnc_bcos_deud_fina_lp  vve_cred_mae_eeff.val_bg_pnc_bcos_deud_fina_lp%TYPE,
        p_val_bg_pnc_otra_deud_fina_lp  vve_cred_mae_eeff.val_bg_pnc_otra_deud_fina_lp%TYPE,
        p_val_bg_pnc_cxp_srel  vve_cred_mae_eeff.val_bg_pnc_cxp_srel%TYPE,
        p_val_bg_pnc_otro_pnc  vve_cred_mae_eeff.val_bg_pnc_otro_pnc%TYPE,
        p_val_bg_pnc_gana_dife  vve_cred_mae_eeff.val_bg_pnc_gana_dife%TYPE,
        p_val_bg_pnc  vve_cred_mae_eeff.val_bg_pnc%TYPE,
        p_val_bg_tota_pasi  vve_cred_mae_eeff.val_bg_tota_pasi%TYPE,
        p_val_bg_pat_capi  vve_cred_mae_eeff.val_bg_pat_capi%TYPE,
        p_val_bg_pat_cap_adic  vve_cred_mae_eeff.val_bg_pat_cap_adic%TYPE,
        p_val_bg_pat_exce_reva  vve_cred_mae_eeff.val_bg_pat_exce_reva%TYPE,
        p_val_bg_pat_rese  vve_cred_mae_eeff.val_bg_pat_rese%TYPE,
        p_val_bg_pat_resu_acum  vve_cred_mae_eeff.val_bg_pat_resu_acum%TYPE,
        p_val_bg_pat_resu_ejer  vve_cred_mae_eeff.val_bg_pat_resu_ejer%TYPE,
        p_val_bg_pat_otro  vve_cred_mae_eeff.val_bg_pat_otro%TYPE,
        p_val_bg_pat  vve_cred_mae_eeff.val_bg_pat%TYPE,
        p_val_tota_pasi_patr  vve_cred_mae_eeff.val_tota_pasi_patr%TYPE,
        p_val_cdre_acti_pasi_patr  vve_cred_mae_eeff.val_cdre_acti_pasi_patr%TYPE,
        p_val_bg_var_ac_caja_bcos  vve_cred_mae_eeff.val_bg_var_ac_caja_bcos%TYPE,
        p_val_bg_var_ac_valo_nego  vve_cred_mae_eeff.val_bg_var_ac_valo_nego%TYPE,
        p_val_bg_var_ac_clie  vve_cred_mae_eeff.val_bg_var_ac_clie%TYPE,
        p_val_bg_var_ac_prov_cobr_dud  vve_cred_mae_eeff.val_bg_var_ac_prov_cobr_dud%TYPE,
        p_val_bg_var_ac_cxc_srel  vve_cred_mae_eeff.val_bg_var_ac_cxc_srel%TYPE,
        p_val_bg_var_ac_cxc_dive  vve_cred_mae_eeff.val_bg_var_ac_cxc_dive%TYPE,
        p_val_bg_var_ac_exist  vve_cred_mae_eeff.val_bg_var_ac_exist%TYPE,
        p_val_bg_var_ac_gast_paga_anti  vve_cred_mae_eeff.val_bg_var_ac_gast_paga_anti%TYPE,
        p_val_bg_var_ac  vve_cred_mae_eeff.val_bg_var_ac%TYPE,
        p_val_bg_var_anc_inve_rela  vve_cred_mae_eeff.val_bg_var_anc_inve_rela%TYPE,
        p_val_bg_var_anc_otra_inve  vve_cred_mae_eeff.val_bg_var_anc_otra_inve%TYPE,
        p_val_bg_var_anc_cxc_srel  vve_cred_mae_eeff.val_bg_var_anc_cxc_srel%TYPE,
        p_val_bg_var_anc_inmu_neto  vve_cred_mae_eeff.val_bg_var_anc_inmu_neto%TYPE,
        p_val_bg_var_anc_terr  vve_cred_mae_eeff.val_bg_var_anc_terr%TYPE,
        p_val_bg_var_anc_edif  vve_cred_mae_eeff.val_bg_var_anc_edif%TYPE,
        p_val_bg_var_anc_maqu  vve_cred_mae_eeff.val_bg_var_anc_maqu%TYPE,
        p_val_bg_var_anc_mueb  vve_cred_mae_eeff.val_bg_var_anc_mueb%TYPE,
        p_val_bg_var_anc_unid_trans  vve_cred_mae_eeff.val_bg_var_anc_unid_trans%TYPE,
        p_val_bg_var_anc_equi_dive  vve_cred_mae_eeff.val_bg_var_anc_equi_dive%TYPE,
        p_val_bg_var_anc_depr_acum  vve_cred_mae_eeff.val_bg_var_anc_depr_acum%TYPE,
        p_val_bg_var_anc_trab  vve_cred_mae_eeff.val_bg_var_anc_trab%TYPE,
        p_val_bg_var_anc_otro_acti  vve_cred_mae_eeff.val_bg_var_anc_otro_acti%TYPE,
        p_val_bg_var_anc_intan  vve_cred_mae_eeff.val_bg_var_anc_intan%TYPE,
        p_val_bg_var_anc_otro_anc  vve_cred_mae_eeff.val_bg_var_anc_otro_anc%TYPE,
        p_val_bg_var_anc  vve_cred_mae_eeff.val_bg_var_anc%TYPE,
        p_val_bg_var_tota_acti  vve_cred_mae_eeff.val_bg_var_tota_acti%TYPE,
        p_val_bg_var_pc_banc_dfina_cp  vve_cred_mae_eeff.val_bg_var_pc_banc_dfina_cp%TYPE,
        p_val_bg_var_pc_otra_dfina_cp  vve_cred_mae_eeff.val_bg_var_pc_otra_dfina_cp%TYPE,
        p_val_bg_var_pc_deud_lp  vve_cred_mae_eeff.val_bg_var_pc_deud_lp%TYPE,
        p_val_bg_var_pc_trib_paga  vve_cred_mae_eeff.val_bg_var_pc_trib_paga%TYPE,
        p_val_bg_var_pc_remu_paga  vve_cred_mae_eeff.val_bg_var_pc_remu_paga%TYPE,
        p_val_bg_var_pc_prov  vve_cred_mae_eeff.val_bg_var_pc_prov%TYPE,
        p_val_bg_var_pc_cxp_srel  vve_cred_mae_eeff.val_bg_var_pc_cxp_srel%TYPE,
        p_val_bg_var_pc_cxp_dive  vve_cred_mae_eeff.val_bg_var_pc_cxp_dive%TYPE,
        p_val_bg_var_pc  vve_cred_mae_eeff.val_bg_var_pc%TYPE,
        p_val_bg_var_pnc_bcos_dfina_lp  vve_cred_mae_eeff.val_bg_var_pnc_bcos_dfina_lp%TYPE,
        p_val_bg_var_pnc_otra_dfina_lp  vve_cred_mae_eeff.val_bg_var_pnc_otra_dfina_lp%TYPE,
        p_val_bg_var_pnc_cxp_srel  vve_cred_mae_eeff.val_bg_var_pnc_cxp_srel%TYPE,
        p_val_bg_var_pnc_otro_pnc  vve_cred_mae_eeff.val_bg_var_pnc_otro_pnc%TYPE,
        p_val_bg_var_pnc_gana_dife  vve_cred_mae_eeff.val_bg_var_pnc_gana_dife%TYPE,
        p_val_bg_var_pnc  vve_cred_mae_eeff.val_bg_var_pnc%TYPE,
        p_val_bg_var_tota_pasi  vve_cred_mae_eeff.val_bg_var_tota_pasi%TYPE,
        p_val_bg_var_pat_capi  vve_cred_mae_eeff.val_bg_var_pat_capi%TYPE,
        p_val_bg_var_pat_cap_adic  vve_cred_mae_eeff.val_bg_var_pat_cap_adic%TYPE,
        p_val_bg_var_pat_exce_reva  vve_cred_mae_eeff.val_bg_var_pat_exce_reva%TYPE,
        p_val_bg_var_pat_rese  vve_cred_mae_eeff.val_bg_var_pat_rese%TYPE,
        p_val_bg_var_pat_resu_acum  vve_cred_mae_eeff.val_bg_var_pat_resu_acum%TYPE,
        p_val_bg_var_pat_resu_ejer  vve_cred_mae_eeff.val_bg_var_pat_resu_ejer%TYPE,
        p_val_bg_var_pat_otro  vve_cred_mae_eeff.val_bg_var_pat_otro%TYPE,
        p_val_bg_var_pat  vve_cred_mae_eeff.val_bg_var_pat%TYPE,
        p_val_var_tota_pasi_patr   vve_cred_mae_eeff.val_var_tota_pasi_patr %TYPE,
        p_cod_usua_sid      IN sistemas.usuarios.co_usuario%TYPE,
        p_cod_usua_web      IN sistemas.sis_mae_usuario.cod_id_usuario%TYPE,
        p_ret_esta          OUT NUMBER,
        p_ret_mens          OUT VARCHAR2
  ) AS
    v_cod_mae_eeff VARCHAR2(10);
    v_cod_mae_eeff_seq NUMBER(15);
    v_cod_mae_eeff_soli VARCHAR2(10);
  BEGIN

    BEGIN
        SELECT m.cod_mae_eeff
          INTO v_cod_mae_eeff
          FROM vve_cred_mae_eeff m,
               vve_cred_soli_eeff s
         WHERE s.cod_mae_eeff = m.cod_mae_eeff
           AND s.val_ano_eeff = p_val_ano_eeff
           AND s.cod_cliente = p_cod_cliente
           AND s.ind_matu is null;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
         v_cod_mae_eeff:=NULL;
    END;  

    --<I Req. 87567 E2.1 ID## avilca 24/12/2020>
    BEGIN
        SELECT m.cod_mae_eeff
          INTO v_cod_mae_eeff_soli
          FROM vve_cred_mae_eeff m,
               vve_cred_soli_eeff s
         WHERE s.cod_mae_eeff = m.cod_mae_eeff
           AND s.val_ano_eeff = p_val_ano_eeff
           AND s.cod_cliente = p_cod_cliente
           AND s.cod_soli_cred = p_cod_solicitud
           AND s.ind_matu is null;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
         v_cod_mae_eeff_soli:=NULL;
    END; 
    --<F Req. 87567 E2.1 ID## avilca 24/12/2020>

        IF v_cod_mae_eeff IS NOT NULL THEN
             UPDATE vve_cred_mae_eeff 
                SET val_egyp_vtas_tota=p_val_egyp_vtas_tota,
                    val_egyp_cost_vtas_serv=p_val_egyp_cost_vtas_serv,
                    val_egyp_util_brut=p_val_egyp_util_brut,
                    val_egyp_gast_vtas=p_val_egyp_gast_vtas,
                    val_egyp_gast_admi=p_val_egyp_gast_admi,
                    val_egyp_otro_ingr_gast=p_val_egyp_otro_ingr_gast,
                    val_egyp_util_oper=p_val_egyp_util_oper,
                    val_egyp_gast_fina=p_val_egyp_gast_fina,
                    val_egyp_ingr_fina=p_val_egyp_ingr_fina,
                    val_egyp_part_rela=p_val_egyp_part_rela,
                    val_egyp_util_ordi=p_val_egyp_util_ordi,
                    val_egyp_ingr_extr_ccja=p_val_egyp_ingr_extr_ccja,
                    val_egyp_egre_extr_ccaja=p_val_egyp_egre_extr_ccaja,
                    val_egyp_ingr_extr_scja=p_val_egyp_ingr_extr_scja,
                    val_egyp_egre_extr_scja=p_val_egyp_egre_extr_scja,
                    val_egyp_otro_ingr=p_val_egyp_otro_ingr,
                    val_egyp_otro_egre=p_val_egyp_otro_egre,
                    val_egyp_util_ante_imp=p_val_egyp_util_ante_imp,
                    val_egyp_imp_part=p_val_egyp_imp_part,
                    val_egyp_util_perd_neta=p_val_egyp_util_perd_neta,
                    val_egyp_var_vtas_tota=p_val_egyp_var_vtas_tota,
                    val_egyp_var_cost_vtas_serv=p_val_egyp_var_cost_vtas_serv,
                    val_egyp_var_util_brut=p_val_egyp_var_util_brut,
                    val_egyp_var_gast_vtas=p_val_egyp_var_gast_vtas,
                    val_egyp_var_gast_admi=p_val_egyp_var_gast_admi,
                    val_egyp_var_otro_ingr_gast=p_val_egyp_var_otro_ingr_gast,
                    val_egyp_var_util_oper=p_val_egyp_var_util_oper,
                    val_egyp_var_gast_fina=p_val_egyp_var_gast_fina,
                    val_egyp_var_ingr_fina=p_val_egyp_var_ingr_fina,
                    val_egyp_var_part_rela=p_val_egyp_var_part_rela,
                    val_egyp_var_util_ordi=p_val_egyp_var_util_ordi,
                    val_egyp_var_ingr_extr_ccja=p_val_egyp_var_ingr_extr_ccja,
                    val_egyp_var_egre_extr_ccaja=p_val_egyp_var_egre_extr_ccaja,
                    val_egyp_var_ingr_extr_scja=p_val_egyp_var_ingr_extr_scja,
                    val_egyp_var_egre_extr_scja=p_val_egyp_var_egre_extr_scja,
                    val_egyp_var_otro_ingr=p_val_egyp_var_otro_ingr,
                    val_egyp_var_otro_egre=p_val_egyp_var_otro_egre,
                    val_egyp_var_util_ante_imp=p_val_egyp_var_util_ante_imp,
                    val_egyp_var_imp_part=p_val_egyp_var_imp_part,
                    val_egyp_var_util_perd_neta=p_val_egyp_var_util_perd_neta,
                    val_rati_capi_trab=p_val_rati_capi_trab,
                    val_rati_dias_exist=p_val_rati_dias_exist,
                    val_rati_cobr_clie=p_val_rati_cobr_clie,
                    val_rati_pago_prov=p_val_rati_pago_prov,
                    val_rati_cicl_oper=p_val_rati_cicl_oper,
                    val_rati_pasi_tota_patr=p_val_rati_pasi_tota_patr,
                    val_rati_deud_fina_brut=p_val_rati_deud_fina_brut,
                    val_rati_deud_fina_estr=p_val_rati_deud_fina_estr,
                    val_rati_porc_var_vtas=p_val_rati_porc_var_vtas,
                    val_rati_ebitda_anual=p_val_rati_ebitda_anual,
                    val_rati_porc_ebitda_vtas=p_val_rati_porc_ebitda_vtas,
                    val_rati_porc_roe=p_val_rati_porc_roe,
                    val_rati_porc_roa=p_val_rati_porc_roa,
                    val_rati_cash_flow=p_val_rati_cash_flow,
                    val_rati_porc_cash_flow_vtas=p_val_rati_porc_cash_flow_vtas,
                    val_rati_deud_fina_brut_anos=p_val_rati_deud_fina_brut_anos,
                    val_rati_deud_fina_estr_anos=p_val_rati_deud_fina_estr_anos,
                    val_rati_deud_fina_ebitda=p_val_rati_deud_fina_ebitda,
                    val_rati_ebitda=p_val_rati_ebitda,
                    val_rati_depr_amor_ejer=p_val_rati_depr_amor_ejer,
                    val_rati_divi=p_val_rati_divi,
                    val_rati_nro_mese=p_val_rati_nro_mese,
                    val_rati_var_depr_amor_ejer=p_val_rati_var_depr_amor_ejer,
                    val_rati_var_divi=p_val_rati_var_divi,
                    val_ghist_ebitda_anual=p_val_ghist_ebitda_anual,
                    val_ghist_cash_flow_anual=p_val_ghist_cash_flow_anual,
                    val_bg_ac_caja_bcos=p_val_bg_ac_caja_bcos,
                    val_bg_ac_valo_nego=p_val_bg_ac_valo_nego,
                    val_bg_ac_clie=p_val_bg_ac_clie,
                    val_bg_ac_prov_cobr_dud=p_val_bg_ac_prov_cobr_dud,
                    val_bg_ac_cxc_srel=p_val_bg_ac_cxc_srel,
                    val_bg_ac_cxc_dive=p_val_bg_ac_cxc_dive,
                    val_bg_ac_exist=p_val_bg_ac_exist,
                    val_bg_ac_gast_paga_anti=p_val_bg_ac_gast_paga_anti,
                    val_bg_ac=p_val_bg_ac,
                    val_bg_anc_inve_rela=p_val_bg_anc_inve_rela,
                    val_bg_anc_otra_inve=p_val_bg_anc_otra_inve,
                    val_bg_anc_cxc_srel=p_val_bg_anc_cxc_srel,
                    val_bg_anc_inmu_neto=p_val_bg_anc_inmu_neto,
                    val_bg_anc_terr=p_val_bg_anc_terr,
                    val_bg_anc_edif=p_val_bg_anc_edif,
                    val_bg_anc_maqu=p_val_bg_anc_maqu,
                    val_bg_anc_mueb=p_val_bg_anc_mueb,
                    val_bg_anc_unid_trans=p_val_bg_anc_unid_trans,
                    val_bg_anc_equi_dive=p_val_bg_anc_equi_dive,
                    val_bg_anc_depr_acum=p_val_bg_anc_depr_acum,
                    val_bg_anc_trab=p_val_bg_anc_trab,
                    val_bg_anc_otro_acti=p_val_bg_anc_otro_acti,
                    val_bg_anc_intan=p_val_bg_anc_intan,
                    val_bg_anc_otro_anc=p_val_bg_anc_otro_anc,
                    val_bg_anc=p_val_bg_anc,
                    val_bg_tota_acti=p_val_bg_tota_acti,
                    val_bg_pc_banc_deud_fina_cp=p_val_bg_pc_banc_deud_fina_cp,
                    val_bg_pc_otra_deud_fina_cp=p_val_bg_pc_otra_deud_fina_cp,
                    val_bg_pc_deud_lp=p_val_bg_pc_deud_lp,
                    val_bg_pc_trib_paga=p_val_bg_pc_trib_paga,
                    val_bg_pc_remu_paga=p_val_bg_pc_remu_paga,
                    val_bg_pc_prov=p_val_bg_pc_prov,
                    val_bg_pc_cxp_srel=p_val_bg_pc_cxp_srel,
                    val_bg_pc_cxp_dive=p_val_bg_pc_cxp_dive,
                    val_bg_pc=p_val_bg_pc,
                    val_bg_pnc_bcos_deud_fina_lp=p_val_bg_pnc_bcos_deud_fina_lp,
                    val_bg_pnc_otra_deud_fina_lp=p_val_bg_pnc_otra_deud_fina_lp,
                    val_bg_pnc_cxp_srel=p_val_bg_pnc_cxp_srel,
                    val_bg_pnc_otro_pnc=p_val_bg_pnc_otro_pnc,
                    val_bg_pnc_gana_dife=p_val_bg_pnc_gana_dife,
                    val_bg_pnc=p_val_bg_pnc,
                    val_bg_tota_pasi=p_val_bg_tota_pasi,
                    val_bg_pat_capi=p_val_bg_pat_capi,
                    val_bg_pat_cap_adic=p_val_bg_pat_cap_adic,
                    val_bg_pat_exce_reva=p_val_bg_pat_exce_reva,
                    val_bg_pat_rese=p_val_bg_pat_rese,
                    val_bg_pat_resu_acum=p_val_bg_pat_resu_acum,
                    val_bg_pat_resu_ejer=p_val_bg_pat_resu_ejer,
                    val_bg_pat_otro=p_val_bg_pat_otro,
                    val_bg_pat=p_val_bg_pat,
                    val_tota_pasi_patr=p_val_tota_pasi_patr,
                    val_cdre_acti_pasi_patr=p_val_cdre_acti_pasi_patr,
                    val_bg_var_ac_caja_bcos=p_val_bg_var_ac_caja_bcos,
                    val_bg_var_ac_valo_nego=p_val_bg_var_ac_valo_nego,
                    val_bg_var_ac_clie=p_val_bg_var_ac_clie,
                    val_bg_var_ac_prov_cobr_dud=p_val_bg_var_ac_prov_cobr_dud,
                    val_bg_var_ac_cxc_srel=p_val_bg_var_ac_cxc_srel,
                    val_bg_var_ac_cxc_dive=p_val_bg_var_ac_cxc_dive,
                    val_bg_var_ac_exist=p_val_bg_var_ac_exist,
                    val_bg_var_ac_gast_paga_anti=p_val_bg_var_ac_gast_paga_anti,
                    val_bg_var_ac=p_val_bg_var_ac,
                    val_bg_var_anc_inve_rela=p_val_bg_var_anc_inve_rela,
                    val_bg_var_anc_otra_inve=p_val_bg_var_anc_otra_inve,
                    val_bg_var_anc_cxc_srel=p_val_bg_var_anc_cxc_srel,
                    val_bg_var_anc_inmu_neto=p_val_bg_var_anc_inmu_neto,
                    val_bg_var_anc_terr=p_val_bg_var_anc_terr,
                    val_bg_var_anc_edif=p_val_bg_var_anc_edif,
                    val_bg_var_anc_maqu=p_val_bg_var_anc_maqu,
                    val_bg_var_anc_mueb=p_val_bg_var_anc_mueb,
                    val_bg_var_anc_unid_trans=p_val_bg_var_anc_unid_trans,
                    val_bg_var_anc_equi_dive=p_val_bg_var_anc_equi_dive,
                    val_bg_var_anc_depr_acum=p_val_bg_var_anc_depr_acum,
                    val_bg_var_anc_trab=p_val_bg_var_anc_trab,
                    val_bg_var_anc_otro_acti=p_val_bg_var_anc_otro_acti,
                    val_bg_var_anc_intan=p_val_bg_var_anc_intan,
                    val_bg_var_anc_otro_anc=p_val_bg_var_anc_otro_anc,
                    val_bg_var_anc=p_val_bg_var_anc,
                    val_bg_var_tota_acti=p_val_bg_var_tota_acti,
                    val_bg_var_pc_banc_dfina_cp=p_val_bg_var_pc_banc_dfina_cp,
                    val_bg_var_pc_otra_dfina_cp=p_val_bg_var_pc_otra_dfina_cp,
                    val_bg_var_pc_deud_lp=p_val_bg_var_pc_deud_lp,
                    val_bg_var_pc_trib_paga=p_val_bg_var_pc_trib_paga,
                    val_bg_var_pc_remu_paga=p_val_bg_var_pc_remu_paga,
                    val_bg_var_pc_prov=p_val_bg_var_pc_prov,
                    val_bg_var_pc_cxp_srel=p_val_bg_var_pc_cxp_srel,
                    val_bg_var_pc_cxp_dive=p_val_bg_var_pc_cxp_dive,
                    val_bg_var_pc=p_val_bg_var_pc,
                    val_bg_var_pnc_bcos_dfina_lp=p_val_bg_var_pnc_bcos_dfina_lp,
                    val_bg_var_pnc_otra_dfina_lp=p_val_bg_var_pnc_otra_dfina_lp,
                    val_bg_var_pnc_cxp_srel=p_val_bg_var_pnc_cxp_srel,
                    val_bg_var_pnc_otro_pnc=p_val_bg_var_pnc_otro_pnc,
                    val_bg_var_pnc_gana_dife=p_val_bg_var_pnc_gana_dife,
                    val_bg_var_pnc=p_val_bg_var_pnc,
                    val_bg_var_tota_pasi=p_val_bg_var_tota_pasi,
                    val_bg_var_pat_capi=p_val_bg_var_pat_capi,
                    val_bg_var_pat_cap_adic=p_val_bg_var_pat_cap_adic,
                    val_bg_var_pat_exce_reva=p_val_bg_var_pat_exce_reva,
                    val_bg_var_pat_rese=p_val_bg_var_pat_rese,
                    val_bg_var_pat_resu_acum=p_val_bg_var_pat_resu_acum,
                    val_bg_var_pat_resu_ejer=p_val_bg_var_pat_resu_ejer,
                    val_bg_var_pat_otro=p_val_bg_var_pat_otro,
                    val_bg_var_pat=p_val_bg_var_pat,
                    val_var_tota_pasi_patr=p_val_var_tota_pasi_patr,
                    cod_usua_modi_reg = p_cod_usua_sid,--<I Req. 87567 E2.1 ID## avilca 17/02/2020>
                    fec_modi_reg = sysdate      --<I Req. 87567 E2.1 ID## avilca  17/02/2020>           
              WHERE cod_mae_eeff = v_cod_mae_eeff;

              --<I Req. 87567 E2.1 ID## avilca 17/02/2020>
              IF v_cod_mae_eeff_soli IS NULL THEN

                INSERT INTO vve_cred_soli_eeff (
                    cod_soli_cred,
                    val_ano_eeff,
                    cod_mae_eeff,
                    cod_cliente,
                    cod_usua_crea_regi,
                    fec_crea_regi
                ) VALUES (
                    p_cod_solicitud,
                    p_val_ano_eeff,
                    v_cod_mae_eeff,
                    p_cod_cliente,
                    p_cod_usua_sid,
                    SYSDATE
                ); 

              END IF;
            --<F Req. 87567 E2.1 ID## avilca 17/02/2020>
    ELSE
         SELECT SEQ_CRED_MAE_EFF.NEXTVAL
           INTO v_cod_mae_eeff_seq
           FROM DUAL;

         SELECT LPAD(v_cod_mae_eeff_seq,10,'0')
           INTO v_cod_mae_eeff
           FROM DUAL;

            INSERT INTO vve_cred_mae_eeff ( cod_mae_eeff,
                                            cod_cliente,
                                            val_ano_eeff,
                                            cod_mone_eeff,
                                            val_egyp_vtas_tota,
                                            val_egyp_cost_vtas_serv,
                                            val_egyp_util_brut,
                                            val_egyp_gast_vtas,
                                            val_egyp_gast_admi,
                                            val_egyp_otro_ingr_gast,
                                            val_egyp_util_oper,
                                            val_egyp_gast_fina,
                                            val_egyp_ingr_fina,
                                            val_egyp_part_rela,
                                            val_egyp_util_ordi,
                                            val_egyp_ingr_extr_ccja,
                                            val_egyp_egre_extr_ccaja,
                                            val_egyp_ingr_extr_scja,
                                            val_egyp_egre_extr_scja,
                                            val_egyp_otro_ingr,
                                            val_egyp_otro_egre,
                                            val_egyp_util_ante_imp,
                                            val_egyp_imp_part,
                                            val_egyp_util_perd_neta,
                                            val_egyp_var_vtas_tota,
                                            val_egyp_var_cost_vtas_serv,
                                            val_egyp_var_util_brut,
                                            val_egyp_var_gast_vtas,
                                            val_egyp_var_gast_admi,
                                            val_egyp_var_otro_ingr_gast,
                                            val_egyp_var_util_oper,
                                            val_egyp_var_gast_fina,
                                            val_egyp_var_ingr_fina,
                                            val_egyp_var_part_rela,
                                            val_egyp_var_util_ordi,
                                            val_egyp_var_ingr_extr_ccja,
                                            val_egyp_var_egre_extr_ccaja,
                                            val_egyp_var_ingr_extr_scja,
                                            val_egyp_var_egre_extr_scja,
                                            val_egyp_var_otro_ingr,
                                            val_egyp_var_otro_egre,
                                            val_egyp_var_util_ante_imp,
                                            val_egyp_var_imp_part,
                                            val_egyp_var_util_perd_neta,
                                            val_rati_capi_trab,
                                            val_rati_dias_exist,
                                            val_rati_cobr_clie,
                                            val_rati_pago_prov,
                                            val_rati_cicl_oper,
                                            val_rati_pasi_tota_patr,
                                            val_rati_deud_fina_brut,
                                            val_rati_deud_fina_estr,
                                            val_rati_porc_var_vtas,
                                            val_rati_ebitda_anual,
                                            val_rati_porc_ebitda_vtas,
                                            val_rati_porc_roe,
                                            val_rati_porc_roa,
                                            val_rati_cash_flow,
                                            val_rati_porc_cash_flow_vtas,
                                            val_rati_deud_fina_brut_anos,
                                            val_rati_deud_fina_estr_anos,
                                            val_rati_deud_fina_ebitda,
                                            val_rati_ebitda,
                                            val_rati_depr_amor_ejer,
                                            val_rati_divi,
                                            val_rati_nro_mese,
                                            val_rati_var_depr_amor_ejer,
                                            val_rati_var_divi,
                                            val_ghist_ebitda_anual,
                                            val_ghist_cash_flow_anual,
                                            val_bg_ac_caja_bcos,
                                            val_bg_ac_valo_nego,
                                            val_bg_ac_clie,
                                            val_bg_ac_prov_cobr_dud,
                                            val_bg_ac_cxc_srel,
                                            val_bg_ac_cxc_dive,
                                            val_bg_ac_exist,
                                            val_bg_ac_gast_paga_anti,
                                            val_bg_ac,
                                            val_bg_anc_inve_rela,
                                            val_bg_anc_otra_inve,
                                            val_bg_anc_cxc_srel,
                                            val_bg_anc_inmu_neto,
                                            val_bg_anc_terr,
                                            val_bg_anc_edif,
                                            val_bg_anc_maqu,
                                            val_bg_anc_mueb,
                                            val_bg_anc_unid_trans,
                                            val_bg_anc_equi_dive,
                                            val_bg_anc_depr_acum,
                                            val_bg_anc_trab,
                                            val_bg_anc_otro_acti,
                                            val_bg_anc_intan,
                                            val_bg_anc_otro_anc,
                                            val_bg_anc,
                                            val_bg_tota_acti,
                                            val_bg_pc_banc_deud_fina_cp,
                                            val_bg_pc_otra_deud_fina_cp,
                                            val_bg_pc_deud_lp,
                                            val_bg_pc_trib_paga,
                                            val_bg_pc_remu_paga,
                                            val_bg_pc_prov,
                                            val_bg_pc_cxp_srel,
                                            val_bg_pc_cxp_dive,
                                            val_bg_pc,
                                            val_bg_pnc_bcos_deud_fina_lp,
                                            val_bg_pnc_otra_deud_fina_lp,
                                            val_bg_pnc_cxp_srel,
                                            val_bg_pnc_otro_pnc,
                                            val_bg_pnc_gana_dife,
                                            val_bg_pnc,
                                            val_bg_tota_pasi,
                                            val_bg_pat_capi,
                                            val_bg_pat_cap_adic,
                                            val_bg_pat_exce_reva,
                                            val_bg_pat_rese,
                                            val_bg_pat_resu_acum,
                                            val_bg_pat_resu_ejer,
                                            val_bg_pat_otro,
                                            val_bg_pat,
                                            val_tota_pasi_patr,
                                            val_cdre_acti_pasi_patr,
                                            val_bg_var_ac_caja_bcos,
                                            val_bg_var_ac_valo_nego,
                                            val_bg_var_ac_clie,
                                            val_bg_var_ac_prov_cobr_dud,
                                            val_bg_var_ac_cxc_srel,
                                            val_bg_var_ac_cxc_dive,
                                            val_bg_var_ac_exist,
                                            val_bg_var_ac_gast_paga_anti,
                                            val_bg_var_ac,
                                            val_bg_var_anc_inve_rela,
                                            val_bg_var_anc_otra_inve,
                                            val_bg_var_anc_cxc_srel,
                                            val_bg_var_anc_inmu_neto,
                                            val_bg_var_anc_terr,
                                            val_bg_var_anc_edif,
                                            val_bg_var_anc_maqu,
                                            val_bg_var_anc_mueb,
                                            val_bg_var_anc_unid_trans,
                                            val_bg_var_anc_equi_dive,
                                            val_bg_var_anc_depr_acum,
                                            val_bg_var_anc_trab,
                                            val_bg_var_anc_otro_acti,
                                            val_bg_var_anc_intan,
                                            val_bg_var_anc_otro_anc,
                                            val_bg_var_anc,
                                            val_bg_var_tota_acti,
                                            val_bg_var_pc_banc_dfina_cp,
                                            val_bg_var_pc_otra_dfina_cp,
                                            val_bg_var_pc_deud_lp,
                                            val_bg_var_pc_trib_paga,
                                            val_bg_var_pc_remu_paga,
                                            val_bg_var_pc_prov,
                                            val_bg_var_pc_cxp_srel,
                                            val_bg_var_pc_cxp_dive,
                                            val_bg_var_pc,
                                            val_bg_var_pnc_bcos_dfina_lp,
                                            val_bg_var_pnc_otra_dfina_lp,
                                            val_bg_var_pnc_cxp_srel,
                                            val_bg_var_pnc_otro_pnc,
                                            val_bg_var_pnc_gana_dife,
                                            val_bg_var_pnc,
                                            val_bg_var_tota_pasi,
                                            val_bg_var_pat_capi,
                                            val_bg_var_pat_cap_adic,
                                            val_bg_var_pat_exce_reva,
                                            val_bg_var_pat_rese,
                                            val_bg_var_pat_resu_acum,
                                            val_bg_var_pat_resu_ejer,
                                            val_bg_var_pat_otro,
                                            val_bg_var_pat,
                                            val_var_tota_pasi_patr,
                                            cod_usua_modi_reg,--<I Req. 87567 E2.1 ID## avilca  17/02/2020> 
                                            fec_modi_reg  --<I Req. 87567 E2.1 ID## avilca  17/02/2020> 
                                        ) VALUES (
                                            v_cod_mae_eeff,--TO_NUMBER(p_cod_mae_eeff),
                                            p_cod_cliente,
                                            p_val_ano_eeff,
                                            p_cod_mone_eeff,
                                            p_val_egyp_vtas_tota,
                                            p_val_egyp_cost_vtas_serv,
                                            p_val_egyp_util_brut,
                                            p_val_egyp_gast_vtas,
                                            p_val_egyp_gast_admi,
                                            p_val_egyp_otro_ingr_gast,
                                            p_val_egyp_util_oper,
                                            p_val_egyp_gast_fina,
                                            p_val_egyp_ingr_fina,
                                            p_val_egyp_part_rela,
                                            p_val_egyp_util_ordi,
                                            p_val_egyp_ingr_extr_ccja,
                                            p_val_egyp_egre_extr_ccaja,
                                            p_val_egyp_ingr_extr_scja,
                                            p_val_egyp_egre_extr_scja,
                                            p_val_egyp_otro_ingr,
                                            p_val_egyp_otro_egre,
                                            p_val_egyp_util_ante_imp,
                                            p_val_egyp_imp_part,
                                            p_val_egyp_util_perd_neta,
                                            p_val_egyp_var_vtas_tota,
                                            p_val_egyp_var_cost_vtas_serv,
                                            p_val_egyp_var_util_brut,
                                            p_val_egyp_var_gast_vtas,
                                            p_val_egyp_var_gast_admi,
                                            p_val_egyp_var_otro_ingr_gast,
                                            p_val_egyp_var_util_oper,
                                            p_val_egyp_var_gast_fina,
                                            p_val_egyp_var_ingr_fina,
                                            p_val_egyp_var_part_rela,
                                            p_val_egyp_var_util_ordi,
                                            p_val_egyp_var_ingr_extr_ccja,
                                            p_val_egyp_var_egre_extr_ccaja,
                                            p_val_egyp_var_ingr_extr_scja,
                                            p_val_egyp_var_egre_extr_scja,
                                            p_val_egyp_var_otro_ingr,
                                            p_val_egyp_var_otro_egre,
                                            p_val_egyp_var_util_ante_imp,
                                            p_val_egyp_var_imp_part,
                                            p_val_egyp_var_util_perd_neta,
                                            p_val_rati_capi_trab,
                                            p_val_rati_dias_exist,
                                            p_val_rati_cobr_clie,
                                            p_val_rati_pago_prov,
                                            p_val_rati_cicl_oper,
                                            p_val_rati_pasi_tota_patr,
                                            p_val_rati_deud_fina_brut,
                                            p_val_rati_deud_fina_estr,
                                            p_val_rati_porc_var_vtas,
                                            p_val_rati_ebitda_anual,
                                            p_val_rati_porc_ebitda_vtas,
                                            p_val_rati_porc_roe,
                                            p_val_rati_porc_roa,
                                            p_val_rati_cash_flow,
                                            p_val_rati_porc_cash_flow_vtas,
                                            p_val_rati_deud_fina_brut_anos,
                                            p_val_rati_deud_fina_estr_anos,
                                            p_val_rati_deud_fina_ebitda,
                                            p_val_rati_ebitda,
                                            p_val_rati_depr_amor_ejer,
                                            p_val_rati_divi,
                                            p_val_rati_nro_mese,
                                            p_val_rati_var_depr_amor_ejer,
                                            p_val_rati_var_divi,
                                            p_val_ghist_ebitda_anual,
                                            p_val_ghist_cash_flow_anual,
                                            p_val_bg_ac_caja_bcos,
                                            p_val_bg_ac_valo_nego,
                                            p_val_bg_ac_clie,
                                            p_val_bg_ac_prov_cobr_dud,
                                            p_val_bg_ac_cxc_srel,
                                            p_val_bg_ac_cxc_dive,
                                            p_val_bg_ac_exist,
                                            p_val_bg_ac_gast_paga_anti,
                                            p_val_bg_ac,
                                            p_val_bg_anc_inve_rela,
                                            p_val_bg_anc_otra_inve,
                                            p_val_bg_anc_cxc_srel,
                                            p_val_bg_anc_inmu_neto,
                                            p_val_bg_anc_terr,
                                            p_val_bg_anc_edif,
                                            p_val_bg_anc_maqu,
                                            p_val_bg_anc_mueb,
                                            p_val_bg_anc_unid_trans,
                                            p_val_bg_anc_equi_dive,
                                            p_val_bg_anc_depr_acum,
                                            p_val_bg_anc_trab,
                                            p_val_bg_anc_otro_acti,
                                            p_val_bg_anc_intan,
                                            p_val_bg_anc_otro_anc,
                                            p_val_bg_anc,
                                            p_val_bg_tota_acti,
                                            p_val_bg_pc_banc_deud_fina_cp,
                                            p_val_bg_pc_otra_deud_fina_cp,
                                            p_val_bg_pc_deud_lp,
                                            p_val_bg_pc_trib_paga,
                                            p_val_bg_pc_remu_paga,
                                            p_val_bg_pc_prov,
                                            p_val_bg_pc_cxp_srel,
                                            p_val_bg_pc_cxp_dive,
                                            p_val_bg_pc,
                                            p_val_bg_pnc_bcos_deud_fina_lp,
                                            p_val_bg_pnc_otra_deud_fina_lp,
                                            p_val_bg_pnc_cxp_srel,
                                            p_val_bg_pnc_otro_pnc,
                                            p_val_bg_pnc_gana_dife,
                                            p_val_bg_pnc,
                                            p_val_bg_tota_pasi,
                                            p_val_bg_pat_capi,
                                            p_val_bg_pat_cap_adic,
                                            p_val_bg_pat_exce_reva,
                                            p_val_bg_pat_rese,
                                            p_val_bg_pat_resu_acum,
                                            p_val_bg_pat_resu_ejer,
                                            p_val_bg_pat_otro,
                                            p_val_bg_pat,
                                            p_val_tota_pasi_patr,
                                            p_val_cdre_acti_pasi_patr,
                                            p_val_bg_var_ac_caja_bcos,
                                            p_val_bg_var_ac_valo_nego,
                                            p_val_bg_var_ac_clie,
                                            p_val_bg_var_ac_prov_cobr_dud,
                                            p_val_bg_var_ac_cxc_srel,
                                            p_val_bg_var_ac_cxc_dive,
                                            p_val_bg_var_ac_exist,
                                            p_val_bg_var_ac_gast_paga_anti,
                                            p_val_bg_var_ac,
                                            p_val_bg_var_anc_inve_rela,
                                            p_val_bg_var_anc_otra_inve,
                                            p_val_bg_var_anc_cxc_srel,
                                            p_val_bg_var_anc_inmu_neto,
                                            p_val_bg_var_anc_terr,
                                            p_val_bg_var_anc_edif,
                                            p_val_bg_var_anc_maqu,
                                            p_val_bg_var_anc_mueb,
                                            p_val_bg_var_anc_unid_trans,
                                            p_val_bg_var_anc_equi_dive,
                                            p_val_bg_var_anc_depr_acum,
                                            p_val_bg_var_anc_trab,
                                            p_val_bg_var_anc_otro_acti,
                                            p_val_bg_var_anc_intan,
                                            p_val_bg_var_anc_otro_anc,
                                            p_val_bg_var_anc,
                                            p_val_bg_var_tota_acti,
                                            p_val_bg_var_pc_banc_dfina_cp,
                                            p_val_bg_var_pc_otra_dfina_cp,
                                            p_val_bg_var_pc_deud_lp,
                                            p_val_bg_var_pc_trib_paga,
                                            p_val_bg_var_pc_remu_paga,
                                            p_val_bg_var_pc_prov,
                                            p_val_bg_var_pc_cxp_srel,
                                            p_val_bg_var_pc_cxp_dive,
                                            p_val_bg_var_pc,
                                            p_val_bg_var_pnc_bcos_dfina_lp,
                                            p_val_bg_var_pnc_otra_dfina_lp,
                                            p_val_bg_var_pnc_cxp_srel,
                                            p_val_bg_var_pnc_otro_pnc,
                                            p_val_bg_var_pnc_gana_dife,
                                            p_val_bg_var_pnc,
                                            p_val_bg_var_tota_pasi,
                                            p_val_bg_var_pat_capi,
                                            p_val_bg_var_pat_cap_adic,
                                            p_val_bg_var_pat_exce_reva,
                                            p_val_bg_var_pat_rese,
                                            p_val_bg_var_pat_resu_acum,
                                            p_val_bg_var_pat_resu_ejer,
                                            p_val_bg_var_pat_otro,
                                            p_val_bg_var_pat,
                                            p_val_var_tota_pasi_patr,
                                            p_cod_usua_sid,--<I Req. 87567 E2.1 ID## avilca  17/02/2020> 
                                            sysdate  --<I Req. 87567 E2.1 ID## avilca  17/02/2020> 
                                        );

              INSERT INTO vve_cred_soli_eeff (
                    cod_soli_cred,
                    val_ano_eeff,
                    cod_mae_eeff,
                    cod_cliente,
                    cod_usua_crea_regi,
                    fec_crea_regi
                ) VALUES (
                    p_cod_solicitud,
                    p_val_ano_eeff,
                    v_cod_mae_eeff,
                    p_cod_cliente,
                    p_cod_usua_sid,
                    SYSDATE
                );    

    END IF;
         ---- I Req. 87567 E1.1 ID 53 AVILCA 01/10/2020
         -- Actualizando fecha de ejecución de registro y verificando cierre de etapa
        PKG_SWEB_CRED_SOLI_ACTIVIDAD.sp_actu_acti(p_cod_solicitud,'E2','A54',p_cod_usua_sid,p_ret_esta,p_ret_mens); 
         ---- F Req. 87567 E1.1 ID 53 AVILCA 01/10/2020
  COMMIT;
  p_ret_mens := 'El resumen financiero se actualizo con exito.';
  p_ret_esta := 1;
  EXCEPTION
    WHEN OTHERS THEN
      p_ret_esta := -1;
      p_ret_mens := 'SP_ACTU_SEG_SOL_EXCEP:' || SQLERRM;
      pkg_sweb_mae_gene.sp_regi_rlog_erro('AUDI_ERROR',
                                          'sp_act_docu_soli',
                                          'sp_act_docu_soli',
                                          'Error al actualizar el documento',
                                          p_ret_mens,
                                          p_cod_solicitud);
      ROLLBACK;


  END sp_ins_resumen;

  PROCEDURE sp_ins_resumen_maturity
  (
        --p_cod_mae_eeff NUMBER,
        p_cod_solicitud                VARCHAR2,
        p_cod_cliente                  VARCHAR2,
        p_val_matu_ano_proy            NUMBER,
        p_cod_mone_eeff                VARCHAR2,
        p_val_matu_amor_deud_actu      vve_cred_mae_eeff.val_matu_amor_deud_actu%TYPE,
        p_val_matu_amor_deud_nuev      vve_cred_mae_eeff.val_matu_amor_deud_nuev%TYPE,
        p_val_matu_gast_fina_deud_actu vve_cred_mae_eeff.val_matu_gast_fina_deud_actu%TYPE,
        p_val_matu_gast_fina_deud_nuev vve_cred_mae_eeff.val_matu_gast_fina_deud_nuev%TYPE,
        p_val_matu_serv_deud         vve_cred_mae_eeff.val_matu_serv_deud%TYPE,
        p_val_matu_ebitda_proy         vve_cred_mae_eeff.val_matu_ebitda_proy%TYPE,
        p_val_matu_cash_flow_proy     vve_cred_mae_eeff.val_matu_cash_flow_proy%TYPE,
        p_val_matu_fact_ebitda_sdeu   vve_cred_mae_eeff.val_matu_fact_ebitda_sdeu%TYPE,
        p_val_matu_fact_cashf_sdeu     vve_cred_mae_eeff.val_matu_fact_cashf_sdeu%TYPE,
        p_cod_usua_sid      IN sistemas.usuarios.co_usuario%TYPE,
        p_cod_usua_web      IN sistemas.sis_mae_usuario.cod_id_usuario%TYPE,
        p_ret_esta          OUT NUMBER,
        p_ret_mens          OUT VARCHAR2
  ) AS
    v_cod_mae_eeff VARCHAR2(10);
    v_cod_mae_eeff_seq NUMBER(15);
    v_cod_mae_eeff_soli VARCHAR2(10);
  BEGIN

    BEGIN
        SELECT m.cod_mae_eeff
          INTO v_cod_mae_eeff
          FROM vve_cred_mae_eeff m,
               vve_cred_soli_eeff s
         WHERE s.cod_mae_eeff = m.cod_mae_eeff
           AND s.val_ano_eeff = p_val_matu_ano_proy
           AND s.cod_cliente = p_cod_cliente
           AND s.ind_matu = 'S';
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
         v_cod_mae_eeff:=NULL;
    END; 
    --<I Req. 87567 E2.1 ID## avilca  17/02/2020>     
    BEGIN
        SELECT m.cod_mae_eeff
          INTO v_cod_mae_eeff_soli
          FROM vve_cred_mae_eeff m,
               vve_cred_soli_eeff s
         WHERE s.cod_mae_eeff = m.cod_mae_eeff
           AND s.cod_soli_cred= p_cod_solicitud
           AND s.val_ano_eeff = p_val_matu_ano_proy
           AND s.cod_cliente = p_cod_cliente
           AND s.ind_matu = 'S';
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
         v_cod_mae_eeff_soli:=NULL;
    END;
  --<F Req. 87567 E2.1 ID## avilca  17/02/2020>       

        IF v_cod_mae_eeff IS NOT NULL THEN
             UPDATE vve_cred_mae_eeff 
                SET val_matu_amor_deud_actu=p_val_matu_amor_deud_actu,
                    val_matu_amor_deud_nuev=p_val_matu_amor_deud_nuev,
                    val_matu_gast_fina_deud_actu=p_val_matu_gast_fina_deud_actu,
                    val_matu_gast_fina_deud_nuev=p_val_matu_gast_fina_deud_nuev,
                    val_matu_serv_deud=p_val_matu_serv_deud,
                    val_matu_ebitda_proy=p_val_matu_ebitda_proy,
                    val_matu_cash_flow_proy=p_val_matu_cash_flow_proy,
                    val_matu_fact_ebitda_sdeu=p_val_matu_fact_ebitda_sdeu,
                    val_matu_fact_cashf_sdeu=p_val_matu_fact_cashf_sdeu,
                    cod_usua_modi_reg=p_cod_usua_sid,
                    fec_modi_reg = sysdate
              WHERE cod_mae_eeff = v_cod_mae_eeff;

              --<I Req. 87567 E2.1 ID## avilca  17/02/2020>     
              IF v_cod_mae_eeff_soli IS NULL THEN

                  INSERT INTO vve_cred_soli_eeff (
                        cod_soli_cred,
                        val_ano_eeff,
                        cod_mae_eeff,
                        cod_cliente,
                        cod_usua_crea_regi,
                        fec_crea_regi,
                        cod_usua_modi_regi,
                        fec_modi_regi,
                        ind_matu
                    ) VALUES (
                        p_cod_solicitud,
                        p_val_matu_ano_proy,
                        v_cod_mae_eeff,
                        p_cod_cliente,
                        p_cod_usua_sid,
                        SYSDATE,
                        NULL,
                        NULL,
                        'S'
                    );                          
              END IF;
              --<F Req. 87567 E2.1 ID## avilca  17/02/2020>     

    ELSE
         SELECT SEQ_CRED_MAE_EFF.NEXTVAL
           INTO v_cod_mae_eeff_seq
           FROM DUAL;

         SELECT LPAD(v_cod_mae_eeff_seq,10,'0')
           INTO v_cod_mae_eeff
           FROM DUAL;

            INSERT INTO vve_cred_mae_eeff ( cod_mae_eeff,
                                            cod_cliente,
                                            val_ano_eeff,
                                            val_matu_ano_proy,
                                            cod_mone_eeff,
                                            val_matu_amor_deud_actu,
                                            val_matu_amor_deud_nuev,
                                            val_matu_gast_fina_deud_actu,
                                            val_matu_gast_fina_deud_nuev,
                                            val_matu_serv_deud,
                                            val_matu_ebitda_proy,
                                            val_matu_cash_flow_proy,
                                            val_matu_fact_ebitda_sdeu,
                                            val_matu_fact_cashf_sdeu,
                                            cod_usua_crea_reg,
                                            fec_crea_reg
                                        ) VALUES (
                                            v_cod_mae_eeff,--TO_NUMBER(p_cod_mae_eeff),
                                            p_cod_cliente,
                                            p_val_matu_ano_proy,
                                            p_val_matu_ano_proy,
                                            p_cod_mone_eeff,
                                            p_val_matu_amor_deud_actu,
                                            p_val_matu_amor_deud_nuev,
                                            p_val_matu_gast_fina_deud_actu,
                                            p_val_matu_gast_fina_deud_nuev,
                                            p_val_matu_serv_deud,
                                            p_val_matu_ebitda_proy,
                                            p_val_matu_cash_flow_proy,
                                            p_val_matu_fact_ebitda_sdeu,
                                            p_val_matu_fact_cashf_sdeu,
                                            p_cod_usua_sid,
                                            sysdate
                                        );

              INSERT INTO vve_cred_soli_eeff (
                    cod_soli_cred,
                    val_ano_eeff,
                    cod_mae_eeff,
                    cod_cliente,
                    cod_usua_crea_regi,
                    fec_crea_regi,
                    cod_usua_modi_regi,
                    fec_modi_regi,
                    ind_matu
                ) VALUES (
                    p_cod_solicitud,
                    p_val_matu_ano_proy,
                    v_cod_mae_eeff,
                    p_cod_cliente,
                    p_cod_usua_sid,
                    SYSDATE,
                    NULL,
                    NULL,
                    'S'
                );    

    END IF;

  COMMIT;
  p_ret_mens := 'El maturity de resumen financiero se actualizo con exito.';
  p_ret_esta := 1;
  EXCEPTION
    WHEN OTHERS THEN
      p_ret_esta := -1;
      p_ret_mens := 'sp_ins_resumen_maturity:' || SQLERRM;
      pkg_sweb_mae_gene.sp_regi_rlog_erro('AUDI_ERROR',
                                          'sp_ins_resumen_maturity',
                                          'sp_ins_resumen_maturity',
                                          'Error al actualizar el maturity',
                                          p_ret_mens,
                                          p_cod_solicitud);
      ROLLBACK;


  END sp_ins_resumen_maturity;

  PROCEDURE sp_list_resumen_rangos
  (
      p_cod_solicitud     VARCHAR2,
      p_cod_cliente       VARCHAR2,
      p_cod_usua_sid      IN sistemas.usuarios.co_usuario%TYPE,
      p_cod_usua_web      IN sistemas.sis_mae_usuario.cod_id_usuario%TYPE,
      p_anio_sup          VARCHAR2,
      p_anio_inf          VARCHAR2,
      p_fec_solicitud     OUT VARCHAR2,
      p_ret_cursor        OUT SYS_REFCURSOR,
      p_ret_esta          OUT NUMBER,
      p_ret_mens          OUT VARCHAR2
  ) AS
    V_VAL_PARA_NUM    VVE_CRED_SOLI_PARA.VAL_PARA_NUM%TYPE;
    v_cod_soli_cred   vve_cred_soli.cod_soli_cred%TYPE;
  BEGIN
          dbms_output.put_line('1'); 
          SELECT VAL_PARA_NUM
            INTO V_VAL_PARA_NUM
            FROM VVE_CRED_SOLI_PARA
           WHERE COD_CRED_SOLI_PARA = 'NROAÑOEEFF';
           dbms_output.put_line('2'); 
         BEGIN
                   OPEN p_ret_cursor FOR
                 SELECT cod_mae_eeff,
                        cod_cliente,
                        val_ano_eeff,
                        cod_mone_eeff,
                        val_egyp_vtas_tota,
                        val_egyp_cost_vtas_serv,
                        val_egyp_util_brut,
                        val_egyp_gast_vtas,
                        val_egyp_gast_admi,
                        val_egyp_otro_ingr_gast,
                        val_egyp_util_oper,
                        val_egyp_gast_fina,
                        val_egyp_ingr_fina,
                        val_egyp_part_rela,
                        val_egyp_util_ordi,
                        val_egyp_ingr_extr_ccja,
                        val_egyp_egre_extr_ccaja,
                        val_egyp_ingr_extr_scja,
                        val_egyp_egre_extr_scja,
                        val_egyp_otro_ingr,
                        val_egyp_otro_egre,
                        val_egyp_util_ante_imp,
                        val_egyp_imp_part,
                        val_egyp_util_perd_neta,
                        val_egyp_var_vtas_tota,
                        val_egyp_var_cost_vtas_serv,
                        val_egyp_var_util_brut,
                        val_egyp_var_gast_vtas,
                        val_egyp_var_gast_admi,
                        val_egyp_var_otro_ingr_gast,
                        val_egyp_var_util_oper,
                        val_egyp_var_gast_fina,
                        val_egyp_var_ingr_fina,
                        val_egyp_var_part_rela,
                        val_egyp_var_util_ordi,
                        val_egyp_var_ingr_extr_ccja,
                        val_egyp_var_egre_extr_ccaja,
                        val_egyp_var_ingr_extr_scja,
                        val_egyp_var_egre_extr_scja,
                        val_egyp_var_otro_ingr,
                        val_egyp_var_otro_egre,
                        val_egyp_var_util_ante_imp,
                        val_egyp_var_imp_part,
                        val_egyp_var_util_perd_neta,
                        val_rati_capi_trab,
                        val_rati_dias_exist,
                        val_rati_cobr_clie,
                        val_rati_pago_prov,
                        val_rati_cicl_oper,
                        val_rati_pasi_tota_patr,
                        val_rati_deud_fina_brut,
                        val_rati_deud_fina_estr,
                        val_rati_porc_var_vtas,
                        val_rati_ebitda_anual,
                        val_rati_porc_ebitda_vtas,
                        val_rati_porc_roe,
                        val_rati_porc_roa,
                        val_rati_cash_flow,
                        val_rati_porc_cash_flow_vtas,
                        val_rati_deud_fina_brut_anos,
                        val_rati_deud_fina_estr_anos,
                        val_rati_deud_fina_ebitda,
                        val_rati_ebitda,
                        val_rati_depr_amor_ejer,
                        val_rati_divi,
                        val_rati_nro_mese,
                        val_rati_var_depr_amor_ejer,
                        val_rati_var_divi,
                        val_ghist_ebitda_anual,
                        val_ghist_cash_flow_anual,
                        val_bg_ac_caja_bcos,
                        val_bg_ac_valo_nego,
                        val_bg_ac_clie,
                        val_bg_ac_prov_cobr_dud,
                        val_bg_ac_cxc_srel,
                        val_bg_ac_cxc_dive,
                        val_bg_ac_exist,
                        val_bg_ac_gast_paga_anti,
                        val_bg_ac,
                        val_bg_anc_inve_rela,
                        val_bg_anc_otra_inve,
                        val_bg_anc_cxc_srel,
                        val_bg_anc_inmu_neto,
                        val_bg_anc_terr,
                        val_bg_anc_edif,
                        val_bg_anc_maqu,
                        val_bg_anc_mueb,
                        val_bg_anc_unid_trans,
                        val_bg_anc_equi_dive,
                        val_bg_anc_depr_acum,
                        val_bg_anc_trab,
                        val_bg_anc_otro_acti,
                        val_bg_anc_intan,
                        val_bg_anc_otro_anc,
                        val_bg_anc,
                        val_bg_tota_acti,
                        val_bg_pc_banc_deud_fina_cp,
                        val_bg_pc_otra_deud_fina_cp,
                        val_bg_pc_deud_lp,
                        val_bg_pc_trib_paga,
                        val_bg_pc_remu_paga,
                        val_bg_pc_prov,
                        val_bg_pc_cxp_srel,
                        val_bg_pc_cxp_dive,
                        val_bg_pc,
                        val_bg_pnc_bcos_deud_fina_lp,
                        val_bg_pnc_otra_deud_fina_lp,
                        val_bg_pnc_cxp_srel,
                        val_bg_pnc_otro_pnc,
                        val_bg_pnc_gana_dife,
                        val_bg_pnc,
                        val_bg_tota_pasi,
                        val_bg_pat_capi,
                        val_bg_pat_cap_adic,
                        val_bg_pat_exce_reva,
                        val_bg_pat_rese,
                        val_bg_pat_resu_acum,
                        val_bg_pat_resu_ejer,
                        val_bg_pat_otro,
                        val_bg_pat,
                        val_tota_pasi_patr,
                        val_cdre_acti_pasi_patr,
                        val_bg_var_ac_caja_bcos,
                        val_bg_var_ac_valo_nego,
                        val_bg_var_ac_clie,
                        val_bg_var_ac_prov_cobr_dud,
                        val_bg_var_ac_cxc_srel,
                        val_bg_var_ac_cxc_dive,
                        val_bg_var_ac_exist,
                        val_bg_var_ac_gast_paga_anti,
                        val_bg_var_ac,
                        val_bg_var_anc_inve_rela,
                        val_bg_var_anc_otra_inve,
                        val_bg_var_anc_cxc_srel,
                        val_bg_var_anc_inmu_neto,
                        val_bg_var_anc_terr,
                        val_bg_var_anc_edif,
                        val_bg_var_anc_maqu,
                        val_bg_var_anc_mueb,
                        val_bg_var_anc_unid_trans,
                        val_bg_var_anc_equi_dive,
                        val_bg_var_anc_depr_acum,
                        val_bg_var_anc_trab,
                        val_bg_var_anc_otro_acti,
                        val_bg_var_anc_intan,
                        val_bg_var_anc_otro_anc,
                        val_bg_var_anc,
                        val_bg_var_tota_acti,
                        val_bg_var_pc_banc_dfina_cp,
                        val_bg_var_pc_otra_dfina_cp,
                        val_bg_var_pc_deud_lp,
                        val_bg_var_pc_trib_paga,
                        val_bg_var_pc_remu_paga,
                        val_bg_var_pc_prov,
                        val_bg_var_pc_cxp_srel,
                        val_bg_var_pc_cxp_dive,
                        val_bg_var_pc,
                        val_bg_var_pnc_bcos_dfina_lp,
                        val_bg_var_pnc_otra_dfina_lp,
                        val_bg_var_pnc_cxp_srel,
                        val_bg_var_pnc_otro_pnc,
                        val_bg_var_pnc_gana_dife,
                        val_bg_var_pnc,
                        val_bg_var_tota_pasi,
                        val_bg_var_pat_capi,
                        val_bg_var_pat_cap_adic,
                        val_bg_var_pat_exce_reva,
                        val_bg_var_pat_rese,
                        val_bg_var_pat_resu_acum,
                        val_bg_var_pat_resu_ejer,
                        val_bg_var_pat_otro,
                        val_bg_var_pat,
                        val_var_tota_pasi_patr
                   FROM vve_cred_mae_eeff
                  WHERE cod_cliente = p_cod_cliente
                    AND val_ano_eeff<=p_anio_sup
                    AND val_ano_eeff>=p_anio_inf
               ORDER BY val_ano_eeff;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    NULL;
            END;    
      dbms_output.put_line('3');       
   BEGIN
       SELECT seff.cod_soli_cred
         INTO v_cod_soli_cred
         FROM vve_cred_soli_eeff seff
   INNER JOIN vve_cred_mae_eeff meff
           ON seff.COD_MAE_EEFF = meff.COD_MAE_EEFF
        WHERE meff.cod_cliente = p_cod_cliente
          AND meff.val_ano_eeff =(SELECT MAX(val_ano_eeff)
                                        FROM vve_cred_mae_eeff
                                       WHERE cod_cliente = p_cod_cliente);
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
         p_fec_solicitud :=NULL;
    END;
  dbms_output.put_line('4');   
     p_fec_solicitud :=NULL;
     IF (v_cod_soli_cred IS NOT NULL) THEN
         SELECT TO_CHAR(TRUNC(s.fec_soli_cred),'DD/MM/YYYY')
           INTO p_fec_solicitud
           FROM vve_cred_soli s
          WHERE s.cod_soli_cred = v_cod_soli_cred;
     END IF;
  p_ret_esta := 1;
  p_ret_mens := 'La consulta se realizó de manera exitosa';
  EXCEPTION
     WHEN OTHERS THEN
            p_ret_esta := -1;
            p_ret_mens := 'sp_list_garantia:' || SQLERRM;
  END; 

END;
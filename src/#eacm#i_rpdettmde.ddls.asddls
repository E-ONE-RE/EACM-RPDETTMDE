@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '/EACM/I_RPDETTMDE - Dett.provv.maturande'
@Metadata.ignorePropagatedAnnotations: true

define root view entity /EACM/I_RPDETTMDE
  as select from /eacm/prdo as Prdo

    inner join /EACM/I_SDTYPESIGN as Sign
      on Sign.vbtyp = Prdo.vbtyp

    left outer join /EACM/I_AGENTDATA as Agent
      on Agent.zcdaz = Prdo.zcdaz

{
  key Prdo.vkorg             as Vkorg,
  key Prdo.vtweg             as Vtweg,
  key Prdo.zclpr             as Zclpr,
  key Prdo.vbeln             as Vbeln,
  key Prdo.posnr             as Posnr,
  key Prdo.zcdaz             as Zcdaz, 
  key Prdo.zidag             as Zidag,

      Prdo.bukrs             as Bukrs,
      Prdo.ztpag             as ZtpagDoc,
      Agent.name1            as Namea,
      Agent.ztpag            as Ztpag,
      Agent.Zdeag            as Zdeag,
      Prdo.vkgrp             as Vkgrp,
      Prdo.vkbur             as Vkbur,
      Prdo.waerk             as Waerk,
      Prdo.zwaer             as Zzwaer,
      Prdo.kunrg             as Kunrg,     
      Prdo.fkart             as Fkart,
      Prdo.vbtyp             as Vbtyp,
      Prdo.fkdat             as Fkdat,
      Prdo.belnr             as Belnr,
      Prdo.bldat             as Bldat,
      Prdo.budat             as Budat,
      Prdo.blart             as Blart,
      Prdo.matnr             as Matnr,
      Prdo.maktx             as MaktxDoc,
      Prdo.zutmx             as Zutmx,
      Prdo.zstre             as Zstre,
      Prdo.zpcpr             as Zpcpr,
      Prdo.zdest             as Zdest,
      Prdo.zhistor           as Zhistor,
      Prdo.zabin             as Zabin,
      Prdo.kostl             as Kostl,
      Prdo.ztprv             as Ztprv,
      Prdo.kurrf             as Kurrf,

      Sign.segno             as SignMultiplier,

      @Semantics.amount.currencyCode: 'Waerk'
      cast( ( curr_to_decfloat_amount( Prdo.zimpp ) * Sign.segno )
            as abap.dec( 23, 2 ) ) as Zimpp,
      
      @Semantics.amount.currencyCode: 'Waerk'
      cast( ( curr_to_decfloat_amount( Prdo.zimco ) * Sign.segno ) 
            as abap.dec( 23, 2 ) ) as Zimco,

      @Semantics.amount.currencyCode: 'Waerk'
      cast( ( curr_to_decfloat_amount( Prdo.zimmg ) * Sign.segno ) 
            as abap.dec( 23, 2 ) ) as Zimmg,

      @Semantics.amount.currencyCode: 'Waerk'
      cast( ( curr_to_decfloat_amount( Prdo.ziman ) * Sign.segno ) 
            as abap.dec( 23, 2 ) ) as Ziman,
      
      @Semantics.amount.currencyCode: 'Waerk'
      cast( case when Prdo.ziman <> 0
              then ( curr_to_decfloat_amount( Prdo.ziman ) * Sign.segno )
              else ( curr_to_decfloat_amount( Prdo.zimco ) * Sign.segno )
            end as abap.dec( 23, 2 ) ) as ImpProvv,
            
      @Semantics.amount.currencyCode: 'Waerk'
      cast( case
              when Prdo.ziman <> 0 and Prdo.zstre = 'C'
                then ( curr_to_decfloat_amount( Prdo.ziman ) * Sign.segno )
              when Prdo.ziman <> 0
                then 0
                else ( curr_to_decfloat_amount( Prdo.zimmg ) * Sign.segno )
            end as abap.dec( 23, 2 ) ) as ImpMatur,
            
      @Semantics.amount.currencyCode: 'Waerk'
      cast( case
              when Prdo.ziman <> 0 and Prdo.zstre = 'C'
                then 0
              when Prdo.ziman <> 0
                then ( curr_to_decfloat_amount( Prdo.ziman ) * Sign.segno )
              else ( ( curr_to_decfloat_amount( Prdo.zimco ) - curr_to_decfloat_amount( Prdo.zimmg ) ) * Sign.segno )
            end as abap.dec( 23, 2 ) ) as ImpDaMat,

      cast( Prdo.zimpu as abap.dec( 23, 2 ) ) as Zimpu,

      cast( Prdo.koein as abap.dec( 23, 2 ) ) as Koein,

      @Semantics.amount.currencyCode: 'Waerk'
      cast( ( curr_to_decfloat_amount( Prdo.zimii ) * Sign.segno ) 
            as abap.dec( 23, 2 ) ) as Zimii,

      @Semantics.amount.currencyCode: 'Waerk'
      cast( ( curr_to_decfloat_amount( Prdo.zimiidd ) * Sign.segno ) 
            as abap.dec( 23, 2 ) ) as Zimiidd,

      @Semantics.amount.currencyCode: 'Waerk'
      cast( ( curr_to_decfloat_amount( Prdo.zimpe ) * Sign.segno ) 
            as abap.dec( 23, 2 ) ) as Zimpe,

      @Semantics.amount.currencyCode: 'Waerk'
      cast( ( curr_to_decfloat_amount( Prdo.zimst ) * Sign.segno ) 
            as abap.dec( 23, 2 ) ) as Zimst,

      @Semantics.amount.currencyCode: 'Waerk'
      cast( ( curr_to_decfloat_amount( Prdo.zlord ) * Sign.segno ) 
            as abap.dec( 23, 2 ) ) as Zlord,

      @Semantics.amount.currencyCode: 'Zzwaer'
      cast( ( curr_to_decfloat_amount( Prdo.zimlr ) * Sign.segno ) 
            as abap.dec( 23, 2 ) ) as Zimlr

}
where Agent.zcdaz is not null
  and Prdo.zstre <> 'D'
  and Prdo.zstre <> 'C'
  and Prdo.zstre <> 'M'

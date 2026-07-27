@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Dettaglio provvigioni maturande'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

define root view entity /EACM/C_RPDETTMDE
  provider contract transactional_query

  as projection on /EACM/I_RPDETTMDE
{
  key Vkorg,
  key Vtweg,
  key Zclpr,
  key Vbeln,
  key Posnr,
  key Zcdaz, 
  key Zidag,

      Bukrs,
      ZtpagDoc,
      Namea,
      Ztpag,
      Zdeag,
      Vkgrp,
      Vkbur,
      Waerk,
      Zzwaer,
      Kunrg,     
      Fkart,
      Vbtyp,
      Fkdat,
      Belnr,
      Bldat,
      Budat,
      Blart,
      Matnr,
      MaktxDoc,
      Zutmx,
      Zstre,
      Zpcpr,
      Zdest,
      Zhistor,
      Zabin,
      Kostl,
      Ztprv,
      Kurrf,
      SignMultiplier,
      Zimpp,
      Zimco,
      Zimmg,
      Ziman,
      ImpProvv,
      ImpMatur,
      ImpDaMat,
      Zimpu,
      Koein,
      Zimii,
      Zimiidd,
      Zimpe,
      Zimst,
      Zlord,
      Zimlr
}

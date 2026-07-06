@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RPDETTMDE Form Item'
@Metadata.ignorePropagatedAnnotations: true
define view entity /EACM/C_RPDETTMDE_FORM_I
  as select from /EACM/I_RPDETTMDE as Detail
{
  key Detail.Bukrs as Bukrs,
  key Detail.Fkdat as Fkdat,
  key Detail.Zcdaz as Zcdaz,
  key Detail.Waerk as Waerk,
  key Detail.Kunrg as Kunrg,
  key Detail.Vbeln as Vbeln,
  key Detail.Posnr as Posnr,
  key Detail.Zclpr as Zclpr,
  key Detail.Belnr as Belnr,

      Detail.Namea as Namea,

      cast( '' as abap.char(35) ) as CustomerName,

//      Detail.Zidfs as Zidfs,
//      Detail.Zamcf as Zamcf,
//      Detail.Ztpcd as Ztpcd,

      cast(
        sum( cast( Detail.Zimpp as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as Zimpp,

      cast(
        sum( cast( Detail.Zimco as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as Zimco,

      cast(
        sum( cast( Detail.Zimmg as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as Zimmg,

      cast(
        sum( cast( Detail.Ziman as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as Ziman,

      cast(
        sum( cast( Detail.ImpProvv as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as ImpProvv,

      cast(
        sum( cast( Detail.ImpMatur as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as ImpMatur,

      cast(
        sum( cast( Detail.ImpDaMat as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as ImpDaMat

//      cast(
//        sum( cast( Detail.ImpRecup as abap.dec( 23, 2 ) ) )
//        as abap.dec( 23, 2 ) ) as ImpRecup
}
group by
  Detail.Bukrs,
  Detail.Fkdat,
  Detail.Zcdaz,
  Detail.Waerk,
  Detail.Kunrg,
  Detail.Vbeln,
  Detail.Posnr,
  Detail.Zclpr,
  Detail.Belnr,
  Detail.Namea
//  Customer.name1,
//  Detail.Zidfs,
//  Detail.Zamcf,
//  Detail.Ztpcd

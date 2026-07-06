@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RPDETTMDE Form Customer'
@Metadata.ignorePropagatedAnnotations: true
define view entity /EACM/C_RPDETTMDE_FORM_U
  as select from /EACM/I_RPDETTMDE as Detail
  association [0..*] to /EACM/C_RPDETTMDE_FORM_I as _Item
    on  $projection.Bukrs = _Item.Bukrs
    and $projection.Fkdat = _Item.Fkdat
    and $projection.Zcdaz = _Item.Zcdaz
    and $projection.Waerk = _Item.Waerk
    and $projection.Kunrg = _Item.Kunrg
{
  key Detail.Bukrs as Bukrs,
  key Detail.Fkdat as Fkdat,
  key Detail.Zcdaz as Zcdaz,
  key Detail.Waerk as Waerk,
  key Detail.Kunrg as Kunrg,

      cast( '' as abap.char(35) ) as CustomerName,

      cast(
        sum( cast( Detail.Zimpp as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CustomerTotalZimpp,

      cast(
        sum( cast( Detail.Zimco as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CustomerTotalZimco,

      cast(
        sum( cast( Detail.Zimmg as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CustomerTotalZimmg,

      cast(
        sum( cast( Detail.Ziman as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CustomerTotalZiman,

      cast(
        sum( cast( Detail.ImpProvv as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CustomerTotalImpProvv,

      cast(
        sum( cast( Detail.ImpMatur as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CustomerTotalImpMatur,

      cast(
        sum( cast( Detail.ImpDaMat as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CustomerTotalImpDaMat,

//      cast(
//        sum( cast( Detail.ImpRecup as abap.dec( 23, 2 ) ) )
//        as abap.dec( 23, 2 ) ) as CustomerTotalImpRecup,

      _Item
}
group by
  Detail.Bukrs,
  Detail.Fkdat,
  Detail.Zcdaz,
  Detail.Waerk,
  Detail.Kunrg
//  Customer.name1

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RPDETTMDE Form General Currency Total'
@Metadata.ignorePropagatedAnnotations: true
define view entity /EACM/C_RPDETTMDE_FORM_V
  as select from /EACM/I_RPDETTMDE as Detail
  association [0..*] to /EACM/C_RPDETTMDE_FORM_G as _GeneralTotalsByClass
    on  $projection.Bukrs = _GeneralTotalsByClass.Bukrs
    and $projection.Fkdat = _GeneralTotalsByClass.Fkdat
    and $projection.Waerk = _GeneralTotalsByClass.Waerk
{
  key Detail.Bukrs as Bukrs,
  key Detail.Fkdat as Fkdat,
  key Detail.Waerk as Waerk,  

      Detail.Waerk as CurrencyCode,

      cast(
        sum( cast( Detail.Zimpp as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as GeneralTotalZimpp,

      cast(
        sum( cast( Detail.Zimco as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as GeneralTotalZimco,

      cast(
        sum( cast( Detail.Zimmg as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as GeneralTotalZimmg,

      cast(
        sum( cast( Detail.Ziman as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as GeneralTotalZiman,

      cast(
        sum( cast( Detail.ImpProvv as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as GeneralTotalImpProvv,

      cast(
        sum( cast( Detail.ImpMatur as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as GeneralTotalImpMatur,

      cast(
        sum( cast( Detail.ImpDaMat as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as GeneralTotalImpDaMat,

//      cast(
//        sum( cast( Detail.ImpRecup as abap.dec( 23, 2 ) ) )
//        as abap.dec( 23, 2 ) ) as GeneralTotalImpRecup,

      _GeneralTotalsByClass
}
group by
  Detail.Bukrs,
  Detail.Fkdat,
  Detail.Waerk

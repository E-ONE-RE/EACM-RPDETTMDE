@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RPDETTMDE Form Currency'
@Metadata.ignorePropagatedAnnotations: true
define view entity /EACM/C_RPDETTMDE_FORM_C
  as select from /EACM/I_RPDETTMDE as Detail
  association [0..*] to /EACM/C_RPDETTMDE_FORM_U as _Customer
    on  $projection.Bukrs = _Customer.Bukrs
    and $projection.Fkdat = _Customer.Fkdat
    and $projection.Zcdaz = _Customer.Zcdaz
    and $projection.Waerk = _Customer.Waerk
{
  key Detail.Bukrs as Bukrs,
  key Detail.Fkdat as Fkdat,
  key Detail.Zcdaz as Zcdaz,
  key Detail.Waerk as Waerk,

      cast(
        sum( cast( Detail.Zimpp as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CurrencyTotalZimpp,

      cast(
        sum( cast( Detail.Zimco as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CurrencyTotalZimco,

      cast(
        sum( cast( Detail.Zimmg as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CurrencyTotalZimmg,

      cast(
        sum( cast( Detail.Ziman as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CurrencyTotalZiman,

      cast(
        sum( cast( Detail.ImpProvv as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CurrencyTotalImpProvv,

      cast(
        sum( cast( Detail.ImpMatur as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CurrencyTotalImpMatur,

      cast(
        sum( cast( Detail.ImpDaMat as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as CurrencyTotalImpDaMat,

//      cast(
//        sum( cast( Detail.ImpRecup as abap.dec( 23, 2 ) ) )
//        as abap.dec( 23, 2 ) ) as CurrencyTotalImpRecup,

      _Customer
}
group by
  Detail.Bukrs,
  Detail.Fkdat,
  Detail.Zcdaz,
  Detail.Waerk

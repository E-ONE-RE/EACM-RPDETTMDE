@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RPDETTMDE Form Header'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.supportedCapabilities: [ #OUTPUT_FORM_DATA_PROVIDER ]
define view entity /EACM/C_RPDETTMDE_FORM_H
  as select from /EACM/I_RPDETTMDE as Detail
  association [0..*] to /EACM/C_RPDETTMDE_FORM_A as _Agent
    on  $projection.Bukrs = _Agent.Bukrs
    and $projection.Fkdat = _Agent.Fkdat
  association [0..*] to /EACM/C_RPDETTMDE_FORM_V as _General
    on  $projection.Bukrs = _General.Bukrs
    and $projection.Fkdat = _General.Fkdat
  association [0..*] to /EACM/C_RPDETTMDE_FORM_G as _GeneralTotalsByClass
    on  $projection.Bukrs = _GeneralTotalsByClass.Bukrs
    and $projection.Fkdat = _GeneralTotalsByClass.Fkdat
{
  key Detail.Bukrs as Bukrs,
  key Detail.Fkdat as Fkdat,

      cast(
        sum( cast( Detail.Zimpp as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as TotalZimpp,

      cast(
        sum( cast( Detail.Zimco as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as TotalZimco,

      cast(
        sum( cast( Detail.Zimmg as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as TotalZimmg,

      cast(
        sum( cast( Detail.Ziman as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as TotalZiman,

      cast(
        sum( cast( Detail.ImpProvv as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as TotalImpProvv,

      cast(
        sum( cast( Detail.ImpMatur as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as TotalImpMatur,

      cast(
        sum( cast( Detail.ImpDaMat as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as TotalImpDaMat,

//      cast(
//        sum( cast( Detail.ImpRecup as abap.dec( 23, 2 ) ) )
//        as abap.dec( 23, 2 ) ) as TotalImpRecup,

      _Agent,
      _General,
      _GeneralTotalsByClass
}
group by
  Detail.Bukrs,
  Detail.Fkdat

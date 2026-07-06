@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RPDETTMDE Form Agent'
@Metadata.ignorePropagatedAnnotations: true
define view entity /EACM/C_RPDETTMDE_FORM_A
  as select from /EACM/I_RPDETTMDE as Detail
  association [0..*] to /EACM/C_RPDETTMDE_FORM_T as _AgentTotalsByClass
    on  $projection.Bukrs = _AgentTotalsByClass.Bukrs
    and $projection.Fkdat = _AgentTotalsByClass.Fkdat
    and $projection.Zcdaz = _AgentTotalsByClass.Zcdaz
  association [0..*] to /EACM/C_RPDETTMDE_FORM_C as _Currency
    on  $projection.Bukrs = _Currency.Bukrs
    and $projection.Fkdat = _Currency.Fkdat
    and $projection.Zcdaz = _Currency.Zcdaz
{
  key Detail.Bukrs as Bukrs,
  key Detail.Fkdat as Fkdat,
  key Detail.Zcdaz as Zcdaz,

      cast( Detail.Fkdat as abap.char( 10 ) ) as PeriodFrom,
      cast( Detail.Fkdat as abap.char( 10 ) ) as PeriodTo,

      Detail.Namea as Namea,
      cast( 'Active' as abap.char( 20 ) ) as AgentState,

      cast(
        sum( cast( Detail.Zimpp as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as AgentTotalZimpp,

      cast(
        sum( cast( Detail.Zimco as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as AgentTotalZimco,

      cast(
        sum( cast( Detail.Zimmg as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as AgentTotalZimmg,

      cast(
        sum( cast( Detail.Ziman as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as AgentTotalZiman,

      cast(
        sum( cast( Detail.ImpProvv as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as AgentTotalImpProvv,

      cast(
        sum( cast( Detail.ImpMatur as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as AgentTotalImpMatur,

      cast(
        sum( cast( Detail.ImpDaMat as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as AgentTotalImpDaMat,

//      cast(
//        sum( cast( Detail.ImpRecup as abap.dec( 23, 2 ) ) )
//        as abap.dec( 23, 2 ) ) as AgentTotalImpRecup,

      _AgentTotalsByClass,
      _Currency
}
group by
  Detail.Bukrs,
  Detail.Fkdat,
  Detail.Zcdaz,
  Detail.Namea

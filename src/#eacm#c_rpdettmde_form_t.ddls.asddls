@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RPDETTMDE Form Agent Total By Class'
@Metadata.ignorePropagatedAnnotations: true
define view entity /EACM/C_RPDETTMDE_FORM_T 
  as select from /EACM/I_RPDETTMDE as Detail
{
  key Detail.Bukrs as Bukrs,
  key Detail.Fkdat as Fkdat,
  key Detail.Zcdaz as Zcdaz,
  key Detail.Waerk as Waerk,
  key Detail.Zclpr as Zclpr,

      Detail.Waerk as CurrencyCode,
      Detail.Zclpr as Classification,

      cast(
        sum( cast( Detail.Zimpp as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as AgentClassTotalZimpp,

      cast(
        sum( cast( Detail.Zimco as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as AgentClassTotalZimco,

      cast(
        sum( cast( Detail.Zimmg as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as AgentClassTotalZimmg,

      cast(
        sum( cast( Detail.Ziman as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as AgentClassTotalZiman,

      cast(
        sum( cast( Detail.ImpProvv as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as TotalProvvigione,

      cast(
        sum( cast( Detail.ImpMatur as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as TotalMaturato,

      cast(
        sum( cast( Detail.ImpDaMat as abap.dec( 23, 2 ) ) )
        as abap.dec( 23, 2 ) ) as TotalDaMaturare

//      cast(
//        sum( cast( Detail.ImpRecup as abap.dec( 23, 2 ) ) )
//        as abap.dec( 23, 2 ) ) as ImpRecup
}
group by
  Detail.Bukrs,
  Detail.Fkdat,
  Detail.Zcdaz,
  Detail.Waerk,
  Detail.Zclpr

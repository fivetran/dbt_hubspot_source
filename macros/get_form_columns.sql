{% macro get_form_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "guid", "datatype": dbt.type_string()},
    {"name": "action", "datatype": dbt.type_string()},
    {"name": "createdAt", "datatype": dbt.type_timestamp()},
    {"name": "cssClass", "datatype": dbt.type_string()},
    {"name": "followUpId", "datatype": dbt.type_string()},
    {"name": "formType", "datatype": dbt.type_string()},
    {"name": "leadNurturingCampaignId", "datatype": dbt.type_string()},
    {"name": "method", "datatype": dbt.type_string()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "notifyRecipients", "datatype": dbt.type_boolean()},
    {"name": "portalId", "datatype": dbt.type_int()},
    {"name": "redirect", "datatype": dbt.type_string()},
    {"name": "submitText", "datatype": dbt.type_string()},
    {"name": "updatedAt", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
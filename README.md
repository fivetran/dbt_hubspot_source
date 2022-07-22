[![Apache License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 
# Hubspot (Source)

This package models Hubspot data from [Fivetran's connector](https://fivetran.com/docs/applications/hubspot). It uses data in the format described by the [marketing](https://fivetran.com/docs/applications/hubspot#schemainformation), [sales](https://fivetran.com/docs/applications/hubspot#crmandsaleshubschema) and [service](https://fivetran.com/docs/applications/hubspot#servicehubschema) ERDs.

This package enriches your Fivetran data by doing the following:

* Adds descriptions to tables and columns that are synced using Fivetran
* Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
* Models staging tables, which will be used in our transform package

## Models

This package contains staging models, designed to work simultaneously with our [Hubspot transform package](https://github.com/fivetran/dbt_hubspot). The staging models:

* Remove any rows that are soft-deleted
* Name columns consistently across all packages:
* Boolean fields are prefixed with `is_` or `has_`
* Timestamps are appended with `_timestamp`
* ID primary keys are prefixed with the name of the table. For example, the user table's ID column is renamed user_id.

## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

Include in `packages.yml`

```yaml
packages:
  - package: fivetran/hubspot_source
    version: [">=0.5.0", "<0.6.0"]
```

## Configuration
By default this package will look for your Hubspot data in the `hubspot` schema of your [target database](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/configure-your-profile). If this is not where your Hubspot data is, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
config-version: 2

vars:
  hubspot_database: your_database_name
  hubspot_schema: your_schema_name
```

### Disabling models

When setting up your Hubspot connection in Fivetran, it is possible that not every table this package expects will be synced. This can occur because you either don't use that functionality in Hubspot or have actively decided to not sync some tables. In order to disable the relevant functionality in the package, you will need to add the relevant variables. By default, all variables are assumed to be `true` (with exception of `hubspot_service_enabled` and `hubspot_contact_merge_audit_enabled`). You only need to add variables for the tables you would like to disable or enable respectively:

```yml
# dbt_project.yml

...
config-version: 2

vars:
  # Marketing

  hubspot_marketing_enabled: false                        # Disables all marketing models
  hubspot_contact_enabled: false                          # Disables the contact models
  hubspot_contact_list_enabled: false                     # Disables contact list models
  hubspot_contact_list_member_enabled: false              # Disables contact list member models
  hubspot_contact_property_enabled: false                 # Disables the contact property models
  hubspot_email_event_enabled: false                      # Disables all email_event models and functionality
  hubspot_email_event_bounce_enabled: false
  hubspot_email_event_click_enabled: false
  hubspot_email_event_deferred_enabled: false
  hubspot_email_event_delivered_enabled: false
  hubspot_email_event_dropped_enabled: false
  hubspot_email_event_forward_enabled: false
  hubspot_email_event_click_enabled: false
  hubspot_email_event_open_enabled: false
  hubspot_email_event_print_enabled: false
  hubspot_email_event_sent_enabled: false
  hubspot_email_event_spam_report_enabled: false
  hubspot_email_event_status_change_enabled: false
  
  hubspot_contact_merge_audit_enabled: true               # Enables contact merge auditing to be applied to final models (removes any merged contacts that are still persisting in the contact table)

  # Sales

  hubspot_sales_enabled: false                            # Disables all sales models
  hubspot_company_enabled: false
  hubspot_deal_enabled: false
  hubspot_deal_company_enabled: false
  hubspot_deal_contact_enabled: false
  hubspot_engagement_enabled: false                       # Disables all engagement models and functionality
  hubspot_engagement_contact_enabled: false
  hubspot_engagement_company_enabled: false
  hubspot_engagement_deal_enabled: false
  hubspot_engagement_call_enabled: false
  hubspot_engagement_email_enabled: false
  hubspot_engagement_meeting_enabled: false
  hubspot_engagement_note_enabled: false
  hubspot_engagement_task_enabled: false

  # Service
  hubspot_service_enabled: true                           # Enables all service models
```


### Passthrough Columns
Additionally, this package includes all source columns defined in the macros folder. Models by default only bring in a few fields for the `company`, `contact`, `deal`, and `ticket` tables. You can add more columns using our pass-through column variables. These variables allow for the pass-through fields to be aliased (`alias`) and casted (`transform_sql`) if desired, but not required. Datatype casting is configured via a sql snippet within the `transform_sql` key. You may add the desired sql while omitting the `as field_name` at the end and your custom pass-though fields will be casted accordingly. Use the below format for declaring the respective pass-through variables.

```yml
# dbt_project.yml

...
vars:
  hubspot__deal_pass_through_columns:
    - name:           "property_field_new_id"
      alias:          "new_name_for_this_field_id"
      transform_sql:  "cast(new_name_for_this_field as int64)"
    - name:           "this_other_field"
      transform_sql:  "cast(this_other_field as string)"
  hubspot__contact_pass_through_columns:
    - name:           "wow_i_can_add_all_my_custom_fields"
  hubspot__company_pass_through_columns:
    - name:           "this_is_radical"
      alias:          "radical_field"
      transform_sql:  "cast(radical_field as string)"
  hubspot__ticket_pass_through_columns:
    - name:           "property_mmm"
      alias:          "mmm"
    - name:           "property_bop"
      alias:          "bop"

```

**Alternatively**, if you would like to simply pass through **all columns** in the above four tables, add the following configuration to your dbt_project.yml. Note that this will override any `hubspot__[table_name]_pass_through_columns` variables.

```yml
# dbt_project.yml

...
vars:
  hubspot__pass_through_all_columns: true # default is false
```

### Calculated Fields
This package also provides the ability to pass calculated fields through to the `company`, `contact`, `deal`, and `ticket` staging models. If you would like to add a calculated field to any of the mentioned staging models, you may configure the respective `hubspot__[table_name]_calculated_fields` variables with the `name` of the field you would like to create, and the `transform_sql` which will be the actual calculation that will make up the calculated field.
```yml
vars:
  hubspot__deal_calculated_fields:
    - name:          "deal_calculated_field"
      transform_sql: "existing_field * other_field"
  hubspot__company_calculated_fields:
    - name:          "company_calculated_field"
      transform_sql: "concat(name_field, '_company_name')"
  hubspot__contact_calculated_fields:
    - name:          "contact_calculated_field"
      transform_sql: "contact_revenue - contact_expense"
  hubspot__ticket_calculated_fields:
    - name:          "ticket_calculated_field"
      transform_sql: "total_field / other_total_field"
```

### Changing the Build Schema
By default this package will build the HubSpot staging models within a schema titled (<target_schema> + `_stg_hubspot`). If this is not where you would like your HubSpot staging models to be written to, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
models:
  hubspot_source:
    +schema: my_new_staging_models_schema # leave blank for just the target_schema
```

*Read more about using custom schemas in dbt [here](https://docs.getdbt.com/docs/building-a-dbt-project/building-models/using-custom-schemas).*

## Contributions

Additional contributions to this package are very welcome! Please create issues
or open PRs against `main`. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) 
on the best workflow for contributing to a package.

## Database Support
This package has been tested on BigQuery, Snowflake, Redshift, and Postgres.

## Resources:
- Provide [feedback](https://www.surveymonkey.com/r/DQ7K7WW) on our existing dbt packages or what you'd like to see next
- Have questions, feedback, or need help? Book a time during our office hours [using Calendly](https://calendly.com/fivetran-solutions-team/fivetran-solutions-team-office-hours) or email us at solutions@fivetran.com
- Find all of Fivetran's pre-built dbt packages in our [dbt hub](https://hub.getdbt.com/fivetran/)
- Learn how to orchestrate your models with [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt)
- Learn more about Fivetran overall [in our docs](https://fivetran.com/docs)
- Check out [Fivetran's blog](https://fivetran.com/blog)
- Learn more about dbt [in the dbt docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the dbt blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

# Hubspot (Source)

This package models Hubspot data from [Fivetran's connector](https://fivetran.com/docs/applications/hubspot). It uses data in the format described by the [marketing](https://fivetran.com/docs/applications/hubspot#schemainformation), [sales](https://fivetran.com/docs/applications/hubspot#crmandsaleshubschema) and [service](https://fivetran.com/docs/applications/hubspot#servicehubschema) ERDs.

This package enriches your Fivetran data by doing the following:

* Adds descriptions to tables and columns that are synced using Fivetran
* Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
* Models staging tables, which will be used in our transform package

## Models

This package contains staging models, designed to work simultaneously with our [Hubspot modeling package](https://github.com/fivetran/dbt_hubspot). The staging models:

* Remove any rows that are soft-deleted
* Name columns consistently across all packages:
* Boolean fields are prefixed with `is_` or `has_`
* Timestamps are appended with `_timestamp`
* ID primary keys are prefixed with the name of the table. For example, the user table's ID column is renamed user_id.

## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

## Configuration
By default this package will look for your Hubspot data in the `hubspot` schema of your [target database](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/configure-your-profile). If this is not where your Hubspot data is, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
config-version: 2

vars:
  hubspot_source:
    hubspot_database: your_database_name
    hubspot_schema: your_schema_name
```

### Disabling models

When setting up your Hubspot connection in Fivetran, it is possible that not every table this package expects will be synced. This can occur because you either don't use that functionality in Hubspot or have actively decided to not sync some tables. In order to disable the relevant functionality in the package, you will need to add the relevant variables. By default, all variables are assumed to be `true` (with exception of `hubspot_service_enabled`). You only need to add variables for the tables you would like to disable or enable respectively:

```yml
# dbt_project.yml

...
config-version: 2

vars:
  hubspot_source:

    # Marketing

    hubspot_marketing_enabled:                  false       # Disables all marketing models
    hubspot_email_event_enabled:                false       # Disables all email_event models and functionality
    hubspot_email_event_bounce_enabled:         false
    hubspot_email_event_click_enabled:          false
    hubspot_email_event_deferred_enabled:       false
    hubspot_email_event_delivered_enabled:      false
    hubspot_email_event_dropped_enabled:        false
    hubspot_email_event_forward_enabled:        false
    hubspot_email_event_click_enabled:          false
    hubspot_email_event_opens_enabled:          false
    hubspot_email_event_print_enabled:          false
    hubspot_email_event_sent_enabled:           false
    hubspot_email_event_spam_report:            false
    hubspot_email_event_status_change_enabled:  false

    # Sales

    hubspot_sales_enabled:                      false       # Disables all sales models
    hubspot_company_enabled:                    false
    hubspot_deal_enabled:                       false
    hubspot_engagement_enabled:                 false       # Disables all engagement models and functionality
    hubspot_engagement_contact_enabled:         false
    hubspot_engagement_company_enabled:         false
    hubspot_engagement_deal_enabled:            false
    hubspot_engagement_calls_enabled:           false
    hubspot_engagement_emails_enabled:          false
    hubspot_engagement_meetings_enabled:        false
    hubspot_engagement_notes_enabled:           false
    hubspot_engagement_tasks_enabled:           false

    # Service
    hubspot_service_enabled:                    true        # Enables all service models
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

### Contributions ###

Additional contributions to this package are very welcome! Please create issues
or open PRs against `master`. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) 
on the best workflow for contributing to a package.

## Database support
This package has been tested on BigQuery, Snowflake, and Redshift.

### Resources:
- Provide [feedback](https://www.surveymonkey.com/r/DQ7K7WW) on our existing dbt packages or what you'd like to see next
- Have questions, feedback, or need help? Book a time during our office hours [using Calendly](https://calendly.com/fivetran-solutions-team/fivetran-solutions-team-office-hours) or email us at solutions@fivetran.com
- Find all of Fivetran's pre-built dbt packages in our [dbt hub](https://hub.getdbt.com/fivetran/)
- Learn how to orchestrate [dbt transformations with Fivetran](https://fivetran.com/docs/transformations/dbt)
- Learn more about Fivetran overall [in our docs](https://fivetran.com/docs)
- Check out [Fivetran's blog](https://fivetran.com/blog)
- Learn more about dbt [in the dbt docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the dbt blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

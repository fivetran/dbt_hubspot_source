# Hubspot (Source)

This package models Hubspot data from [Fivetran's connector](https://fivetran.com/docs/applications/hubspot). It uses data in the format described by the [marketing](https://docs.google.com/presentation/d/1hrPp310SNK2qyESCV_g_JFx_Knm1MwB467wN3dEgy0M/edit#slide=id.g244d368397_0_1) and [sales](https://docs.google.com/presentation/d/1KABQnt8WmtZe7u5l7WFUoPIsWzv63P9gsWF79XGLoZE/edit#slide=id.g244d368397_0_1) ERDs.

This package enriches your Fivetran data by doing the following:

* Adds descriptions to tables and columns that are synced using Fivetran
* Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
* Models staging tables, which will be used in our transform package

## Models

This package contains staging models, designed to work simultaneously with our [Hubspot modeling package](https://github.com/fivetran/dbt_hubspot). The staging models:

* Remove any rows that are soft-deleted
* Name columns consistently across all packages:
* Boolean fields are prefixed with is_ or has_
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

## Contributions

Additional contributions to this package are very welcome! Please create issues
or open PRs against `master`. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) 
on the best workflow for contributing to a package.

## Resources:
- Learn more about Fivetran [in the Fivetran docs](https://fivetran.com/docs)
- Check out [Fivetran's blog](https://fivetran.com/blog)
- Learn more about dbt [in the dbt docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the dbt blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

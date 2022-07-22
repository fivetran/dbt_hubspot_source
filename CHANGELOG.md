# dbt_hubspot_source v0.5.7
## Fixes
- Spelling correction of variable names within the README. ([#73](https://github.com/fivetran/dbt_hubspot_source/pull/73))

## Contributors
- [@mp56](https://github.com/moreaupascal56) ([#73](https://github.com/fivetran/dbt_hubspot_source/pull/73))

# dbt_hubspot_source v0.5.6
## Bug Fixes
- The below staging tables contain a `where` clause to filter out soft deletes. However, this where clause was conducted in the first CTE of the staging model before the `fill_staging_columns` macro. Therefore, if the field doesn't exist, the dbt run would fail. These updates have moved the CTE to the final one to avoid this error. ([#68](https://github.com/fivetran/dbt_hubspot_source/pull/68))
  - `stg_hubspot__company`, `stg_hubspot__contact`, `stg_hubspot__contact_list`, `stg_hubspot__deal`, `stg_hubspot__deal_pipeline`, `stg_hubspot__deal_pipeline_stage`, `stg_hubspot__ticket`, and `stg_hubspot__contact_list`.

## Contributors
- [@sambradbury](https://github.com/sambradbury) ([#67](https://github.com/fivetran/dbt_hubspot_source/pull/67))
# dbt_hubspot_source v0.5.5
## Fixes
- Adds missing `stg_hubspot__deal_contact` model. ([#64](https://github.com/fivetran/dbt_hubspot_source/pull/64))

## Contributors
- [@dietofworms](https://github.com/dietofworms) ([#64](https://github.com/fivetran/dbt_hubspot_source/pull/64))

# dbt_hubspot_source v0.5.4
## Fixes
- Updated the README to reference the proper `hubspot_email_event_spam_report_enabled` variable name. ([#59](https://github.com/fivetran/dbt_hubspot_source/pull/59))
- Adds missing `is_deleted` field when using custom columns. ([#61](https://github.com/fivetran/dbt_hubspot_source/pull/61))

## Contributors
- [@cmcau](https://github.com/cmcau) ([#59](https://github.com/fivetran/dbt_hubspot_source/pull/59))
- [@ABCurado](https://github.com/ABCurado) ([#61](https://github.com/fivetran/dbt_hubspot_source/pull/61))
# dbt_hubspot_source v0.5.3

## Under the Hood
- Cast the `deal_pipeline_stage_id` and `deal_pipeline_id` fields within the stg_hubspot__deal_pipeline, stg_hubspot__deal_pipeline_stage, stg_hubspot__deal using the `dbt_utils.type_string()` macro. This ensures joins in downstream models are accurate across warehouses. ([#57](https://github.com/fivetran/dbt_hubspot_source/pull/57))

# dbt_hubspot_source v0.5.2

## Updates
- Removing unused models `stg_hubspot__engagement_email_cc` and `stg_hubspot__engagement_email_to` from `stg_hubspot__engagement.yml` ([#56](https://github.com/fivetran/dbt_hubspot_source/pull/56))

## Contributors
- @ericalouie ([#60](https://github.com/fivetran/dbt_hubspot/issues/60)).

# dbt_hubspot_source v0.5.1

## Updates
- Updating `README.md` to reflect global variable references in `dbt_project.yml` to be consistent with `dbt_hubspot` package.
# dbt_hubspot_source v0.5.0
🎉 dbt v1.0.0 Compatibility 🎉
## 🚨 Breaking Changes 🚨
- Adjusts the `require-dbt-version` to now be within the range [">=1.0.0", "<2.0.0"]. Additionally, the package has been updated for dbt v1.0.0 compatibility. If you are using a dbt version <1.0.0, you will need to upgrade in order to leverage the latest version of the package.
  - For help upgrading your package, I recommend reviewing this GitHub repo's Release Notes on what changes have been implemented since your last upgrade.
  - For help upgrading your dbt project to dbt v1.0.0, I recommend reviewing dbt-labs [upgrading to 1.0.0 docs](https://docs.getdbt.com/docs/guides/migration-guide/upgrading-to-1-0-0) for more details on what changes must be made.
- Upgrades the package dependency to refer to the latest `dbt_fivetran_utils`. The latest `dbt_fivetran_utils` package also has a dependency on `dbt_utils` [">=0.8.0", "<0.9.0"].
  - Please note, if you are installing a version of `dbt_utils` in your `packages.yml` that is not in the range above then you will encounter a package dependency error.

# dbt_hubspot_source v0.1.0 -> v0.4.3
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!

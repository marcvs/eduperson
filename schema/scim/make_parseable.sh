#!/bin/bash


cat eduperson_schema_raw.json\
    | grep -vE "(saml_attribute_name|saml_attribute_urn|status|comment)\":" \
    | sed s/"#.*"// \
    | sed s_\ //.*__ \
    | sed s/\"unclear.*\"/true/ \
    | sed s/\"to\ be\ evaluated\"/true/ \
    | sed '/^\ *$/d' \
    > eduperson_schema.json

cat eduperson_SCIM_example_raw.json\
    | grep -vE "(saml_attribute_name|saml_attribute_urn|status|comment)\":" \
    | sed s/"#\ .*"// \
    | sed s_\ //.*__ \
    | sed s/\"unclear.*\"/true/ \
    | sed s/\"to\ be\ evaluated\"/true/ \
    | sed '/^\ *$/d' \
    > eduperson_SCIM_example.json

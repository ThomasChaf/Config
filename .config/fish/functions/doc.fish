function b_doc_preview --description "Preview documentation"
    npx @redocly/cli preview-docs docs/partner-openapi/v1.0/openapi.yaml
end

function b_doc_build --description "Build documentation"
    npx @redocly/cli build-docs docs/partner-openapi/v1.0/openapi.yaml
end

function b_doc_deploy_beta --description "Deploy documentation to beta"
    aws s3 cp redoc-static.html s3://happydemics-public-files/documentation/api/connect/v1.0/index.beta.html
    aws cloudfront create-invalidation --distribution-id E5QB4DH0X6FW4 --paths '/documentation/api/connect/*'
end

function b_doc_deploy_prod --description "Deploy documentation to production"
    aws s3 cp redoc-static.html s3://happydemics-public-files/documentation/api/connect/v1.0/index.html
    aws cloudfront create-invalidation --distribution-id E5QB4DH0X6FW4 --paths '/documentation/api/connect/*'
end

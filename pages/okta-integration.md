---
title: Okta App Integration & Workflow
layout: doc
---

# Okta App Integration & Workflow

## Overview

Okta app integrations connect software to Okta for authentication, single sign-on (SSO), and user lifecycle management. Exact options and labels can vary with your Okta org, subscription, and admin-console version.

## Protocols at a glance

| Technology | Primary purpose | What to configure |
| :--- | :--- | :--- |
| SAML 2.0 | Federated browser SSO, commonly for enterprise applications. | ACS / SSO URL, audience or entity ID, NameID, attributes, and signing certificate. Use values from the app vendor. |
| OpenID Connect (OIDC) | User authentication and identity claims on top of OAuth 2.0. | App type, exact redirect URIs, grant types, scopes, issuer, and client authentication. |
| SWA | Launch an app that has no federation support by securely storing and submitting credentials. | App sign-in URL and credential behavior; this is not federated SSO. |
| SCIM | Provisioning and lifecycle synchronization, not an authentication protocol. | SCIM base URL, unique user identifier, authentication mode, and supported import / push actions. |

OAuth 2.0 is for delegated access to APIs using access tokens. OIDC adds an authentication layer and ID tokens with user claims. Do not treat an access token as an ID token.

## Choose an OIDC flow

| Use case | Common flow | Notes |
| :--- | :--- | :--- |
| Browser, SPA, mobile, or native app with a user | Authorization Code with PKCE | Recommended default for interactive sign-in. Public clients cannot safely keep a client secret. |
| Server-side web app with a user | Authorization Code with PKCE | Use confidential-client authentication on the server and keep credentials server-side. |
| Service-to-service with no user | Client Credentials | Confidential server-side client; no user sign-in and no refresh token in this flow. |
| Embedded sign-in in an Identity Engine org | Interaction Code | Okta-specific extension; use only when this deployment model is required. |

Avoid Implicit and Resource Owner Password flows for new applications. Okta recommends Authorization Code with PKCE where possible; choose the flow based on client type and whether a user is present.

## Build an integration

1. In the Admin Console, open **Applications > Applications** and choose **Create App Integration**. The exact menu labels vary between the Classic and Identity Engine experiences.
2. Choose the protocol and app type supported by the target application. For an OIN app, prefer the catalog integration when it meets the requirements.
3. Get the required URLs, metadata, and attribute requirements from the application owner before configuring Okta.
4. Configure the general settings and protocol-specific fields below.
5. Save the integration, assign a test user or group, and verify sign-in and logout before broad assignment.

### SAML checklist

- Match the **Single sign-on URL / ACS URL** and **Audience URI / Entity ID** exactly to the service provider's values.
- Confirm the NameID format and any required user or group attributes with the application owner.
- Preview the generated SAML assertion and check its issuer, audience, recipient, subject, and attributes.
- Configure the application to trust Okta's signing certificate and plan certificate rotation.

### OIDC checklist

- Choose **Web**, **Single-Page Application**, or **Native Application** to match the actual client.
- Register exact sign-in redirect URIs and, where used, sign-out redirect URIs. Avoid wildcard redirect subdomains.
- Select only the required grant types and scopes. Use Authorization Code with PKCE for user sign-in where possible.
- Copy the issuer and client ID into the application configuration. Keep any client secret or private key on a confidential server only.
- Validate redirect and logout behavior against the registered URIs.

### SCIM provisioning checklist

- Confirm the integration type supports SCIM; Okta's current docs distinguish Classic OIDC apps from apps created through the Integration Wizard.
- Configure the SCIM base URL, unique user ID field, and a supported authentication mode.
- Enable only the actions the app supports, such as push users, profile updates, group push, or user import.
- Test create, update, group assignment, and deactivation with a non-production account before enabling broad provisioning.

## Troubleshooting checks

- Confirm the app integration is assigned to the user and that the user's profile has the required attributes.
- Compare SAML URLs, audience, NameID, attributes, and signing certificate with the service provider's configuration.
- For OIDC, compare the redirect URI character-for-character and confirm issuer, client type, scopes, and grant types.
- Review the Okta System Log and the application logs around a failed test sign-in.
- Treat UI labels and available features as org- and engine-dependent; check the current Okta Admin Console documentation.

Never put client secrets, private keys, API tokens, or production assertions in source control, public documentation, or unsecured tickets. A `sensitive` label does not make a credential safe to publish.

## Official references

- [Okta: Create custom app integrations](https://help.okta.com/oie/en-us/content/topics/apps/apps_app_integration_wizard.htm)
- [Okta: Create SAML app integrations](https://help.okta.com/oie/en-us/content/topics/apps/apps_app_integration_wizard_saml.htm)
- [Okta: Create OIDC app integrations](https://help.okta.com/oie/en-us/content/topics/apps/apps_app_integration_wizard_oidc.htm)
- [Okta: Add SCIM provisioning](https://help.okta.com/oie/en-us/content/topics/apps/apps_app_integration_wizard_scim.htm)
- [Okta OAuth 2.0 and OIDC overview](https://developer.okta.com/docs/concepts/oauth-openid/)
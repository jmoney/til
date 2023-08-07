# SAML Assersiont URL

This is the URL that a SAML2 compliant IDP will redirect the request back too.  There are two ways that this URL can be set and both work for specific mechanisms.

1. Set in the IDP the ACS URL for an application.  This is used when you go to an IDP and click on the application to sign in.
2. Set on the SAML Request.  This is for when you navigate to a page that requires SAML auth so the page sends you to the configured IDP for signin.

Most times these much match but are used fro two completely separate signin mechanisms.
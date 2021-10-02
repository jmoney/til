# SAML RelayState

The original meaning of RelayState is that the service provider can send some value to the identity provider together with the AuthnRequest and then get it back. The service provider can put whatever value it wants in the RelayState and the identity provider should just echo it back in the response.

The main use case of RelayState is where the service provider redirects the user after login with the identity provider.  Since there is a lot of URL hopping during SAML login, RelayState is perfect to provide context to the final leg on where to redirect the user too.

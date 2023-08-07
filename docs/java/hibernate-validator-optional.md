# Hibernate Validator Optional

Apparently, the correct way of validating a type within an optional is the following

```java
@QueryParam("origin") Optional<@URL(protocol = "http") String> origin,
```

instead of

```java
@QueryParam("origin") @URL(protocol = "http") Optional<String> origin,
```

When doing the latter the following exception is returned

```plain
HV000030: No validator could be found for constraint 'org.hibernate.validator.constraints.URL' validating type 'java.util.Optional<java.lang.String>'.
```.

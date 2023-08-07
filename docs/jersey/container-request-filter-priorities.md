# Container Request Filter Priorities

A collection of built-in priority constants for the components that are supposed to be ordered based on their javax.annotation.Priority class-level annotation value when used or applied by the runtime.

For example, filters and interceptors are grouped in chains for each of the message processing extension points: Pre, PreMatch, Post as well as ReadFrom and WriteTo. Each of these chains is sorted based on priorities which are represented as integer numbers. All chains, except Post, are sorted in ascending order; the lower the number the higher the priority. The Post filter chain is sorted in descending order to ensure that response filters are executed in reverse order.
Components that belong to the same priority class (same integer value) are executed in an implementation-defined manner. By default, when the @Priority annotation is absent on a component, for which a priority should be applied, the USER priority value is used.

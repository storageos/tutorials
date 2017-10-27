Policies are a simple Attribute-Based Access Control records that are used to permission users (or groups) to namespaces.

Create a policy to enable the `dev` group to access the `restricted` namespace:

 `storageos policy create --group dev --namespace restricted`{{execute}}
 `storageos policy ls`{{execute}}

Policies can only be created by an administrator user. StorageOS creates one admin on initial startup, the `storageos` user. As you are logged in as `storageos`, you can perform any action within the system.

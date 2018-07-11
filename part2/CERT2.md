*Quick links :*
[Home](/README.md) - [Part 1](/part1/README.md) - [**Part 2**](/part2/README.md) - [Part 3](/part3/README.md) - [Part 4](/part4/README.md)
***
**Part 2** - [Device Registration](/part2/DEVICE.md) - [Application](/part2/APP.md) - [Server Certificate](/part2/CERT1.md) - [**Client Certificate**](/part2/CERT2.md)
***

# Using a Device Certificate to authenticate to the Watson IoT platform

## Lab Objectives

In this lab you will extend the application by enabling client side certificates.  You will learn how to:

- Generate client keys and certificates
- Modify the flow to use the client certificates
- Configure the IoT platform connection policy to require tokens and/or certificates

### Step 1 - Generating the key and certificate for a device

The openssl tool must be used to generate the key and certificate, as in the previous lab.  If you altered the root CA key password, then remember to change the value in the commands shown below.  If you didn't user device Type **Raspberry** and device ID **dev01**, then you must change the values to match:

```bash
openssl genrsa -aes256 -passout pass:password123 -out SecuredDev01_key.pem 2048

openssl req -new -sha256 -days 3560 -subj "/C=GB/ST=DOR/L=Bournemouth/O=z53u40/OU=z53u40 Corporate/CN=d:Raspberry:dev01" -passin pass:password123 -key SecuredDev01_key.pem -out SecuredDev01_crt.csr

openssl x509 -days 3650 -in SecuredDev01_crt.csr -out SecuredDev01_crt.pem -req -sha256 -CA rootCA_certificate.pem -passin pass:password123 -CAkey rootCA_key.pem -set_serial 131

openssl rsa -outform der -in SecuredDev01_key.pem -passin pass:password123 -out SecuredDev01_key.key

openssl x509 -outform der -in SecuredDev01_crt.pem -out SecuredDev01_crt.der
```

### Step 2 - Upload the certificate and key to the Raspberry Pi

You need to add the private key (SecuredDev01_key.pem) and the certificate (SecuredDev01_crt.pem) to the IoT node configuration.  Open up the SSL configuration and upload the certificate and key.

**Note**:  *there is a bug in the IoT Node-RED node, that does not process the passphrase (password123) correctly, so you need to remove the passphrase from the key.  Use the command below to create a version of the key file, without a passphrase and upload that version (SecuredDev01_key_nopw.pem)*

``` sh
openssl rsa -in SecuredDev01_key.pem -passin pass:password123 -out SecuredDev01_key_nopw.pem
```

### Step 3 - Configure the security policy on the IoT platform

You now have client certificates working with the device, so can now choose how you want devices to be verified.  If you open the IoT Platform console and got to the settings section then the Connection Security section and Open Connection Security Policy you see you have a number of options:

- TLS Optional
- TLS with Token Authentication
- TLS with Client Certificate Authentication
- TLS with Client Certificate AND Token Authentication
- TLS with Client Certificate OR Token Authentication

You can now decide what policy you want.

You will also see that you can create Custom Rules in addition to the Default Rule.  This allows different device types to have a different policy . If a device type doesn't match a custom rule then the default rule is used.

***
*Quick links :*
[Home](/README.md) - [Part 1](/part1/README.md) - [**Part 2**](/part2/README.md) - [Part 3](/part3/README.md) - [Part 4](/part4/README.md)
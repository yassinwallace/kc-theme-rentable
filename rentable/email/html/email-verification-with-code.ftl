<#--
  This file has been claimed for ownership from @keycloakify/email-native version 260007.0.0.
  To relinquish ownership and restore this file to its original content, run the following command:
  
  $ npx keycloakify own --path "email/html/email-verification-with-code.ftl" --revert
-->

<#import "template.ftl" as layout>
<@layout.emailLayout>
<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">Hello,</p>

<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">Someone has created a Rentable account with this email address. To verify your email address, please use the following verification code:</p>

<div style="margin: 20px 0; padding: 15px; background-color: #f5f7fa; border-radius: 5px; text-align: center;">
    <p style="margin: 0; font-size: 24px; font-weight: bold; letter-spacing: 2px; color: #333333; font-family: monospace;">${code}</p>
</div>

<p style="margin: 15px 0; font-size: 16px; line-height: 1.5; color: #333333;">If you did not create this account, please disregard this email.</p>

<p style="margin: 15px 0 0; font-size: 14px; line-height: 1.5; color: #666666;">This email was sent to you by Rentable.</p>
</@layout.emailLayout>

<#--
  This file has been claimed for ownership from @keycloakify/email-native version 260007.0.0.
  To relinquish ownership and restore this file to its original content, run the following command:
  
  $ npx keycloakify own --path "email/html/email-verification.ftl" --revert
-->

<#import "template.ftl" as layout>
<@layout.emailLayout>
<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">Hello,</p>

<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">Someone has created a Rentable account with this email address. If this was you, click the button below to verify your email address.</p>

<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">This link will expire in ${linkExpiration} minutes.</p>

<@layout.button link="http://localhost:8080/user/verifyemail?redirect=${link}" text="Verify Email Address" />

<p style="margin: 15px 0; font-size: 16px; line-height: 1.5; color: #333333;">If you did not create this account, please disregard this email.</p>

<p style="margin: 15px 0 0; font-size: 14px; line-height: 1.5; color: #666666;">This email was sent to you by ${realmName}.</p>
</@layout.emailLayout>

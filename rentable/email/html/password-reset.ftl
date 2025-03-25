<#--
  WARNING: Before modifying this file, run the following command:
  
  $ npx keycloakify own --path "email/html/password-reset.ftl"
  
  This file is provided by @keycloakify/email-native version 260007.0.0.
  It was copied into your repository by the postinstall script: `keycloakify sync-extensions`.
-->

<#import "template.ftl" as layout>
<@layout.emailLayout>
<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">Hello,</p>

<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">Someone has requested to reset your password for your Rentable account. If this was you, click the button below to reset your password.</p>

<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">This link will expire in ${linkExpiration} minutes.</p>

<@layout.button link="${link}" text="Reset Password" />

<p style="margin: 15px 0; font-size: 16px; line-height: 1.5; color: #333333;">If you did not request this password reset, please ignore this email or contact support if you have concerns.</p>

<p style="margin: 15px 0 0; font-size: 14px; line-height: 1.5; color: #666666;">This email was sent to you by ${realmName}.</p>
</@layout.emailLayout>

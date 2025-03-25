<#--
  This file has been claimed for ownership from @keycloakify/email-native version 260007.0.0.
  To relinquish ownership and restore this file to its original content, run the following command:
  
  $ npx keycloakify own --path "email/html/email-update-confirmation.ftl" --revert
-->

<#import "template.ftl" as layout>
<@layout.emailLayout>
<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">Hello,</p>

<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">Someone has requested to change your email address for your Rentable account from your current email to <strong>${newEmail}</strong>.</p>

<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">If this was you, click the button below to confirm this change. This link will expire in ${linkExpiration} minutes.</p>

<@layout.button link="${link}" text="Confirm Email Change" />

<p style="margin: 15px 0; font-size: 16px; line-height: 1.5; color: #333333;">If you did not request this change, please ignore this email or contact support if you have concerns.</p>

<p style="margin: 15px 0 0; font-size: 14px; line-height: 1.5; color: #666666;">This email was sent to you by ${realmName}.</p>
</@layout.emailLayout>

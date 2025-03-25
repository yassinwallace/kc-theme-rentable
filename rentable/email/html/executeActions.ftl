<#--
  WARNING: Before modifying this file, run the following command:
  
  $ npx keycloakify own --path "email/html/executeActions.ftl"
  
  This file is provided by @keycloakify/email-native version 260007.0.0.
  It was copied into your repository by the postinstall script: `keycloakify sync-extensions`.
-->

<#outputformat "plainText">
<#assign requiredActionsText><#if requiredActions??><#list requiredActions><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#sep></#items></#list></#if></#assign>
</#outputformat>

<#import "template.ftl" as layout>
<@layout.emailLayout>
<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">Hello,</p>

<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">Your administrator has requested that you update your Rentable account by performing the following action(s):</p>

<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333; font-weight: 500;">${requiredActionsText}</p>

<p style="margin: 0 0 15px; font-size: 16px; line-height: 1.5; color: #333333;">This link will expire in ${linkExpiration} minutes.</p>

<@layout.button link="${link}" text="Update Account" />

<p style="margin: 15px 0 0; font-size: 14px; line-height: 1.5; color: #666666;">This email was sent to you by ${realmName}.</p>
</@layout.emailLayout>

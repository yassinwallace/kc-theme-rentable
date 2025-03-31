# Rentable Keycloak Theme

A custom Keycloak theme for the Rentable application, providing a clean, modern authentication experience.

## Project Structure

This project contains two main theme folders:

- **base**: Original Keycloak theme (never modify these files)
- **rentable**: Custom theme that inherits from base (contains only modified elements)

## Workflow Guidelines

When customizing the theme:

1. **Never modify the base theme directly**
2. **Copy files from base to rentable before modifying**
3. All customizations go into the rentable folder
4. Only copy the files you need to modify

## Theme Features

The Rentable theme includes:

- Clean, modern design with a white card on a dark background
- "rentable" as the main title
- Styled form inputs with blue primary buttons
- Google sign-in integration
- Auto-redirect functionality for email verification
- Responsive design with good whitespace

## Key Files

### Login Theme

- `rentable/login/login.ftl` - Main login page template
- `rentable/login/info.ftl` - Information page (verification, errors, etc.)
- `rentable/login/template.ftl` - Base template structure for all pages
- `rentable/login/theme.properties` - Theme configuration
- `rentable/login/resources/css/login.css` - Custom styling

## Development

### Testing Changes

To test changes to the theme:

1. Make changes to files in the rentable folder
2. Restart Keycloak or clear the theme cache
3. View the changes in the browser

### CSS Customization

The theme uses a custom CSS file that overrides the default Keycloak styling. Key style elements:

- Font family: Roboto
- Primary color: #3366ff (blue)
- Card background: White with subtle shadow
- Form inputs: Clean with light background
- Buttons: Blue primary buttons with hover effects

## Social Providers

The theme includes special styling for social login providers, with Google receiving custom styling.

# Remark

A Rails blogging engine.

## Stack

- Ruby 3.4.8, Rails 7.2.3
- SQLite3 (dev/test), asset pipeline via Sprockets
- JavaScript, SCSS, Bootstrap 3, jQuery UI

## Setup

```
bundle install --without production
bundle exec rake db:drop db:create db:schema:load db:seed
bundle exec rails s
```

Default login at `/admin`: `admin` / `password`

## Testing

```
bundle exec rspec
```

- RSpec with `should` syntax, FactoryBot factories in `spec/factories/`
- Controller specs use `params:` keyword argument style and `be_successful` matcher
- `rails-controller-testing` gem required for `render_template` matcher
- Transactional fixtures handle DB cleanup (no database_cleaner gem)

## Architecture

### Models

Article, Page, Document, User, Role, Tag, Setting, Ability (CanCanCan)

- `Setting` has a `default_scope` filtering `hidden: false`; use `Setting.application` for app settings, `Setting.unscoped` to bypass
- `IDENTIFIER` constant (`com.github.digitalpardoe.remark`) defined in `config/initializers/registry.rb` — used as the Setting resource namespace
- Articles/Pages use text filters (Markdown via Kramdown, Textile via RedCloth, HTML)
- Time handling: `config/initializers/time_extensions.rb` monkey-patches `Time` with `zoned`/`unzoned` methods; `lib/extensions/time_zoned.rb` defines the `TimeZoned` module

### Assets

- `jquery-ui-rails` 6.0 asset paths: `jquery-ui/widgets/datepicker` (JS), `jquery-ui/datepicker` (CSS)
- No `app/assets/images/` directory — do not add `link_tree ../images` to `manifest.js`

### Auth

- Session-based auth via `UserSessionsController`, stored in `session[:user_id]`
- Authorization via CanCanCan (`Ability` model)
- Admin controllers inherit from `AdminController` which rescues `CanCan::AccessDenied`

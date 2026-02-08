# Remark

A Rails blogging engine.

## Stack

- Ruby 3.1.7, Rails 6.1.7.8
- SQLite3 (dev/test), asset pipeline via Sprockets
- CoffeeScript, SCSS, Bootstrap 3, jQuery UI
- `logger` gem pinned to `~> 1.5.0` (1.6+ breaks Rails 6.1's `ActiveSupport::LoggerThreadSafeLevel`)

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
- Time handling: `lib/extensions/time_zoned.rb` monkey-patches `Time` with `zoned`/`unzoned` methods that read the `time_zone` setting

### Assets

- `jquery-ui-rails` 6.0 asset paths: `jquery-ui/widgets/datepicker` (JS), `jquery-ui/datepicker` (CSS)
- No `app/assets/images/` directory — do not add `link_tree ../images` to `manifest.js`

### Auth

- Session-based auth via `UserSessionsController`, stored in `session[:user_id]`
- Authorization via CanCanCan (`Ability` model)
- Admin controllers inherit from `AdminController` which rescues `CanCan::AccessDenied`

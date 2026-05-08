# Deploy and Host listmonk on Railway

listmonk is a high-performance, self-hosted newsletter and mailing list manager. It ships with a modern web UI, subscriber management, templated campaigns, analytics, and a REST API — giving you full ownership of your audience data without relying on third-party email platforms.

## About Hosting listmonk

Hosting listmonk requires running its Go-based application server alongside a PostgreSQL database. listmonk stores all subscriber data, campaign content, and analytics in Postgres, so a reliable, persistent database is essential. On Railway, both services are provisioned and networked automatically. The app reads its database connection and SMTP credentials from environment variables at startup. You will also need to configure an external SMTP provider (such as Amazon SES, Postmark, or SendGrid) for actual email delivery — listmonk handles the scheduling and templating, but delegates sending to your chosen provider.

## Common Use Cases

- Running newsletters and drip campaigns for SaaS products or creator audiences
- Managing transactional and marketing email lists for a startup without paying per-subscriber fees
- Self-hosting a Mailchimp or ConvertKit replacement with full data portability

## Dependencies for listmonk Hosting

- **PostgreSQL** — primary data store for subscribers, lists, campaigns, and analytics
- **SMTP provider** — external mail relay (e.g. Amazon SES, Postmark, SendGrid, Mailgun) for email delivery

### Deployment Dependencies

- [listmonk Documentation](https://listmonk.app/docs/)
- [listmonk GitHub Repository](https://github.com/knadh/listmonk)
- [listmonk Configuration Reference](https://listmonk.app/docs/configuration/)
- [Railway PostgreSQL Plugin](https://docs.railway.com/databases/postgresql)

## Why Deploy listmonk on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you do not have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying listmonk on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.

# Going live on copybykaine.com

Right now the new site is live at **https://kaine2005.github.io/** and your real
domain **copybykaine.com** still points at the old Netlify HTML site. This is how
you swap the domain over to the new site. Takes about 10-15 minutes, then up to a
few hours for DNS to fully settle.

**Your email keeps working the whole time.** We only touch the website records,
never the email (MX) records. Don't delete anything with "MX" in it.

Do the steps in this order.

---

## Step 1 — Tell GitHub the domain is yours

1. Go to your repo: **github.com/Kaine2005/kaine2005.github.io**
2. **Settings** → **Pages** (left sidebar)
3. Under **Custom domain**, type: `copybykaine.com` → **Save**
4. GitHub will start a DNS check (it'll show a warning until Step 2 is done — that's normal)

## Step 2 — Point the domain at GitHub (in Netlify's DNS)

Your DNS is managed in Netlify. Go to **app.netlify.com** → your **domain** →
**DNS settings** (or Domains → copybykaine.com → DNS panel).

**a) Remove the old website records** that point the site at Netlify's hosting:
   - Delete the existing **A record** on the apex (`copybykaine.com` / `@`) that points to Netlify
   - Delete the existing **CNAME** on `www` if it points to a `.netlify.app` address
   - ⚠️ Leave every **MX** record alone. Leave any **TXT** records alone (that's your
     Google verification and email stuff).

**b) Add the GitHub Pages records:**
   - **Four A records** on the apex (`@` / `copybykaine.com`), each pointing to:
     ```
     185.199.108.153
     185.199.109.153
     185.199.110.153
     185.199.111.153
     ```
   - **One CNAME** record: name `www` → value `kaine2005.github.io`

## Step 3 — Turn on HTTPS

1. Wait until GitHub's Pages settings shows the domain check has passed (can take
   a few minutes to an hour)
2. Back in **Settings → Pages**, tick **Enforce HTTPS**

## Step 4 — Check it

- Visit **https://copybykaine.com** — you should see the new site
- Visit **https://www.copybykaine.com** — should redirect to the same
- Send yourself a test email to make sure email still works (it will, if you left MX alone)

## Step 5 — Tell me

Message me once it's live and I'll:
- Update every internal link and all the structured data from `kaine2005.github.io`
  to `copybykaine.com`
- Submit the sitemap in Google Search Console and request indexing
- Check the Preferred Sources button now works on the real domain

---

**Don't want to do it solo?** Just say the word when you sit down and I'll walk you
through each screen live.

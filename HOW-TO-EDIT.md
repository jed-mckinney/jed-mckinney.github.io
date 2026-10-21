# How to edit your website

Each page of the site is one plain-text file written in **Markdown**. When
your edit is saved to GitHub, the live site updates on its own within a
minute or two.

| Page on the site    | File to edit   |
|---------------------|----------------|
| Home                | `index.md`     |
| about me            | `about.md`     |
| science             | `science.md`   |
| resources & tools   | `resources.md` |
| group               | `group.md`     |
| choir               | `choir.md`     |
| media               | `media.md`     |
| cv                  | replace `assets/files/McKinney_CV.pdf` |
| The menu, site name | `_config.yml`  |
| Colors and fonts    | `assets/css/site.css` (top of the file) |

## The easiest way: edit on github.com

1. Go to your repository on github.com and click the file (for example `group.md`).
2. Click the pencil icon ("Edit this file").
3. Make your change, then click **Commit changes**.
4. Wait about a minute and refresh your website.

To upload a new image or a new CV: open the `assets/img` (or `assets/files`)
folder on github.com, click **Add file → Upload files**, and drag the file in.
To replace your CV, upload a file with the exact same name, `McKinney_CV.pdf`.

## Markdown cheat sheet

```
## A section heading
### A smaller heading

A paragraph is just text. Leave a blank line between paragraphs.

**bold text**   *italic text*

[words that become a link](https://example.com)

- a bulleted list item
- another item

![short description of the image](/assets/img/my-image.jpg)

---          (a thin divider line)
```

Two extras used on this site:

- A line of `{: .caption}` directly under a paragraph makes it small, italic,
  and centered (used for photo captions).
- A line of `{: .people}` or `{: .pubs}` directly under a list removes the
  bullet points.

The block between the two `---` lines at the top of each file is page
settings (its title and web address). You usually won't need to touch it.

## Common tasks

**Add a mentee** — in `group.md`, copy an existing line such as
`- **Leo Sajkov**, Tufts undergrad (2023-2024)` and change the words. Keep the
new line inside the list (no blank line above it).

**Add a paper** — in `science.md`, copy a line under "Selected Publications".

**Add a media item** — in `media.md`, add `---` and then a new `## Heading`,
optional image, and paragraph at the top or bottom.

**Add a tool or dataset** — `resources.md` has instructions in a comment
at the top showing which block to copy.

**Add a page to the menu** — in `_config.yml`, copy a `- title:` / `url:` pair
under `nav:`. Then create the page file (copy `choir.md` as a starting point and
change its `title` and `permalink`).

## Previewing on your Mac before publishing

1. Double-click `preview.command` in this folder (in Finder). A Terminal
   window opens, and after a few seconds your browser shows the site.
2. Edit and save any `.md` file. The browser refreshes on its own.
   If a page ever looks unstyled, refresh the browser once.
3. When you're done, close the Terminal window.

Nothing you do here is public. The live site changes only when files are
uploaded to GitHub.

## Publishing edits made on your Mac

1. Double-click `publish.command` in this folder (in Finder).
2. It lists the files you changed and checks the site still builds. If
   something is broken, it stops and nothing is published.
3. Type a few words describing your change and press Return. To cancel
   instead, just close the window.
4. The live site updates about a minute later.

Edits made on github.com and on your Mac can be mixed freely; the
publish file brings in any github.com edits before uploading yours.

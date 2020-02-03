---
title: Avoid using <object> tag inside anchor <a> tag
date: '2020-02-03T00:00:00Z'
draft: false
slug: 'avoid-using-object-tag-inside-anchor-tag'
categories: ['Tech']
tags: ['html', 'anchor', 'element']
description: 'Avoid using the <object> element inside a anchor <a> element to give a proper definition of the links without any extra configuration'
---

I have been recently working on a project where I got an issue with the anchor
[`<a>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a) tag. The issue was with the hover effect on the
anchor tag. There was no hover effect over the link. Plus, the link was not working either. However,
the hover effect was seen below the link for small space. The anchor element had a
[`<object>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object) element inside it and that was the
reason of the issue. The link element looked like this:

```html
<a href="..." title="...">
  <object type="image/svg" data="path/to/svg/image" class="some-class-name"></object>
</a>
```

With the help of some searches, I tried different solutions through CSS. But, could not get any luck. Later on, there
was an easy fix to the solution. I replaced the
[`<object>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object) tag with
[`<img>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img) element and it worked like a charm without
making any extra changes for the hover effect and link to work. The solution looks like this:

```html
<a href="..." title="...">
  <img src="path/to/svg/image" class="some-class-name" />
</a>
```

The same class provided the same design as earlier. Also, it could not hamper the SEO as well.

Also, there was a similar case with the use of [`<label>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/label)
inside the[`<a>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a) element. Removing the
[`<label>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/label) element resolved the issue. You can use a
[`<span>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/span) element if needed.

Hope it helps.

Happy coding!!!

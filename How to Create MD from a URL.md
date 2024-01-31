# How to Make a Markdown Copy of a URL

Follow these steps....

1. Use this link to convert link to markdown syntax - https://urltomarkdown.com/

2. Paste the URL into the box and click the **Fetch and Convert** button.

3. Copy the markdown syntax generated to VS Code saving as **<file_name>.md**.

4. From your browser, right click on the web page and select **Save As**, this will download the web page as an HTML file (including images).

5. Review images downloaded compared to images contained within the URL, find a pattern (ie: they might be **.png** files)

6. Create a local child folder to store the images (ie: **\_images**)

7. Cycle through each **https** referenced image and move actual image file from download folder to child folder in your git repository.

8. Update location to local child folder (ie: **./\_images/<filename>.png**)

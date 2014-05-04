## Ragged Redcarpet
Example RedCarpet Renderer for adjusting the right rag of the generated HTML. It works by inserting `&nbsp` elements according to a set of rules:

1. Never break a line immediately following a preposition.
2. Never break a line immediately following a dash.
3. No small words at the end of a line.
4. Don't break emphasised, bold or linked phrases of three or fewer words.
5. Don't allow orphans at the end of paragraphs.

## Further Reading

This was inspired by Mark boulton's [article](http://24ways.org/2013/run-ragged/) on 24Ways.

I wrote about it here: <http://danny.is/writing/controlling-the-rag-with-redcarpet-140504>

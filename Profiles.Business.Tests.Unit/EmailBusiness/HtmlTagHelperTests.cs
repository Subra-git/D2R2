using Profiles.Business.EmailBusiness;
using Xunit;

namespace Profiles.Business.Tests.Unit.EmailBusiness
{
    public class HtmlTagHelperTests
    {
        [Fact]
        public void ToString_EmptyTagNoAttributes_ShouldRenderSelfClosing()
        {
            var tag = new HtmlTagHelper("br");
            Assert.Equal("<br/>", tag.ToString());
        }

        [Fact]
        public void ToString_TagWithTextContent_ShouldRenderOpenAndCloseTag()
        {
            var tag = new HtmlTagHelper("p");
            tag.AppendInnerContent("Hello");
            Assert.Equal("<p>Hello</p>", tag.ToString());
        }

        [Fact]
        public void ToString_TagWithAttributes_ShouldRenderAttributesInTag()
        {
            var tag = new HtmlTagHelper("td");
            tag.AddAttribute("align", "center");
            tag.AddAttribute("colspan", "2");
            tag.AppendInnerContent("Data");
            Assert.Equal("<td align=\"center\" colspan=\"2\">Data</td>", tag.ToString());
        }

        [Fact]
        public void ToString_NestedTags_ShouldRenderNestedHtml()
        {
            var inner = new HtmlTagHelper("strong");
            inner.AppendInnerContent("Bold");
            var outer = new HtmlTagHelper("p", inner);

            Assert.Equal("<p><strong>Bold</strong></p>", outer.ToString());
        }

        [Fact]
        public void ToString_MultipleAppendInnerContent_ShouldConcatenateContent()
        {
            var tag = new HtmlTagHelper("p");
            tag.AppendInnerContent("Hello ");
            tag.AppendInnerContent("World");
            Assert.Equal("<p>Hello World</p>", tag.ToString());
        }

        [Fact]
        public void ToString_AppendInnerContentWithHelper_ShouldRenderHelperHtml()
        {
            var tag = new HtmlTagHelper("div");
            var child = new HtmlTagHelper("span");
            child.AppendInnerContent("inside");
            tag.AppendInnerContent(child);

            Assert.Equal("<div><span>inside</span></div>", tag.ToString());
        }

        [Fact]
        public void ToString_ConstructorWithMultipleInnerHtml_ShouldRenderAllChildren()
        {
            var child1 = new HtmlTagHelper("li");
            child1.AppendInnerContent("Item 1");
            var child2 = new HtmlTagHelper("li");
            child2.AppendInnerContent("Item 2");

            var list = new HtmlTagHelper("ul", child1, child2);

            Assert.Equal("<ul><li>Item 1</li><li>Item 2</li></ul>", list.ToString());
        }

        [Fact]
        public void ToString_EmptyTagWithAttributes_ShouldRenderWithAttributes()
        {
            var tag = new HtmlTagHelper("meta");
            tag.AddAttribute("content", "utf-8");
            // tag has attributes but no inner content — should still render open/close
            Assert.Equal("<meta content=\"utf-8\"></meta>", tag.ToString());
        }
    }
}

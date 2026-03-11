using System.Collections.Generic;
using System.Linq;

namespace Profiles.Business.EmailBusiness
{
    public class HtmlTagHelper
    {
        private readonly string name;
        private readonly Dictionary<string, string> attributes;
        private string value;

        public HtmlTagHelper(string name, params HtmlTagHelper[] innerHtml)
        {
            this.name = name;

            this.value = string.Empty;
            foreach (var htmlTagHelper in innerHtml)
            {
                value += htmlTagHelper.ToString();
            }

            attributes = new Dictionary<string, string>();
        }

        public void AppendInnerContent(string value)
        {
            this.value += value;
        }

        public void AppendInnerContent(HtmlTagHelper helper)
        {
            value += helper.ToString();
        }

        public void AddAttribute(string name, string value)
        {
            attributes.Add(name, value);
        }

        public override string ToString()
        {
            var attributeHtml = attributes.Aggregate(string.Empty, (current, attribute) => current + string.Format(" {0}=\"{1}\"", attribute.Key, attribute.Value));

            if (string.IsNullOrEmpty(value) && string.IsNullOrEmpty(attributeHtml))
            {
                return string.Format("<{0}/>", name);
            }

            return string.Format("<{0}{1}>{2}</{0}>", name, attributeHtml, value);
        }
    }
}

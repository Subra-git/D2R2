using System;

namespace Profiles.Infrastructure
{
    public static class LogHelper
    {
        public static string ExceptionWithStackTrace(Exception ex)
        {
            var messageTemplate = "An Exception occured: {0}{1}at {2}";

            var message = string.Empty;
            while (ex != null)
            {
                message += string.Format(messageTemplate, ex.Message, Environment.NewLine, ex.StackTrace);
                message += Environment.NewLine;
                message += Environment.NewLine;
                messageTemplate = "Inner Exception: {0}{1} at {2}";

                ex = ex.InnerException;
            }

            return message;
        }
    }
}

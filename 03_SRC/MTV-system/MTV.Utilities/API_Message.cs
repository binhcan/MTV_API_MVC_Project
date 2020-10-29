using System;

namespace MTV.Utilities
{
    public static class API_Message
    {
        public static string success(string code_number)
        {
            return Setting.Configuration[String.Format("Message:success:{0}", code_number)];
        }

        public static string error(string code_number)
        {
            return Setting.Configuration[String.Format("Message:error:{0}", code_number)];
        }
    }
}

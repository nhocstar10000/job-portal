using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace job_portal
{
    public class Utils
    {
        public static bool IsVaildToExecute(string fileName)
        {
            bool isValid = false;
            string[] fileExtension = { ".png", ".jpg", ".jpeg" };
            for (int i = 0; i <= fileExtension.Length - 1; i++)
            {
                if (fileName.Contains(fileExtension[i]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
        }
        public static bool IsVaildToExecute4Resume(string fileName)
        {
            bool isValid = false;
            string[] fileExtension = { ".doc", ".docx", ".pdf" };
            for (int i = 0; i <= fileExtension.Length - 1; i++)
            {
                if (fileName.Contains(fileExtension[i]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
        }
    }
}
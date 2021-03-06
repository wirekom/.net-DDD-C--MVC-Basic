﻿using System;
using System.Web;


namespace Session.SessionStorage
{
    public class NHibernateSessionModule : IHttpModule
    {
        public void Init(HttpApplication context)
        {
            context.BeginRequest += new EventHandler(OpenSession);
            context.EndRequest += new EventHandler(CloseSession);
        }

        private void OpenSession(object sender, EventArgs e)
        {
            SessionFactory.Instance.OpenSession();
        }

        private void CloseSession(object sender, EventArgs e)
        {
            SessionFactory.Instance.CloseSession();
        }
        public void Dispose() { }
    }
}

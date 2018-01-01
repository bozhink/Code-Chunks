﻿namespace Common
{
    using System;
    using System.Data;
    using System.Data.Common;
    using System.Data.Entity.Infrastructure.Interception;
    using System.Text.RegularExpressions;
    using Common.Extensions;

    public class FtsInterceptor : IDbCommandInterceptor
    {
        private const string FullTextPrefix = "-FTSPREFIX-";

        public static string Fts(string search)
        {
            return string.Format("({0}{1})", FullTextPrefix, search);
        }

        public static void RewriteFullTextQuery(DbCommand cmd)
        {
            string text = cmd.CommandText;
            for (int i = 0; i < cmd.Parameters.Count; i++)
            {
                DbParameter parameter = cmd.Parameters[i];
                if (parameter.DbType.In(DbType.String, DbType.AnsiString, DbType.StringFixedLength, DbType.AnsiStringFixedLength))
                {
                    if (parameter.Value == DBNull.Value)
                    {
                        continue;
                    }

                    var value = (string)parameter.Value;
                    if (value.IndexOf(FullTextPrefix) >= 0)
                    {
                        parameter.Size = 4096;
                        parameter.DbType = DbType.AnsiStringFixedLength;

                        // remove prefix we added n Linq query
                        value = value.Replace(FullTextPrefix, string.Empty);

                        // remove %% escaping by Linq translator from string.Contains to SQL LIKE
                        value = value.Substring(1, value.Length - 2);

                        parameter.Value = value;

                        string pattern = string.Format(
                                @"\[(\w*)\].\[(\w*)\]\s*LIKE\s*@{0}\s?(?:ESCAPE N?'~')",
                                parameter.ParameterName);

                        string replacement =
                            string.Format(
                                @"contains([$1].[$2], @{0})",
                                parameter.ParameterName);

                        cmd.CommandText = Regex.Replace(
                            text,
                            pattern,
                            replacement);

                        if (text == cmd.CommandText)
                        {
                            throw new Exception("FTS was not replaced on: " + text);
                        }

                        text = cmd.CommandText;
                    }
                }
            }
        }

        public void NonQueryExecuted(DbCommand command, DbCommandInterceptionContext<int> interceptionContext)
        {
        }

        public void NonQueryExecuting(DbCommand command, DbCommandInterceptionContext<int> interceptionContext)
        {
        }

        public void ReaderExecuted(DbCommand command, DbCommandInterceptionContext<DbDataReader> interceptionContext)
        {
        }

        public void ReaderExecuting(DbCommand command, DbCommandInterceptionContext<DbDataReader> interceptionContext)
        {
            RewriteFullTextQuery(command);
        }

        public void ScalarExecuted(DbCommand command, DbCommandInterceptionContext<object> interceptionContext)
        {
        }

        public void ScalarExecuting(DbCommand command, DbCommandInterceptionContext<object> interceptionContext)
        {
            RewriteFullTextQuery(command);
        }
    }
}
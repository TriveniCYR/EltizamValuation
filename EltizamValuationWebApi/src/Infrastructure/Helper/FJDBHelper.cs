﻿using Microsoft.Data.SqlClient;
using System.Data;
using System.Reflection;

namespace ValuationWeb.Persistence.Helper
{
    /// <summary>
    /// Added by YReddy on 08/11/2022  
    /// Used to implement DB related transaction for entire application
    /// </summary>
    public class FJDBHelper
    {
        public static int timeout = 30;
        public static string TotalRecords = "TotalRecords";


        public static void ExecuteNonQuery(string commandText, string connSting, CommandType commandType = CommandType.Text,
                                           params DbParameter[] dbParameters)
        {
            using (var dbConnection = CommonDb.CreateDbConnection(connSting))
            {
                using (var dbCommand = dbConnection.CreateCommand())
                {
                    dbCommand.CommandType = commandType;
                    dbCommand.CommandText = commandText;
                    dbCommand.CommandTimeout = timeout;

                    if (dbParameters != null)
                    {
                        foreach (var dbParameter in dbParameters)
                        {
                            dbCommand.Parameters.Add(dbParameter);
                        }
                    }

                    dbConnection.Open();
                    dbCommand.ExecuteNonQuery();
                }
            }
        }
        public static void ExecuteNonQueryWithTimeOut(string commandText, string connSting, int conntimeOut,
                CommandType commandType = CommandType.Text, params DbParameter[] dbParameters)
        {
            using (var dbConnection = CommonDb.CreateDbConnection(connSting))
            {
                using (var dbCommand = dbConnection.CreateCommand())
                {
                    dbCommand.CommandType = commandType;
                    dbCommand.CommandText = commandText;
                    dbCommand.CommandTimeout = conntimeOut;

                    if (dbParameters != null)
                    {
                        foreach (var dbParameter in dbParameters)
                        {
                            dbCommand.Parameters.Add(dbParameter);
                        }
                    }

                    dbConnection.Open();
                    dbCommand.ExecuteNonQuery();
                }
            }
        }


        public static List<T> ExecuteMappedReader<T>(string commandText, string connSting, CommandType commandType = CommandType.Text, params DbParameter[] dbParameters) where T : new()
        {
            using (SqlConnection dbConnection = new SqlConnection(connSting))
            {
                using (SqlCommand dbCommand = new SqlCommand(commandText, dbConnection))
                {
                    dbCommand.CommandType = commandType;
                    dbCommand.CommandText = commandText;
                    dbCommand.CommandTimeout = timeout;
                    if (dbParameters != null)
                    {
                        foreach (var dbParameter in dbParameters)
                        {
                            CommonDb.AddParameter(dbCommand, dbParameter.Name, dbParameter.Value, dbParameter.FieldType);
                        }
                    }

                    dbConnection.Open();
                    SqlDataReader dr = dbCommand.ExecuteReader();
                    return DataReaderExtensions.MapToList<T>(dr);
                }
            }
        }

        public static T ExecuteSingleMappedReader<T>(string commandText, string connSting, CommandType commandType = CommandType.Text, params DbParameter[] dbParameters) where T : new()
        {
            using (SqlConnection dbConnection = new SqlConnection(connSting))
            {
                using (SqlCommand dbCommand = new SqlCommand(commandText, dbConnection))
                {
                    dbCommand.CommandType = commandType;
                    dbCommand.CommandText = commandText;
                    dbCommand.CommandTimeout = timeout;
                    if (dbParameters != null)
                    {
                        foreach (var dbParameter in dbParameters)
                        {
                            CommonDb.AddParameter(dbCommand, dbParameter.Name, dbParameter.Value, dbParameter.FieldType);
                        }
                    }

                    dbConnection.Open();
                    SqlDataReader dr = dbCommand.ExecuteReader();
                    return DataReaderExtensions.MapToSingle<T>(dr);
                }
            }
        }

        public static void ExecuteReader(string commandText, string connSting, Action<IDataReader> recordHandler,
                        CommandType commandType = CommandType.Text, params DbParameter[] dbParameters)
        {
            using (var dbConnection = CommonDb.CreateDbConnection(connSting))
            {
                using (var dbCommand = dbConnection.CreateCommand())
                {
                    dbCommand.CommandType = commandType;
                    dbCommand.CommandText = commandText;
                    dbCommand.CommandTimeout = timeout;
                    if (dbParameters != null)
                    {
                        foreach (var dbParameter in dbParameters)
                        {
                            CommonDb.AddParameter(dbCommand, dbParameter.Name, dbParameter.Value, dbParameter.FieldType);
                        }
                    }

                    dbConnection.Open();
                    var reader = dbCommand.ExecuteReader();
                    while (reader.Read())
                    {
                        recordHandler(reader);
                    }
                }
            }
        }

        public static IDataReader GetReader(string commandText, string connSting, CommandType commandType = CommandType.Text, params DbParameter[] dbParameters)
        {
            var dbConnection = CommonDb.CreateDbConnection(connSting);

            using (var dbCommand = dbConnection.CreateCommand())
            {
                dbCommand.CommandType = commandType;
                dbCommand.CommandText = commandText;
                dbCommand.CommandTimeout = timeout;

                if (dbParameters != null)
                {
                    foreach (var dbParameter in dbParameters)
                    {
                        CommonDb.AddParameter(dbCommand, dbParameter.Name, dbParameter.Value, dbParameter.FieldType);
                    }
                }
                dbConnection.Open();
                return dbCommand.ExecuteReader(CommandBehavior.CloseConnection);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="commandText"></param>
        /// <param name="connSting"></param>
        /// <param name="Count"></param>
        /// <param name="commandType"></param>
        /// <param name="dbParameters"></param>
        /// <returns></returns>
        public static List<T> ExecuteMappedReaderWithOutputParameter<T>(string commandText, string connSting, out int Count, CommandType commandType = CommandType.Text,
                   params DbParameter[] dbParameters) where T : new()
        {
            using SqlConnection dbConnection = new SqlConnection(connSting);
            using SqlCommand dbCommand = new SqlCommand(commandText, dbConnection)
            {
                CommandType = commandType,
                CommandText = commandText,
                CommandTimeout = timeout
            };
            if (dbParameters != null)
            {
                foreach (var dbParameter in dbParameters)
                {
                    CommonDb.AddParameter(dbCommand, dbParameter.Name, dbParameter.Value, dbParameter.FieldType);
                }
            }

            dbConnection.Open();
            SqlDataReader dr = dbCommand.ExecuteReader();

            //Read Total records 
            Count = 0;
            while (dr.Read())
            {
                Count = dr.GetValue<int>(TotalRecords);
            }

            //Read results
            dr.NextResult();
            return DataReaderExtensions.MapToList<T>(dr);
        }
    }

    public static class ConvertHelper
    {
        public static TResult ConvertDbValue<TResult>(object dbValue)
        {
            if (dbValue == null || dbValue is DBNull)
            {
                return default(TResult);
            }

            var resultType = typeof(TResult);
            if (resultType.IsGenericType && resultType.GetGenericTypeDefinition() == typeof(Nullable<>))
            {
                resultType = Nullable.GetUnderlyingType(resultType);
            }

            return (TResult)Convert.ChangeType(dbValue, resultType);
        }

        public static object ConvertDbValue(object dbValue, Type type)
        {
            if (dbValue == null || dbValue is DBNull)
            {
                return GetDefault(type);
            }

            var resultType = type;

            if (type.IsGenericType && type.GetGenericTypeDefinition() == typeof(Nullable<>))
            {
                resultType = Nullable.GetUnderlyingType(type);
            }

            return Convert.ChangeType(dbValue, resultType);
        }

        public static object GetDefault(Type type)
        {
            return type.IsValueType ? Activator.CreateInstance(type) : null;
        }

        public static TResult GetValue<TResult>(this IDataReader reader, string fieldName)
        {
            var dbValue = reader[fieldName];
            return ConvertDbValue<TResult>(dbValue);
        }
    }

    public static class CommonDb
    {
        public static IDbConnection CreateDbConnection(string ConnectionString)
        {
            return new SqlConnection(ConnectionString);
        }

        public static IDataParameter AddParameter(IDbCommand Command, string ParmName, object ParmValue, FieldTypeEnum ParmFieldType)
        {

            SqlParameter p;
            switch (ParmFieldType)
            {
                case FieldTypeEnum.FieldTypeLongVarchar:
                case FieldTypeEnum.FieldTypeText:
                    {
                        p = new SqlParameter("@" + ParmName, SqlDbType.Text);
                        p.Value = ParmValue;
                        break;
                    }
                case FieldTypeEnum.FieldTypeNText:
                    {
                        p = new SqlParameter("@" + ParmName, SqlDbType.NText);
                        p.Value = ParmValue;
                        break;
                    }
                default:
                    {
                        p = new SqlParameter("@" + ParmName, ParmValue);
                        break;
                    }
            }

            if (ParmValue == null || ParmValue.Equals(string.Empty))
            {
                p.Value = DBNull.Value;
            }

            Command.Parameters.Add(p);
            return p;
        }
    }

    public class DbParameter
    {
        public string Name { get; set; }
        public object Value { get; set; }
        public FieldTypeEnum FieldType { get; set; }
        public int Length { get; set; }
        public ParameterDirection Direction { get; set; }

        public DbParameter(string name, object value, FieldTypeEnum fieldType, int length = 0, ParameterDirection direction = ParameterDirection.Input)
        {
            Name = name;
            Value = value;
            FieldType = fieldType;
            Length = length;
            Direction = direction;
        }

        public static implicit operator DbParameter(SqlParameter v)
        {
            throw new NotImplementedException();
        }
    }

    public enum FieldTypeEnum
    {
        FieldTypeVarchar = 0,
        FieldTypeNumber = 1,
        FieldTypeBoolean = 2,
        FieldTypeDate = 3,
        FieldTypeLongVarchar = 4,
        FieldTypeText = 39, // Alternate name 
        FieldTypeValidValues = 5,
        FieldTypeForeignKey = 6,
        FieldTypeMultiLine = 7,
        FieldTypeInteger = 8,
        FieldTypePercent = 9,
        FieldTypeCurrency = 10,
        FieldTypeTime = 11,
        FieldTypeDateTime = 12,
        FieldTypeZipCode = 13,
        FieldTypePhone = 14,
        FieldTypeState = 15,
        FieldTypeHTML = 27,
        FieldTypeEmail = 28,
        FieldTypeBirthDate = 29,
        FieldTypeNText = 40, // Alternate name
        FieldTypeUTCDateTime = 37
    }

    public static class DataReaderExtensions
    {
        /// <Summary>
        /// Map data from DataReader to list of objects
        /// </Summary>
        /// <typeparam name="T">Object</typeparam>
        /// <param name="dr">Data Reader</param>
        /// <returns>List of objects having data from data reader</returns>
        public static List<T> MapToList<T>(this SqlDataReader dr) where T : new()
        {
            List<T> RetVal = null;
            var Entity = typeof(T);
            var PropDict = new Dictionary<string, PropertyInfo>();

            if (dr != null && dr.HasRows)
            {
                RetVal = new List<T>();
                var Props = Entity.GetProperties(BindingFlags.Instance | BindingFlags.Public);
                PropDict = Props.ToDictionary(p => p.Name.ToUpper(), p => p);
                while (dr.Read())
                {
                    T newObject = new T();
                    for (int Index = 0; Index < dr.FieldCount; Index++)
                    {
                        if (PropDict.ContainsKey(dr.GetName(Index).ToUpper()))
                        {
                            var Info = PropDict[dr.GetName(Index).ToUpper()];
                            if ((Info != null) && Info.CanWrite)
                            {
                                var Val = dr.GetValue(Index);
                                Info.SetValue(newObject, (Val == DBNull.Value) ? null : Val, null);
                            }
                        }
                    }
                    RetVal.Add(newObject);
                }
            }
            else if (dr != null)
            {
                RetVal = new List<T>();
            }
            else if (dr != null)
                RetVal = new List<T>();

            return RetVal;
        }
        /// <Summary>
        /// Map data from DataReader to an object
        /// </Summary>
        /// <typeparam name="T">Object</typeparam>
        /// <param name="dr">Data Reader</param>
        /// <returns>Object having data from Data Reader</returns>
        public static T MapToSingle<T>(this SqlDataReader dr) where T : new()
        {
            T RetVal = new T();
            var Entity = typeof(T);
            var PropDict = new Dictionary<string, PropertyInfo>();

            if (dr != null && dr.HasRows)
            {
                var Props = Entity.GetProperties(BindingFlags.Instance | BindingFlags.Public);
                PropDict = Props.ToDictionary(p => p.Name.ToUpper(), p => p);
                while (dr.Read())
                {
                    for (int Index = 0; Index < dr.FieldCount; Index++)
                    {
                        if (PropDict.ContainsKey(dr.GetName(Index).ToUpper()))
                        {
                            var Info = PropDict[dr.GetName(Index).ToUpper()];
                            if ((Info != null) && Info.CanWrite)
                            {
                                var Val = dr.GetValue(Index);
                                Info.SetValue(RetVal, (Val == DBNull.Value) ? null : Val, null);
                            }
                        }
                    }
                }
            }
            return RetVal;
        }
    }
}

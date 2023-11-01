using System.Collections;
using System.Data;
using System.Reflection;

namespace Eltizam.Data.DataAccess.Helper
{
    /// <summary>
    /// Added by YReddy 
    /// Class used to generate Datatable from list and vice versa
    /// </summary>
    public static class DataTableHelper
    {
        private static Hashtable Hash = new Hashtable();

        public static List<T> ToList<T>(this DataTable dt)
        {
            List<T> data = new List<T>();
            foreach (DataRow row in dt.Rows)
            {
                T item = GetItem<T>(row);
                data.Add(item);
            }
            return data;
        }

        /// <summary>
        /// Get datatable from list objects
        /// Changed by YReddy to make it extension method
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="items"></param>
        /// <returns></returns>
        public static DataTable ToDataTable<T>(this List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);

            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Defining type of data column gives proper data table 
                var type = (prop.PropertyType.IsGenericType && prop.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>) ? 
                            Nullable.GetUnderlyingType(prop.PropertyType) : prop.PropertyType);

                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name, type);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }

            //put a breakpoint here and check datatable
            return dataTable;
        }

        public static DataTable RemoveColumn(this DataTable table, string columnName)
        {
            if (table.Columns.Contains(columnName))
                table.Columns.Remove(columnName);

            return table;
        }

        /// <summary>
        /// Added by YReddy
        /// Method to get Table Columns
        /// </summary>
        /// <param name="table">The dataTable</param>
        /// <returns>array of string</returns>
        public static string[] ColumnNames(this DataTable table)
        {
            return table == null ? null : table.Columns.Cast<DataColumn>().Select(x => x.ColumnName).ToArray();
        }

        private static T GetItem<T>(DataRow dr)
        {
            Type temp = typeof(T);
            T obj = Activator.CreateInstance<T>();

            foreach (DataColumn column in dr.Table.Columns)
            {
                foreach (PropertyInfo pro in temp.GetProperties())
                {
                    if (pro.Name == column.ColumnName)
                        pro.SetValue(obj, dr[column.ColumnName], null);
                    else
                        continue;
                }
            }
            return obj;
        }

        public static object GetNull(Type type)
        {
            if (type == typeof(string))
                return null;
            if (type == typeof(int))
                return 0;
            if (type == typeof(long))
                return 0;
            if (type == typeof(bool))
                return false;
            if (type == typeof(Decimal))
                return 0M;
            else
                return null;
        }

        public static T CastTo<T>(this object val)
        {
            return (T)((val == DBNull.Value || val == null) ? GetNull(typeof(T)) : Cast(Convert.ToString(val), typeof(T)));
        }

        public static object CastTo(this object val, Type type)
        {
            return (val == DBNull.Value || val == null) ? GetNull(type) : Cast(Convert.ToString(val), type);
        }

        public static string Join(this string[] array, string separator = ",")
        {
            return (array == null || array.Length <= 0) ? string.Empty : string.Join(separator, array);
        }

        public static object Cast(string val, Type type)
        {
            if (type == typeof(string)) return val;
            else if (string.IsNullOrWhiteSpace(val)) return GetNull(type);
            else if (type == typeof(int) || type == typeof(int?)) return int.Parse(val);
            else if (type == typeof(long) || type == typeof(long?)) return long.Parse(val);
            else if (type == typeof(bool) || type == typeof(bool?))
            {
                try
                {
                    return bool.Parse(val);
                }
                catch
                {
                    if (val.ToUpper().Equals("YES")) return true;
                    else if (val.ToUpper().Equals("TRUE")) return true;
                    else if (val.ToUpper().Equals("1")) return true;
                    else if (val.ToUpper().Equals("NO")) return false;
                    else if (val.ToUpper().Equals("FALSE")) return false;
                    else if (val.ToUpper().Equals("0")) return false;
                    else throw;
                }
            }
            else if (type == typeof(DateTime) || type == typeof(DateTime?))
            {
                if (!DateTime.TryParse(val, out DateTime Date))
                {
                    if (double.TryParse(val, out double _DoubleVal))
                    {
                        Date = DateTime.FromOADate(_DoubleVal);
                    }
                }

                return Date;
            }
            else if (type == typeof(TimeSpan) || type == typeof(TimeSpan?)) return TimeSpan.Parse(val);
            else if (type == typeof(byte) || type == typeof(byte?)) return byte.Parse(val);
            else if (type == typeof(decimal) || type == typeof(decimal?)) return decimal.Parse(val);
            else if (type == typeof(double) || type == typeof(double?)) return double.Parse(val);
            else if (type == typeof(string[]) && val != null) return val.Split(';');
            else if (type.IsEnum) return Enum.Parse(type, val, true);
            else if (type == typeof(int[]) && val != null) { string[] sarr = val.Split(';'); int[] iarr = new int[sarr.Length]; for (int i = 0; i < sarr.Length; i++) iarr[i] = int.Parse(sarr[i]); return iarr; }
            else return val;
        }

        /// <summary>
        /// Added by  YReddy
        /// Method to get all the Properties of a specified type
        /// </summary>
        /// <param name="type">the type</param>
        /// <returns></returns>
        public static PropertyInfo[] GetProperties(Type type)
        {
            string typeName = type.AssemblyQualifiedName;
            if (Hash[typeName] != null)
                return (PropertyInfo[])Hash[typeName];

            PropertyInfo[] props = type.GetProperties(BindingFlags.Instance | BindingFlags.Public);
            Hash[typeName] = props;
            return props;
        }

        /// <summary>
        /// Added by YReddy
        /// Method to convert DataRowView into specified type
        /// </summary>
        /// <typeparam name="T">the type of list</typeparam>
        /// <param name="rowView">the DataRowView to convert</param>
        /// <returns></returns>
        public static T FillObjectFromDataRowView<T>(DataRowView rowView)
        {
            Type type = typeof(T);

            // instantiate the type
            T obj = (T)Activator.CreateInstance(type);

            // get type properties
            PropertyInfo[] props = GetProperties(type);

            for (int i = 0; i < props.Length; i++)
            {
                string propName = props[i].Name;

                try
                {
                    // verify if there is such a column
                    if (!rowView.Row.Table.Columns.Contains(propName.ToLower()))
                    {
                        // if not, we move to another property
                        // because this one we cannot set
                        continue;
                    }

                    object propVal = rowView[propName];
                    if (propVal == DBNull.Value)
                        props[i].SetValue(obj, GetNull(props[i].PropertyType), null);
                    else
                    {
                        try
                        {
                            string strVal = propVal.ToString();

                            //convert to DateTime 
                            if (props[i].PropertyType.UnderlyingSystemType.FullName == typeof(DateTime).FullName)
                            {
                                DateTime date = DateTime.MinValue;
                                if (DateTime.TryParse(strVal, out date))
                                {
                                    props[i].SetValue(obj, date, null);
                                }
                            }
                            else if (props[i].PropertyType.UnderlyingSystemType.FullName == typeof(DateTime?).FullName)
                            {
                                if (!string.IsNullOrWhiteSpace(strVal) && Convert.ToDateTime(propVal) != DateTime.MinValue && DateTime.TryParse(strVal, out DateTime date))
                                {
                                    props[i].SetValue(obj, date, null);
                                }
                                else
                                {
                                    props[i].SetValue(obj, null, null);
                                }
                            }
                            else
                            {
                                //Convert generic
                                props[i].SetValue(obj, Cast(strVal, props[i].PropertyType), null);
                            }
                        }
                        catch
                        {
                            // skip property init 
                        }
                    }
                }
                catch { } // just skip
            } // for properties

            return obj;
        }

        /// <summary>
        /// Added by YReddy
        /// Method to convert DataView into specified type
        /// </summary>
        /// <typeparam name="T">the type of list</typeparam>
        /// <param name="view">the DataView to convert</param>
        /// <returns></returns>
        public static T FillObjectFromDataView<T>(this DataView view)
        {
            Type type = typeof(T);

            // instantiate the type
            T obj = (T)Activator.CreateInstance(type);

            // iterate through reader
            foreach (DataRowView dr in view)
            {
                obj = FillObjectFromDataRowView<T>(dr);
            }

            return obj;
        }

        /// <summary>
        /// Added by YReddy
        /// Method to convert DataView into list of specified types
        /// </summary>
        /// <typeparam name="T">the type of list</typeparam>
        /// <param name="destinationList">the list object after conversion</param>
        /// <param name="view">the DataView to convert</param>
        public static void FillCollectionFromDataView<T>(IList<T> destinationList, DataView view)
        {
            destinationList = (destinationList == null) ? new List<T>() : destinationList;
            Type type = typeof(T); 
            PropertyInfo[] props = GetProperties(type);

            foreach (DataRowView row in view)
            {
                // create an instance
                T obj = (T)Activator.CreateInstance(type); destinationList.Add(obj);

                // fill properties
                for (int i = 0; i < props.Length; i++)
                {
                    string propName = props[i].Name;
                    if (view.Table.Columns[propName] == null) continue;

                    object propVal = row[propName];
                    if (propVal == DBNull.Value) { props[i].SetValue(obj, GetNull(props[i].PropertyType), null); }
                    else
                    {
                        try
                        {
                            // try implicit type conversion
                            props[i].SetValue(obj, propVal, null);
                        }
                        catch
                        {
                            // convert to string and then set property value
                            try
                            {
                                string strVal = propVal.ToString();
                                props[i].SetValue(obj, Cast(strVal, props[i].PropertyType), null);
                            }
                            catch
                            {
                                // skip property init
                            }
                        }
                    }
                } // for properties
            } // for rows
        }

        public static DateTime ParseExcelDate(this string date)
        {
            DateTime dt;
            if (DateTime.TryParse(date, out dt))
            {
                return dt;
            }

            double oaDate;
            if (double.TryParse(date, out oaDate))
            {
                return DateTime.FromOADate(oaDate);
            }

            return DateTime.MinValue;
        }
    } 
}

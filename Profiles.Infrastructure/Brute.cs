using System;
using System.ComponentModel;

namespace Profiles.Infrastructure
{
    public static class Brute
    {
        public static TValue GetValue<TValue>(object source, string propertyName)
        {
            foreach(PropertyDescriptor prop in TypeDescriptor.GetProperties(source.GetType()))
            {
                if (prop.Name == propertyName)
                {
                    return (TValue)prop.GetValue(source);
                }
            }

            return default(TValue);
        }

        public static void SetValue<TValue>(object source, string propertyName, TValue value)
        {
            foreach(PropertyDescriptor prop in TypeDescriptor.GetProperties(source.GetType()))
            {
                if (prop.Name == propertyName
                    && prop.PropertyType == typeof(TValue)
                    && !prop.IsReadOnly)
                {
                    prop.SetValue(source, value);
                    return;
                }
            }
        }

        public static TTarget Cast<TTarget>(object source) where TTarget : new()
        {
            var target = Activator.CreateInstance<TTarget>();

            foreach (PropertyDescriptor sourceProp in TypeDescriptor.GetProperties(source.GetType()))
            {
                foreach (PropertyDescriptor targetProp in TypeDescriptor.GetProperties(typeof(TTarget)))
                {
                    if (sourceProp.Name == targetProp.Name
                        && sourceProp.PropertyType == targetProp.PropertyType
                        && !targetProp.IsReadOnly)
                    {
                        var value = sourceProp.GetValue(source);
                        targetProp.SetValue(target, value);
                        break;
                    }
                }
            }

            return target;
        }
    }
}

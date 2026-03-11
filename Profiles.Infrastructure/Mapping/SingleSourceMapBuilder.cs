using System;

namespace Profiles.Infrastructure.Mapping
{
    public class SingleSourceMapBuilder<TSource, TTarget> : ISingleSourceMapBuilder<TSource, TTarget>
    {
        internal SingleSourceMapBuilder()
        {
        } 

        public ISingleSourceMap<TSource, TTarget> Using<TMap>() 
            where TMap : ISingleSourceMap<TSource, TTarget>, new()
        {
            return Activator.CreateInstance<TMap>();
        }
    }
}

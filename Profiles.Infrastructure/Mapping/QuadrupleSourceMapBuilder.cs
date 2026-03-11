using System;

namespace Profiles.Infrastructure.Mapping
{
    public class QuadrupleSourceMapBuilder<TSource1, TSource2, TSource3, TSource4, TTarget> : IQuadrupleSourceMapBuilder<TSource1, TSource2, TSource3, TSource4, TTarget>
    {
        internal QuadrupleSourceMapBuilder()
        {
        }

        public IQuadrupleSourceMap<TSource1, TSource2, TSource3, TSource4, TTarget> Using<TMap>() where TMap : IQuadrupleSourceMap<TSource1, TSource2, TSource3, TSource4, TTarget>, new()
        {
            return Activator.CreateInstance<TMap>();
        }
    }
}

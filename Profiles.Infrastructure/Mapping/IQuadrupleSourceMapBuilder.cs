namespace Profiles.Infrastructure.Mapping
{
    public interface IQuadrupleSourceMapBuilder<TSource1, TSource2, TSource3, TSource4, TTarget>
    {
        /// <summary>
        /// Specifies the IQuadrupleSourceMap map to use when mapping the source to the target. 
        /// Note: The implementation of IQuadrupleSourceMap must contain an empty constructor
        /// </summary>
        /// <typeparam name="TMap">The type of IQuadrupleSourceMap</typeparam>
        /// <returns>An instance of the specified type of IQuadrupleSourceMap</returns>
        IQuadrupleSourceMap<TSource1, TSource2, TSource3, TSource4, TTarget> Using<TMap>()
            where TMap : IQuadrupleSourceMap<TSource1, TSource2, TSource3, TSource4, TTarget>, new();
    }
}
